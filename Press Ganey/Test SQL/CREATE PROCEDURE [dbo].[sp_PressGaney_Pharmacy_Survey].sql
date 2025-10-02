USE [ETLProcedureRepository]
GO
/****** Object:  StoredProcedure [dbo].[sp_PressGaney_Pharmacy_Survey]    Script Date: 9/10/2025 9:42:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 9/12/2025
------ Description:	get dataset for Press Ganey's Phama Survey

------ =============================================*/

CREATE PROCEDURE [dbo].[sp_PressGaney_Pharmacy_Survey] 
	@StartDate varchar(10)
	,@EndDate varchar(10)
	,@update int = 0
AS

BEGIN TRY
	SET NOCOUNT ON;



DECLARE 


        @StartDateInt BIGINT,
        @EndDateInt   BIGINT,
		@errmsg	varchar(255);

SELECT 
	--@StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
 --   @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);


	@StartDateInt =  20250821,
	@EndDateInt = 20250821;


-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters
-- This will be the driver for the data we need to pull
-- We will use a CTE to get the patient encounters and then join with other tables as needed
   
        ;WITH PatientEncounters AS (
			SELECT DISTINCT
				dep.DepartmentSpecialty,
				pat.PatientEpicId,
				pat.DurableKey,
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
				pat.AgeInYears,
				dep.LocationEpicId,
				dep.LocationName,
				prov.Npi,
				prov.Name as ProviderName,
				prov.Type as ProviderType,
				prov.PrimarySpecialty as ProviderSpeciality,
				dep.Address as ProviderAddress,
				dep.City as ProviderCity,
				dep.StateOrProvinceAbbreviation as ProviderState,
				dep.PostalCode as ProviderZipcode,
				dep.DepartmentKey,
                dep.DepartmentEpicId,
				dep.DepartmentName,
				dep.IsBed,
				dep.RoomName,
				dep.BedName,
				dep.ServiceAreaEpicId,
                meds.EncounterKey,
				meds.PatientDurableKey,
				meds.PatientKey,
                NULL as AdmissionSource,
                NULL as DischargeDisposition,
                NULL as PatientClass,
				NULL as AdmissionTimeOfDayKey,
				NULL as DischargeTimeOfDayKey,
				NULL as AdmissionDateKey,
			    NULL as DischargeDateKey,
				NULL as DischargeProviderDurableKey,
				NULL as AdmissionSourceCode,
				NULL as DischargeDispositionCode,
				NULL as DiagnosisComboKey,
				NULL as PrimaryDiagnosisKey,
				DispenseReceivedDateKey as DateKey  --This date is of the start of the encounter, visit, etc


            FROM CDW_report.FullAccess.MedicationDispenseFact as meds

				INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON meds.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1 --Most Current
				INNER JOIN CDW_report.FullAccess.MedicationOrderFact as medorder WITH (NOLOCK) ON  medorder.MedicationOrderKey = meds.MedicationOrderKey 
																		AND  medorder.SentToPharmacyKey = meds.DispensePharmacyKey 
																		AND medorder.PatientDurableKey = pat.DurableKey 
				
				LEFT JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON  prov.ProviderKey = medorder.OrderedByProviderKey 
				LEFT JOIN CDW_report.FullAccess.EncounterFact as en WITH (NOLOCK) ON en.EncounterKey = meds.EncounterKey
                --LEFT JOIN CDW_report.dbo.BillingAccountFact bill ON meds.PatientDurableKey = bill.PatientDurableKey
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON meds.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
            WHERE 
			meds.DispenseReceivedDateKey BETWEEN @StartDateInt AND @EndDateInt
			AND meds.Mode =  'Outpatient'
        ),-- We will also include the mobile numbers and crosstab the CPT codes for each patient encounter 
        MobileNumbers AS (
            SELECT
                p.DurableKey AS PatientDurableKey,
                ph.OTHER_COMMUNIC_NUM,
                ROW_NUMBER() OVER (PARTITION BY p.DurableKey ORDER BY ph.CONTACT_PRIORITY) AS rn
            FROM PatientEncounters p
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
    [Location Code] = inpat.LocationEpicId,
    [Location Name] = inpat.LocationName,
    [Department Code] = inpat.DepartmentEpicId,
    [Department Name] = inpat.DepartmentName,
    [Attending Physician NPI] = inpat.Npi,
    [Attending Physician Name] = inpat.ProviderName,
    [Provider Type] = inpat.ProviderType,
    [Provider specialty] = inpat.ProviderSpeciality,
    [Site address 1] = inpat.ProviderAddress,
    [Site address 2] = '',
    [Site city] = inpat.ProviderCity,
    [Site state] = inpat.ProviderState,
    [Site zip] = inpat.ProviderZipcode,
    [Patient Admission Source] = inpat.AdmissionSourceCode,
    [Visit or Admit Date] = CASE 
        WHEN inpat.AdmissionDateKey = '-1' THEN '' -- Return blank if -1
        WHEN inpat.AdmissionDateKey = '-2' THEN '' -- Return blank if -2
        WHEN inpat.AdmissionDateKey IS NULL THEN '' -- Return blank if NULL
        ELSE FORMAT(CONVERT(DATE, CAST(inpat.AdmissionDateKey AS CHAR(8)), 112),'MMddyyyy')
    END, 
    [Visit or Admit Time] = RIGHT('0000' + CAST(inpat.AdmissionTimeOfDayKey AS VARCHAR(4)), 4), -- Ensure time is in HHMM format
    [Discharge Date] = CASE 
        WHEN inpat.DischargeDateKey = '-1' THEN '' -- Return blank if -1
        WHEN inpat.DischargeDateKey = '-2' THEN '' -- Return blank if -2
        WHEN inpat.DischargeDateKey IS NULL THEN '' -- Return blank if NULL
        ELSE FORMAT(CONVERT(DATE, CAST(inpat.DischargeDateKey AS CHAR(8)), 112),'MMddyyyy')
    END, -- Format the date to MMddyyyy      
    [Patient Discharge Status] = inpat.DischargeDispositionCode,
    [Unit] = inpat.DepartmentName,
    [Service] = HospitalService,
    [Specialty] = inpat.DepartmentSpecialty,
    [Payor / Insurance / Financial Class] = '',-- cov.PayorName, -- Not required for Press Ganey
    --[Payor / Insurance / Financial Class] = cov.PayorName, 
    [Length of Stay] = LengthOfStayInDays,
    [Room] = inpat.RoomName,
    [Bed] = inpat.BedName,
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
    [Transferred/admitted to inpatient] = CASE WHEN inpat.DischargeDisposition =  'Admitted as an Inpatient to this Hospital' AND inpat.ProviderType = 'Surgery'  THEN 'Y' ELSE 'N' END,
    '$' EOR
FROM PatientEncounters inpat 
	LEFT JOIN CDW_report.FullAccess.DrgDim drg WITH (NOLOCK) ON inpat.PrimaryDiagnosisKey = drg.DrgKey AND drg.DrgCodeSet = 'MS-DRG'
	LEFT JOIN CDW_report.FullAccess.DiagnosisDim dia WITH (NOLOCK) ON inpat.PrimaryDiagnosisKey = dia.DiagnosisKey
	LEFT JOIN CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm WITH (NOLOCK) ON dia.DiagnosisKey = diaTerm.DiagnosisKey AND diaTerm.[Type] = 'ICD-10-CM'
	LEFT JOIN [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc WITH (NOLOCK) ON inpat.DepartmentKey = loc.DepartmentKey
	LEFT JOIN CDW_report.FullAccess.HospitalAdmissionFact ha WITH (NOLOCK) ON inpat.PatientDurableKey = ha.PatientDurableKey AND inpat.PatientKey = ha.PatientKey
	LEFT JOIN CDW_report.FullAccess.BedRequestFact bedreq WITH (NOLOCK) ON ha.AdmissionBedRequestKey = bedreq.BedRequestKey AND inpat.DepartmentKey = bedreq.DestinationBedKey AND inpat.IsBed = 1
	LEFT JOIN MobileNumbers mn	ON inpat.PatientDurableKey = mn.PatientDurableKey AND mn.rn = 1
	LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey
	--LEFT JOIN [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes]as PG_Lang_Code ON PG_Lang_Code.Language = inpat.PreferredWrittenLanguage_X

WHERE loc.PressGaneyId IS NOT NULL 






END TRY
BEGIN CATCH
	EXEC [ETLProcedureRepository].[dbo].[sp_logErrorInfo] 'sp_PressGaney_Rehab_Survey' ;
	THROW;
END CATCH


