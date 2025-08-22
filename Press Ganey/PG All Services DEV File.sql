/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 08/13/2025
------ Description:	get dataset for Press Ganey's New File Format for Survey's
------ This pull will be Encounter based
------ and will include all services
------ for MaineHealth
------
------ This is a test file for the new format
------ for Press Ganey

------ =============================================*/

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/17/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters
        ;WITH PatientEncounters AS (
			SELECT DISTINCT
				bill.AccountEpicId,
				ha.type,
                ha.PatientDurableKey, 
                ha.PatientKey, 
                ha.DepartmentKey,
                EncounterKey,
                AdmissionInstant,
                DischargeInstant,
                ha.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				DiagnosisComboKey,
				AdmissionTimeOfDayKey,
				DischargeTimeOfDayKey,
				bill.AdmissionDateKey,
				bill.DischargeDateKey,
				ProviderDurableKey,
				ha.AdmittingProviderDurableKey,
				DischargeProviderDurableKey,
				ha.PrimaryDiagnosisKey,
				bill.PrimaryCoverageKey,
				AdmissionSourceCode,
				DischargeDispositionCode,
				bill.AttendingProviderDurableKey,
				ProviderKey,
				loc.ServiceAreaEpicId
            FROM CDW_report.FullAccess.EncounterFact ha 
                INNER JOIN CDW_report.dbo.DurationDim d  ON ha.AgeKey = d.DurationKey 
                INNER JOIN CDW_report.dbo.BillingAccountFact bill ON ha.PatientDurableKey = bill.PatientDurableKey
               	INNER JOIN CDW_report.FullAccess.DepartmentDim loc  ON ha.DepartmentKey = loc.DepartmentKey
            WHERE bill.AdmissionDateKey BETWEEN @StartDateInt AND @EndDateInt
				--AND ha.[Type] IN ('Occupational Therapy','Physical Therapy','Hospital Encounter','Speech Therapy','Office Visit')
				AND ha.[Type] like ('Pharmacy Visit')
				AND loc.ServiceAreaEpicId = '110'
                AND d.Years > 17 -- exclude pediatric
        ),
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
    [Last Name] = pat.LastName,
    [Middle Initial] = LEFT(pat.MiddleName, 1),
    [First Name] = pat.FirstName,
    [Address 1] = pat.AddressLine1_X,
    [Address 2] = pat.AddressLine2_X,
    [City] = pat.City,
    [State] = pat.StateOrProvinceAbbreviation,
    [ZIP Code] = pat.PostalCode,
    [Telephone Number] = pat.HomePhoneNumber,
    [Mobile Number] = mn.OTHER_COMMUNIC_NUM,
    [MS-DRG] = drg.Code,
    [Gender] = CASE pat.Sex WHEN 'Male' THEN '1' WHEN 'Female' THEN '2' ELSE 'M' END,
    [Race] = pat.FirstRace,
    [Ethnicity] = 
        CASE 
            WHEN pat.Ethnicity IS NULL OR pat.Ethnicity IN ('', 'Unknown', 'Not Available', 'Missing') THEN 'Prefer not to answer'
            WHEN pat.Ethnicity IN ('Hispanic or Latino', 'Hispanic/Latino', 'Hispanic') THEN 'Hispanic/Latino'
            WHEN pat.Ethnicity IN ('Not Hispanic or Latino', 'Not Hispanic/Latino', 'Non-Hispanic') THEN 'Not Hispanic/Latino'
            ELSE pat.Ethnicity
        END,
    [Date of Birth] = CASE 
        WHEN pat.BirthDate IS NULL THEN NULL 
        ELSE FORMAT(pat.BirthDate, 'MMddyyyy') 
    END, -- Format the date to MMddyyyy
    [Language] = pat.PreferredWrittenLanguage_X,
	PG_Test = PG_Lang_Code.PG_Code,
    [Medical Record Number] = pat.EnterpriseId,
    [Unique ID] = inpat.AccountEpicId,
    [Location Code] = dep.LocationEpicId,
    [Location Name] = dep.LocationName,
    [Attending Physician NPI] = prov.Npi,
    [Attending Physician Name] = prov.Name,
    [Provider Type] = prov.Type,
    [Provider specialty] = prov.PrimarySpecialty,
    [Site address 1] = dep.Address,
    [Site address 2] = NULL,
    [Site city] = dep.City,
    [Site state] = dep.StateOrProvinceAbbreviation,
    [Site zip] = dep.PostalCode,
    [Patient Admission Source] = inpat.AdmissionSourceCode,
    [Visit or Admit Date] = CASE 
        WHEN inpat.AdmissionDateKey = '-1' THEN NULL -- Handle the case where AdmissionDateKey is -1
        WHEN inpat.AdmissionDateKey IS NULL THEN NULL -- Handle NULL values 
        ELSE FORMAT(CONVERT(DATE, CAST(inpat.AdmissionDateKey AS CHAR(8)), 112),'MMddyyyy')
    END, -- Format the date to MMddyyyy
    [Visit or Admit Time] = RIGHT('0000' + CAST(inpat.AdmissionTimeOfDayKey AS VARCHAR(4)), 4), -- Ensure time is in HHMM format
    [Discharge Date] = CASE 
        WHEN inpat.DischargeDateKey = '-1' THEN NULL -- Handle the case where DischargeDateKey is -1
        WHEN inpat.DischargeDateKey IS NULL THEN NULL -- Handle NULL values 
        ELSE FORMAT(CONVERT(DATE, CAST(inpat.DischargeDateKey AS CHAR(8)), 112),'MMddyyyy')
    END, -- Format the date to MMddyyyy
    [Patient Discharge Status] = inpat.DischargeDispositionCode,
    [Unit] = dep.DepartmentName,
    [Service] = HospitalService,
    [Specialty] = dep.DepartmentSpecialty,
    [Payor / Insurance / Financial Class] = cov.PayorName,
    [Length of Stay] = LengthOfStayInDays,
    [Room] = bed.RoomName,
    [Bed] = bed.BedName,
    [Hospitalist] = NULL,
    [Fast Track or Acute Flag] = NULL,
    [Email] = pat.EmailAddress,
    [Hospitalist_1] = NULL,
    [Hospitalist_2] = NULL,
    [ER_ADMIT] = CASE WHEN inpat.AdmissionSource = 'Emergency Room' THEN 'Y' ELSE 'N' END,
	[Other Diagnosis or Procedure Code] = NULL, 	
	[Procedure Code 1] =  cptPat.CPT1,
	[Procedure Code 2] =  cptPat.CPT2,
	[Procedure Code 3] =  cptPat.CPT3,
	[Procedure Code 4] =  cptPat.CPT4,
	[Procedure Code 5] =  cptPat.CPT5,
	[Procedure Code 6] =  cptPat.CPT6,
	[Deceased Flag] = case when pat.DeathDate is not null then 'Y' else 'N' end,	
    [No Publicity Flag] = 'N',
    [State Regulation Flag] = 'N',    [Newborn patient] = CASE WHEN inpat.PatientClass = 'Newborn' THEN 'Y' ELSE 'N' END,
    [Transferred/admitted to inpatient] = CASE WHEN inpat.DischargeDisposition =  'Admitted as an Inpatient to this Hospital' AND inpat.Type = 'Surgery'  THEN 'Y' ELSE 'N' END,
	'$' EOR
FROM PatientEncounters inpat
	INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON inpat.PatientDurableKey = pat.DurableKey AND inpat.PatientKey = pat.PatientKey
	INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON inpat.ProviderDurableKey = prov.DurableKey AND inpat.ProviderKey = prov.ProviderKey
	INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON inpat.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 --AND dep.LocationEpicId NOT IN ('11016', '11017')
	LEFT JOIN CDW_report.FullAccess.DrgDim drg WITH (NOLOCK )ON inpat.PrimaryDiagnosisKey = drg.DrgKey AND drg.DrgCodeSet = 'MS-DRG'
	LEFT JOIN CDW_report.FullAccess.DiagnosisDim dia WITH (NOLOCK) ON inpat.PrimaryDiagnosisKey = dia.DiagnosisKey
	INNER JOIN CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm WITH (NOLOCK)	ON dia.DiagnosisKey = diaTerm.DiagnosisKey AND diaTerm.[Type] = 'ICD-10-CM'
	LEFT JOIN CDW_report.FullAccess.CoverageDim cov WITH (NOLOCK) ON inpat.PrimaryCoverageKey = cov.CoverageKey	
	LEFT JOIN [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc WITH (NOLOCK) ON inpat.DepartmentKey = loc.DepartmentKey
	LEFT JOIN CDW_report.FullAccess.HospitalAdmissionFact ha WITH (NOLOCK)	ON inpat.PatientDurableKey = ha.PatientDurableKey AND inpat.PatientKey = ha.PatientKey
	LEFT JOIN CDW_report.FullAccess.BedRequestFact bedreq WITH (NOLOCK)	ON ha.AdmissionBedRequestKey = bedreq.BedRequestKey
	LEFT JOIN CDW_report.FullAccess.DepartmentDim bed WITH (NOLOCK)	ON bed.DepartmentKey = bedreq.DestinationBedKey AND bed.IsBed = 1
	LEFT JOIN MobileNumbers mn	ON pat.DurableKey = mn.PatientDurableKey AND mn.rn = 1
	LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey
	LEFT JOIN [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes]as PG_Lang_Code ON PG_Lang_Code.Language = pat.PreferredWrittenLanguage_X

WHERE loc.PressGaneyId IS NOT NULL AND	inpat.ServiceAreaEpicId = '110'


ORDER BY [Visit or Admit Date],   [Last Name]




--Select *  from [ETLProcedureRepository].[dbo].[PressGaneySurveyMap]  Where Service like '%REHAB%' and DepartmentEpicID = '11006240'

--Admitted as an Inpatient to this Hospital?

--Select  * from CDW_report.FullAccess.EncounterFact   Where DischargeDisposition =  'Admitted as an Inpatient to this Hospital' and Type = 'Surgery' 


--Select  *  from CDW_report.FullAccess.EncounterFact  where PatientClassCategoryKey = '11004010'


----Select *  from  CDW_report.FullAccess.SurgicalCaseFact

--Select * from CDW_Report.FullAccess.ProviderDim where PrimaryDepartmentEpicId = '11004010'

---- Languages not in PG vs Epic
--Select Distinct(PreferredWrittenLanguage_X) from CDW_Report.FullAccess.PatientDim
--Where PreferredWrittenLanguage_X  NOT IN (Select Language from [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes])
--order by PreferredWrittenLanguage_X






