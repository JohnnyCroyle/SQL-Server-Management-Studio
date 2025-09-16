

DECLARE @StartDate VARCHAR(10) = '08/24/2025',
        @EndDate   VARCHAR(10) = '08/30/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
  --  @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
   -- @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);


	@StartDateInt =  20250824,
	@EndDateInt = 20250830;



-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters
-- This will be the driver for the data we need to pull
-- We will use a CTE to get the patient encounters and then join with other tables as needed
   
        ;WITH PatientEncounters AS (
			SELECT DISTINCT
				pat.LastName,
				pat.MiddleName,
				pat.FirstName,
				pat.AddressLine1_X,
				pat.AddressLine2_X,
				pat.City,
				pat.StateOrProvinceAbbreviation,
				pat.PostalCode,
				pat.HomePhoneNumber,
				pat.Sex,
				pat.FirstRace,
				pat.SecondRace,
				pat.Ethnicity,
				pat.BirthDate,
				pat.SexAssignedAtBirth,
				pat.PreferredWrittenLanguage_X,
				pat.EnterpriseId,
				pat.DeathDate,
				pat.EmailAddress,
				bill.AccountEpicId, --Using Ecounter Key as Unique Visit Number instead
				en.type,
                en.PatientDurableKey, 
                en.PatientKey, 
                meds.DepartmentKey,
                en.EncounterKey,
                en.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				bill.DiagnosisComboKey,
				NULL as AdmissionTimeOfDayKey, --Not required for Press Ganey
                NULL as DischargeTimeOfDayKey, --Not required for Press Ganey 
				meds.DispenseReceivedDateKey as AdmissionDateKey, --This date is of the start of the encounter. Will use for Visits
                --NOTE to self: This is the date of the encounter, not the admission date. 
                --Probably should be used for Visits and not Admissions
				en.DischargeDateKey,
				en.AdmittingProviderDurableKey,
				DischargeProviderDurableKey,
				en.PrimaryDiagnosisKey,
				bill.PrimaryCoverageKey,
				AdmissionSourceCode,
				DischargeDispositionCode,
				bill.AttendingProviderDurableKey,
				loc.ServiceAreaEpicId,
				en.ProviderKey,
				en.ProviderDurableKey,
				ServiceAreaName,
				DepartmentName
            FROM CDW_report.FullAccess.MedicationDispenseFact as meds
				INNER JOIN CDW_Report.FullAccess.PatientDim pat  ON pat.PatientKey = meds.PatientKey
				LEFT JOIN CDW_report.FullAccess.EncounterFact as en ON en.EncounterKey = meds.EncounterKey
                INNER JOIN CDW_report.dbo.DurationDim d  ON d.DurationKey  = en.AgeKey
                LEFT JOIN CDW_report.dbo.BillingAccountFact bill ON en.PatientDurableKey = bill.PatientDurableKey
               	INNER JOIN CDW_report.FullAccess.DepartmentDim loc  ON meds.DepartmentKey = loc.DepartmentKey
            WHERE 
			meds.DispenseReceivedDateKey BETWEEN @StartDateInt AND @EndDateInt
			AND loc.ServiceAreaEpicId = '110'
			AND meds.Mode =  'Outpatient'
            --AND d.Years > 17 -- exclude pediatric
        ),-- We will also include the mobile numbers and crosstab the CPT codes for each patient encounter 
        MobileNumbers AS (
            SELECT
                p.DurableKey AS PatientDurableKey,
                ph.OTHER_COMMUNIC_NUM,
                ROW_NUMBER() OVER (PARTITION BY p.DurableKey ORDER BY ph.CONTACT_PRIORITY) AS rn
            FROM CDW_report.FullAccess.PatientDim p
				INNER JOIN CLARITY.dbo.OTHER_COMMUNCTN ph WITH (NOLOCK)
					ON p.PatientEpicId = ph.PAT_ID
					AND ph.OTHER_COMMUNIC_C = 1
        ),
		        -- Crosstab each surgery case into 6 procedure using a CTE
                -- This will allow us to have a fixed number of columns for the CPT codes
         CPTList as (
            select PatientDurableKey, PatientKey
                , max(case when rn = 1 then Cpt end) as CPT1
                , max(case when rn = 2 then Cpt end) as CPT2
                , max(case when rn = 3 then Cpt end) as CPT3
                , max(case when rn = 4 then Cpt end) as CPT4
                , max(case when rn = 5 then Cpt end) as CPT5
                , max(case when rn = 6 then Cpt end) as CPT6
            from (
                select top 6 with ties 
                    pat.PatientDurableKey, 
                    pat.PatientKey, 
                    coalesce(pro.CptCode, pro.Code) as Cpt,
                    ROW_NUMBER() over (partition by pat.PatientDurableKey order by pro.ProcedureKey) as rn
                from PatientEncounters pat
                inner join CDW_report.FullAccess.ProcedureBridge pro with (nolock) 
                    on pat.DiagnosisComboKey = pro.ProcedureComboKey
					where CptCode between '10004' and '69990' or CptCode between '93451' AND '93462' or CptCode between '93566' and '93572'
							or CptCode in ('92920', '92921','92928','92929','92978','93985','93986')
							or Code in ('G0104', 'G0105', 'G0121', 'G0260')
                order by ROW_NUMBER() over (partition by pat.PatientDurableKey order by pat.PatientKey)
            ) t
            group by PatientDurableKey, PatientKey
        )
        


-- Select the required fields and format them as per the new Press Ganey file format
-- Ensure to handle NULL values and format dates correctly
SELECT DISTINCT
    [Survey Designator] = 'SP0101', --TODO: Update this to the correct survey designator if needed
    [Client ID] = loc.PressGaneyId,
    [Last Name] = inpat.LastName,
    [Middle Initial] =  ISNULL(LEFT(inpat.MiddleName, 1), ''),
    [First Name] = inpat.FirstName,
    [Address 1] = inpat.AddressLine1_X,
    [Address 2] = inpat.AddressLine2_X,
    [Address 3] = CONVERT(nvarchar(50),''), -- need to change to whatever new field they create
    [City] = inpat.City,
    [State] = inpat.StateOrProvinceAbbreviation,
    [ZIP Code] = inpat.PostalCode,
    [Telephone Number] = inpat.HomePhoneNumber,
    [Mobile Number] = ISNULL(mn.OTHER_COMMUNIC_NUM,'') ,
    [MS-DRG] = ISNULL(drg.Code,''),
    -- '1' = Male, '2' = Female, 'U' = Unknown/Other
    [Gender] = CASE inpat.Sex WHEN 'Male' THEN '1' WHEN 'Female' THEN '2' ELSE 'U' END,
    [Race] = 
        CASE 
            WHEN inpat.FirstRace IS NULL OR inpat.FirstRace IN ('', 'Unknown', 'Not Available', 'Missing') THEN 'Prefer not to answer'
            WHEN inpat.FirstRace IN ('American Indian or Alaska Native', 'American Indian/Alaska Native', 'American Indian', 'Alaska Native') THEN 'American Indian or Alaskan Native'
            WHEN inpat.FirstRace IN ('Asian', 'Asian - Chinese', 'Asian - Indian', 'Asian - Japanese', 'Asian - Korean', 'Asian - Vietnamese', 'Asian - Filipino', 'Asian - Other') THEN 'Asian'
            WHEN inpat.FirstRace IN ('Black or African American', 'Black/African American', 'Black', 'African American') THEN 'Black or African American'
            WHEN inpat.FirstRace IN ('Native Hawaiian or Other Pacific Islander', 'Native Hawaiian', 'Pacific Islander', 'Native Hawaiian/Pacific Islander') THEN 'Native Hawaiian or other Pacific Islander'
            WHEN inpat.FirstRace IN ('White', 'Caucasian', 'White or Caucasian') THEN 'White or Caucasian'
            WHEN inpat.FirstRace IN ('Other', 'Other Race') THEN 'Other'
            -- Handle multiple race using both inpat.FirstRace and inpat.SecondRace
            WHEN inpat.FirstRace IN ('Two or more races', 'Multiple', 'Multiracial', 'More than one race')
                 OR inpat.SecondRace IN ('Two or more races', 'Multiple', 'Multiracial', 'More than one race')
                 OR (inpat.SecondRace IS NOT NULL AND inpat.SecondRace <> '' AND inpat.SecondRace <> inpat.FirstRace) THEN 'Two or more races'
            ELSE inpat.FirstRace
        END,
    [Ethnicity] = 
        CASE 
            WHEN inpat.Ethnicity IS NULL OR inpat.Ethnicity IN ('', 'Unknown', 'Not Available', 'Missing') THEN 'Prefer not to answer'
            WHEN inpat.Ethnicity IN ('Hispanic or Latino', 'Hispanic/Latino', 'Hispanic') THEN 'Hispanic/Latino'
            WHEN inpat.Ethnicity IN ('Not Hispanic or Latino', 'Not Hispanic/Latino', 'Non-Hispanic') THEN 'Not Hispanic/Latino'
            ELSE inpat.Ethnicity
        END,
    [Date of Birth] = CASE 
        WHEN inpat.BirthDate IS NULL THEN NULL 
        ELSE FORMAT(inpat.BirthDate, 'MMddyyyy') 
    END, -- Format the date to MMddyyyy
    --[Language] = ISNULL(PG_Lang_Code.PG_Code,'99'),
	[Language] = '99',
    [Medical Record Number] = inpat.EnterpriseId,
    [Unique ID] = inpat.EncounterKey,
    [Location Code] = dep.LocationEpicId,
    [Location Name] = dep.LocationName,
    [Attending Physician NPI] = prov.Npi,
    [Attending Physician Name] = prov.Name,
    [Provider Type] = prov.Type,
    [Provider specialty] = prov.PrimarySpecialty,
    [Site address 1] = dep.Address,
    [Site address 2] = '',
    [Site city] = dep.City,
    [Site state] = dep.StateOrProvinceAbbreviation,
    [Site zip] = dep.PostalCode,
    [Patient Admission Source] = inpat.AdmissionSourceCode,
    [Visit or Admit Date] = inpat.AdmissionDateKey,
    [Visit or Admit Time] = '',
    [Discharge Date] = '', -- Format the date to MMddyyyy      
    [Patient Discharge Status] = inpat.DischargeDispositionCode,
    [Unit] = dep.DepartmentName,
    [Service] = dep.ServiceAreaName,
    [Specialty] = dep.DepartmentSpecialty,
    [Payor / Insurance / Financial Class] = '',-- cov.PayorName, -- Not required for Press Ganey
    [Payor / Insurance / Financial Class] = cov.PayorName, 
    [Length of Stay] = '',
    [Room] = '',
    [Bed] = '',
    [Hospitalist] = '',
    [Fast Track or Acute Flag] = '',
    [Email] = inpat.EmailAddress,
    [Hospitalist_1] = '',
    [Hospitalist_2] = '',
    [ER_ADMIT] = CASE WHEN inpat.AdmissionSource = 'Emergency Room' THEN 'Y' ELSE 'N' END,
	[Other Diagnosis or Procedure Code] = '', 	
	[Procedure Code 1] =  cptPat.CPT1,
	[Procedure Code 2] =  cptPat.CPT2,
	[Procedure Code 3] =  cptPat.CPT3,
	[Procedure Code 4] =  cptPat.CPT4,
	[Procedure Code 5] =  cptPat.CPT5,
	[Procedure Code 6] =  cptPat.CPT6,
	[Deceased Flag] = CASE WHEN inpat.DeathDate IS NOT NULL THEN 'Y' ELSE 'N' END,	
    [No Publicity Flag] = 'N',
    [State Regulation Flag] = 'N',
    [Newborn patient] = CASE WHEN inpat.PatientClass = 'Newborn' THEN 'Y' ELSE 'N' END,
    [Transferred/admitted to inpatient] = CASE WHEN inpat.DischargeDisposition =  'Admitted as an Inpatient to this Hospital' AND inpat.Type = 'Surgery'  THEN 'Y' ELSE 'N' END,
    '$' EOR
FROM PatientEncounters inpat
	INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON inpat.PatientDurableKey = pat.DurableKey AND inpat.PatientKey = pat.PatientKey
	INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON inpat.ProviderDurableKey = prov.DurableKey AND inpat.ProviderKey = prov.ProviderKey
	INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON inpat.DepartmentKey = dep.DepartmentKey
	LEFT JOIN CDW_report.FullAccess.DrgDim drg WITH (NOLOCK )ON inpat.PrimaryDiagnosisKey = drg.DrgKey AND drg.DrgCodeSet = 'MS-DRG'
	LEFT JOIN CDW_report.FullAccess.CoverageDim cov WITH (NOLOCK) ON inpat.PrimaryCoverageKey = cov.CoverageKey -- Not required for Press Ganey	
	LEFT JOIN [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc WITH (NOLOCK) ON inpat.DepartmentKey = loc.DepartmentKey
	LEFT JOIN MobileNumbers mn	ON inpat.PatientDurableKey = mn.PatientDurableKey AND mn.rn = 1
	LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey
	--LEFT JOIN [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes]as PG_Lang_Code ON PG_Lang_Code.Language = inpat.PreferredWrittenLanguage_X

WHERE loc.PressGaneyId IS NOT NULL AND	inpat.ServiceAreaEpicId = '110'

Order by [Last Name]
