/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 08/13/2025
------ Description:	get dataset for Press Ganey's New File Format for Survey's
------ This pull will be Encounter based
------ and will include all services
------ for MaineHealth
------
------ PHARMACY - SP0101
------ This is a test file for the new format
------ for Press Ganey
------ Added Ethnicity and Race code base on the new Press Ganey file format ITTI specification document. 8/22/2025
------ Added Mobile Number to the file. 8/22/2025  
------ Added CPT codes to the file. 8/22/2025
------ Modified the file to include the new Press Ganey file format for Phamacy Visits. 9/12/2025



------ =============================================*/


IF OBJECT_ID(N'tempdb..#PressGaneyFile') IS NOT NULL
BEGIN
DROP TABLE #PressGaneyFile
END
GO

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/07/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT,
	    @file_type	  varchar(10) = 'SP0101',
		@maxD		  datetime, 
		@selfCorrectDate	int,
		@tmpDate			date,
		@errmsg			varchar(255),
		@ProcName		varchar(255)

		SET @ProcName = OBJECT_NAME(@@PROCID);

SELECT 
	@StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);



	--@StartDateInt =  20250821,
	--@EndDateInt = 20250821;


		if (@StartDate is null)
			set @StartDate = 't-30'
		if (@EndDate is null)
			set @EndDate = 't'   

		-- self-corrected lookback date for DR purpose
		select @maxD = max(created_date) from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] where file_type = @file_type
		select @selfCorrectDate = datediff(dd, @maxD, getdate())
		if (@maxD < DATEADD(dd, - 9, getdate()))
			select @StartDate = 't - ' + cast((30 + @selfCorrectDate) as varchar(2))  			
		
		select	@StartDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') as bigint)
				, @EndDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') as bigint)




-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters
-- This will be the driver for the data we need to pull
-- We will use a CTE to get the patient encounters and then join with other tables as needed
   
        ;WITH Patients AS (
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
				'' as PharmacyType,
				dep.IsBed,
				dep.RoomName,
				dep.BedName,
				dep.ServiceAreaEpicId,
                meds.MedicationDispenseKey as EncounterKey, -- this is not encounter key but I need a Prim key for tracking
				meds.PatientDurableKey,
				meds.PatientKey,
                NULL as AdmissionSource,
                NULL as DischargeDisposition,
                NULL as PatientClass,
				NULL as AdmissionTimeOfDayKey,
				NULL as DischargeTimeOfDayKey,
				DispenseReceivedDateKey as AdmissionDateKey,
			    NULL as DischargeDateKey,
				NULL as DischargeProviderDurableKey,
				NULL as AdmissionSourceCode,
				NULL as DischargeDispositionCode,
				NULL as DiagnosisComboKey,
				NULL as PrimaryDiagnosisKey,
				DispensePreparedDateKey as DateKey  --This date is of the start of the encounter, visit, etc
            FROM CDW_report.FullAccess.MedicationDispenseFact as meds
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON meds.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1 --Most Current
				LEFT JOIN CDW_report.FullAccess.MedicationOrderFact as medorder ON  medorder.MedicationOrderKey = meds.MedicationOrderKey 
																		AND  medorder.SentToPharmacyKey = meds.DispensePharmacyKey 
																		AND medorder.PatientDurableKey = pat.DurableKey 
				LEFT JOIN CDW_report.FullAccess.ProviderDim prov ON  prov.ProviderKey = medorder.OrderedByProviderKey 
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep ON meds.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
            WHERE 
			meds.DispensePreparedDateKey BETWEEN @StartDateInt AND @EndDateInt
			AND meds.Mode =  'Outpatient'
			AND FillStatus = 'Dispensed'
        ),-- We will also include the mobile numbers and crosstab the CPT codes for each patient encounter 
        MobileNumbers AS (
            SELECT
                p.DurableKey AS PatientDurableKey,
                ph.OTHER_COMMUNIC_NUM,
                ROW_NUMBER() OVER (PARTITION BY p.DurableKey ORDER BY ph.CONTACT_PRIORITY) AS rn
            FROM Patients p
				INNER JOIN CLARITY.dbo.OTHER_COMMUNCTN ph WITH (NOLOCK)
					ON p.PatientEpicId = ph.PAT_ID
					AND ph.OTHER_COMMUNIC_C = 1  AND ph.CONTACT_PRIORITY = 1
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
                from Patients pat
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
    -- '1' = Male, '2' = Female, 'M' = Unknown/Other
    [Gender] = CASE inpat.Sex WHEN 'Male' THEN '1' WHEN 'Female' THEN '2' ELSE 'M' END,
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
    [Language] = ISNULL(PG_Lang_Code.PG_Code,'99'),
	--[Language] = '99',
    [Medical Record Number] = inpat.EnterpriseId,
    [Unique ID] = inpat.EncounterKey,
    [Location Code] = inpat.LocationEpicId,
    [Location Name] = inpat.LocationName,
    [Department Code] = inpat.DepartmentEpicId,
    [Department Name] = inpat.DepartmentName,
	[PharmacyType] = inpat.PharmacyType,
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
INTO #PressGaneyFile FROM Patients inpat 
	LEFT JOIN CDW_report.FullAccess.DrgDim drg ON inpat.PrimaryDiagnosisKey = drg.DrgKey AND drg.DrgCodeSet = 'MS-DRG'
	LEFT JOIN CDW_report.FullAccess.DiagnosisDim dia  ON inpat.PrimaryDiagnosisKey = dia.DiagnosisKey
	LEFT JOIN CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm ON dia.DiagnosisKey = diaTerm.DiagnosisKey AND diaTerm.[Type] = 'ICD-10-CM'
	LEFT JOIN [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc ON inpat.DepartmentKey = loc.DepartmentKey
	LEFT JOIN CDW_report.FullAccess.HospitalAdmissionFact ha ON inpat.PatientDurableKey = ha.PatientDurableKey AND inpat.PatientKey = ha.PatientKey
	LEFT JOIN CDW_report.FullAccess.BedRequestFact bedreq ON ha.AdmissionBedRequestKey = bedreq.BedRequestKey AND inpat.DepartmentKey = bedreq.DestinationBedKey AND inpat.IsBed = 1
	LEFT JOIN MobileNumbers mn	ON inpat.PatientDurableKey = mn.PatientDurableKey AND mn.rn = 1
	LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey
	LEFT JOIN [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes]as PG_Lang_Code ON PG_Lang_Code.Language = inpat.PreferredWrittenLanguage_X

WHERE loc.PressGaneyId IS NOT NULL 



Select * from #PressGaneyFile





begin
	delete from #PressGaneyFile
	where [Unique ID] in (select [unique_ID] from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] where [file_type] = @file_type )

-- track the records that being sent this time
	insert into [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF ([file_type],[unique_ID])
	select @file_type, [Unique ID] from #PressGaneyFile
end


---- Output
INSERT INTO [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
SELECT *, @ProcName as CreatedBy, getdate()as CreatedDate FROM #PressGaneyFile



Select * from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]

-- restart process
--Delete from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
TRUNCATE TABLE [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
--	Delete   from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF]
--	Select * from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF]



	--Select * from  [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]