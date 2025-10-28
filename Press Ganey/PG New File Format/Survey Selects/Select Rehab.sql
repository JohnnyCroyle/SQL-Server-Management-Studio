USE [ETLProcedureRepository]
GO

Declare
	@StartDate varchar(10) = '8/1/2025',
	@EndDate varchar(10) = '10/11/2025'


	--TODO Primary Diag for all


IF OBJECT_ID('tempdb..#PressGaneyFile') IS NOT NULL
DROP TABLE #PressGaneyFile;


	declare @StartDateInt BIGINT,
			@EndDateInt   BIGINT,
			@file_type	  varchar(10) = 'OR0101',
			@maxD		  datetime, 
			@selfCorrectDate	int,
			@tmpDate			date,
			@errmsg			varchar(255),
			@ProcName		varchar(255)

		-- retrieve sp name for created by		
		SET @ProcName = OBJECT_NAME(@@PROCID);


		--if (@StartDate is null)
		--	set @StartDate = 't-30'
		--if (@EndDate is null)
		--	set @EndDate = 't'   

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
   
	;WITH PatientEncounters AS (
			SELECT DISTINCT * FROM (
				-- Combined query using UNION ALL
					-- {Encounter type = (Hospital Encounter) AND Specialty in (Occupational Therapy, Physical Therapy, Speech Therapy, Sports Medicine, Rehabilitation)}
					SELECT DISTINCT
						en.type as EncounterType,
						dep.DepartmentSpecialty,
						en.PatientDurableKey, 
						en.PatientKey,
						en.DateKey,
						en.ProviderKey,
						en.ProviderDurableKey,
						en.PrimaryDiagnosisKey,
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
						en.EncounterKey,
						en.DischargeDisposition,
						en.PatientClass,
						bill.DiagnosisComboKey,
						en.AdmissionDateKey,
						en.Date as EventDateTime,
						en.DischargeDateKey,
						bill.AdmissionTimeOfDayKey,
						bill.DischargeTimeOfDayKey,
						en.DischargeProviderDurableKey,
						en.AdmissionSourceCode,
						en.DischargeDispositionCode,
						bill.BillingAccountKey,
						dep.ServiceAreaEpicId
					FROM CDW_report.FullAccess.EncounterFact en 
						INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON en.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1
						INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
						INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
						LEFT JOIN CDW_report.dbo.BillingAccountFact bill WITH (NOLOCK) ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
					WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
						AND en.[Type] = 'Hospital Encounter'
						AND dep.DepartmentSpecialty IN ('Occupational Therapy', 'Physical Therapy', 'Speech Therapy', 'Sports Medicine', 'Rehabilitation')
						AND pat.AgeInYears >= 18
						AND pat.DeathDate IS NULL
						AND en.DerivedEncounterStatus = 'Complete'

					UNION ALL

					-- {Encounter type in (Occupational Therapy, Office Visit, Clinical Support, Behavioral Health, Nurse Triage, Results Follow-Up, Telemedicine, IMAT) AND Specialty = (Rehabilitation)}
					SELECT DISTINCT
						en.type as EncounterType,
						dep.DepartmentSpecialty,
						en.PatientDurableKey, 
						en.PatientKey,
						en.DateKey,
						en.ProviderKey,
						en.ProviderDurableKey,
						en.PrimaryDiagnosisKey,
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
						en.EncounterKey,
						en.DischargeDisposition,
						en.PatientClass,
						bill.DiagnosisComboKey,
						bill.AdmissionDateKey,
						en.Date as EventDateTime,
						en.DischargeDateKey,
						bill.AdmissionTimeOfDayKey,
						bill.DischargeTimeOfDayKey,
						en.DischargeProviderDurableKey,
						en.AdmissionSourceCode,
						en.DischargeDispositionCode,
						bill.BillingAccountKey,
						dep.ServiceAreaEpicId
					FROM CDW_report.FullAccess.EncounterFact en 
						INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON en.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1
						INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
						INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
						LEFT JOIN CDW_report.dbo.BillingAccountFact bill WITH (NOLOCK) ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
					WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
						AND en.[Type] IN ('Occupational Therapy', 'Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
						AND dep.DepartmentSpecialty = 'Rehabilitation'
						AND pat.AgeInYears >= 18
						AND pat.DeathDate IS NULL
						AND en.DerivedEncounterStatus = 'Complete'

					UNION ALL

					-- {Encounter Type in (Office Visit, Clinical Support, Behavioral Health, Nurse Triage, Results Follow-Up, Telemedicine, IMAT) AND Specialty in (Orthopedic, Sports Medicine)}
					SELECT DISTINCT
						en.type as EncounterType,
						dep.DepartmentSpecialty,
						en.PatientDurableKey, 
						en.PatientKey,
						en.DateKey,
						en.ProviderKey,
						en.ProviderDurableKey,
						en.PrimaryDiagnosisKey,
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
						en.EncounterKey,
						en.DischargeDisposition,
						en.PatientClass,
						bill.DiagnosisComboKey,
						ISNULL(bill.AdmissionDateKey,en.DateKey) as AdmissionDateKey,
						en.Date as EventDateTime,
						en.DischargeDateKey,
						bill.AdmissionTimeOfDayKey,
						bill.DischargeTimeOfDayKey,
						en.DischargeProviderDurableKey,
						en.AdmissionSourceCode,
						en.DischargeDispositionCode,
						bill.BillingAccountKey,
						dep.ServiceAreaEpicId
					FROM CDW_report.FullAccess.EncounterFact en 
						INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON en.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1
						INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
						INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
						LEFT JOIN CDW_report.dbo.BillingAccountFact bill WITH (NOLOCK) ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
					WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
						AND en.[Type] IN ('Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
						AND dep.DepartmentSpecialty IN ('Orthopedic', 'Sports Medicine')
						AND pat.AgeInYears >= 18
						AND pat.DeathDate IS NULL
						AND en.DerivedEncounterStatus = 'Complete'


					UNION ALL

					-- {Encounter Type in (Physical Therapy, Office Visit, Clinical Support, Behavioral Health, Nurse Triage, Results Follow-Up, Telemedicine, IMAT) AND Specialty in (Physical Therapy, Orthopedic, Sports Medicine, Rehabilitation)}
					SELECT DISTINCT
						en.type as EncounterType,
						dep.DepartmentSpecialty,
						en.PatientDurableKey, 
						en.PatientKey,
						en.DateKey,
						en.ProviderKey,
						en.ProviderDurableKey,
						en.PrimaryDiagnosisKey,
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
						en.EncounterKey,
						en.DischargeDisposition,
						en.PatientClass,
						bill.DiagnosisComboKey,
						ISNULL(bill.AdmissionDateKey,en.DateKey) as AdmissionDateKey,
						en.Date as EventDateTime,
						en.DischargeDateKey,
						bill.AdmissionTimeOfDayKey,
						bill.DischargeTimeOfDayKey,
						en.DischargeProviderDurableKey,
						en.AdmissionSourceCode,
						en.DischargeDispositionCode,
						bill.BillingAccountKey,
						dep.ServiceAreaEpicId
					FROM CDW_report.FullAccess.EncounterFact en 
						INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON en.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1
						INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
						INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
						LEFT JOIN CDW_report.dbo.BillingAccountFact bill WITH (NOLOCK) ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
					WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
						AND en.[Type] IN ('Physical Therapy', 'Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
						AND dep.DepartmentSpecialty IN ('Physical Therapy', 'Orthopedic', 'Sports Medicine', 'Rehabilitation')
						AND pat.AgeInYears >= 18
						AND pat.DeathDate IS NULL
						AND en.DerivedEncounterStatus = 'Complete'

					UNION ALL

					-- {Encounter Type in (Speech Therapy, Office Visit, Clinical Support, Behavioral Health, Nurse Triage, Results Follow-Up, Telemedicine, IMAT) AND Specialty in (Speech Therapy, Rehabilitation)}
					SELECT DISTINCT
						en.type as EncounterType,
						dep.DepartmentSpecialty,
						en.PatientDurableKey, 
						en.PatientKey,
						en.DateKey,
						en.ProviderKey,
						en.ProviderDurableKey,
						en.PrimaryDiagnosisKey,
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
						en.EncounterKey,
						en.DischargeDisposition,
						en.PatientClass,
						bill.DiagnosisComboKey,
						ISNULL(bill.AdmissionDateKey,en.DateKey) as AdmissionDateKey,
						en.Date as EventDateTime,
						en.DischargeDateKey,
						bill.AdmissionTimeOfDayKey,
						bill.DischargeTimeOfDayKey,
						en.DischargeProviderDurableKey,
						en.AdmissionSourceCode,
						en.DischargeDispositionCode,
						bill.BillingAccountKey,
						dep.ServiceAreaEpicId
					FROM CDW_report.FullAccess.EncounterFact en 
						INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON en.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1
						INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
						INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
						LEFT JOIN CDW_report.dbo.BillingAccountFact bill WITH (NOLOCK) ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
					WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
						AND en.[Type] IN ('Speech Therapy', 'Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
						AND dep.DepartmentSpecialty IN ('Speech Therapy', 'Rehabilitation')
						AND pat.AgeInYears >= 18
						AND pat.DeathDate IS NULL
						AND en.DerivedEncounterStatus = 'Complete'

				) AllEncounters

        ),-- We will also include the mobile numbers and crosstab the CPT codes for each patient encounter 
        MobileNumbers AS (
            SELECT
                p.DurableKey AS PatientDurableKey,
                ph.OTHER_COMMUNIC_NUM,
                ROW_NUMBER() OVER (PARTITION BY p.DurableKey ORDER BY ph.CONTACT_PRIORITY) AS rn
            FROM PatientEncounters p
				INNER JOIN CLARITY.dbo.OTHER_COMMUNCTN ph WITH (NOLOCK)
					ON p.PatientEpicId = ph.PAT_ID
					AND ph.OTHER_COMMUNIC_C = 1  AND ph.CONTACT_PRIORITY = 1
        ),
		        -- Crosstab each surgery case into 6 procedure using a CTE
                -- This will allow us to have a fixed number of columns for the CPT codes
         CPTList as (
					select  PatientDurableKey, PrimaryDiag
						, max(case when rn = 1 then DiagName end) as OtherDiag1
						, max(case when rn = 2 then DiagName end) as OtherDiag2
						, max(case when rn = 3 then DiagName end) as OtherDiag3
						, max(case when rn = 4 then DiagName end) as OtherDiag4
						, max(case when rn = 5 then DiagName end) as OtherDiag5	
						,sum(PVal) sumVal

					from 
					(	
						select  enc.PatientDurableKey
							,  diagT.[Value] PrimaryDiag , diagT2.[Value] DiagName 
							, PVal = case when diagT.Value = 'N18.6' then 1 -- indicate End Stage Renal Disease
										  when diagT2.Value = 'N18.6' then 1 
										  else 0 end
							, ROW_NUMBER() over (partition by enc.PatientDurableKey order by diagB.DiagnosisKey) rn
						from
							( 
								select distinct e.PatientDurableKey, e.PrimaryDiagnosisKey, b.DiagnosisComboKey  
								from PatientEncounters e
									inner join CDW_report.FullAccess.BillingAccountFact b (nolock) on e.BillingAccountKey = b.BillingAccountKey
								where e.PrimaryDiagnosisKey <> -1 and e.DiagnosisComboKey <> -1
							) enc			 
								inner join CDW_Report.FullAccess.DiagnosisDim diag (nolock) on enc.PrimaryDiagnosisKey = diag.DiagnosisKey 
									inner join CDW_report.FullAccess.DiagnosisTerminologyDim diagT (nolock) on diag.DiagnosisKey = diagT.DiagnosisKey and diagT.Type = 'ICD-10-CM'
								left join CDW_Report.FullAccess.DiagnosisBridge diagB (nolock) on enc.DiagnosisComboKey = diagB.DiagnosisComboKey 
									inner join CDW_report.FullAccess.DiagnosisTerminologyDim diagT2 (nolock) on diagB.DiagnosisKey = diagT2.DiagnosisKey and diagT2.Type = 'ICD-10-CM'
					)t
					group by PatientDurableKey, PrimaryDiag
        )
        


Select * from PatientEncounters 

--	-- Select the required fields and format them as per the new Press Ganey file format
--	-- Ensure to handle NULL values and format dates correctly
--	SELECT DISTINCT
--		[Survey Designator] = @file_type,
--		[Client ID] = ISNULL(loc.PressGaneyClientID,'CRAP'),
--		[Last Name] = inpat.LastName,
--		[Middle Initial] =  ISNULL(LEFT(inpat.MiddleName, 1), ''),
--		[First Name] = inpat.FirstName,
--		[Address 1] = inpat.AddressLine1_X,
--		[Address 2] = inpat.AddressLine2_X,
--		[Address 3] = CONVERT(nvarchar(50),''), -- need to change to whatever new field they create
--		[City] = inpat.City,
--		[State] = inpat.StateOrProvinceAbbreviation,
--		[ZIP Code] = inpat.PostalCode,
--		[Telephone Number] = inpat.HomePhoneNumber,
--		[Mobile Number] = ISNULL(mn.OTHER_COMMUNIC_NUM,'') ,
--		[MS-DRG] = ISNULL(cptPat.PrimaryDiag,''),
--		-- '1' = Male, '2' = Female, 'M' = Unknown/Other
--		[Gender] = CASE inpat.Sex WHEN 'Male' THEN '1' WHEN 'Female' THEN '2' ELSE 'M' END,
--		[Race] = 
--			CASE 
--				WHEN inpat.FirstRace IS NULL OR inpat.FirstRace IN ('', 'Unknown', 'Not Available', 'Missing','Declined','*Unspecified','*Deleted','*Not Applicable','*Unknown') THEN 'Prefer not to answer'
--				WHEN inpat.FirstRace IN ('American Indian or Alaska Native', 'American Indian/Alaska Native', 'American Indian', 'Alaska Native') THEN 'American Indian or Alaskan Native'
--				WHEN inpat.FirstRace IN ('Asian', 'Asian - Chinese', 'Asian - Indian', 'Asian - Japanese', 'Asian - Korean', 'Asian - Vietnamese', 'Asian - Filipino', 'Asian - Other') THEN 'Asian'
--				WHEN inpat.FirstRace IN ('Black or African American', 'Black/African American', 'Black', 'African American') THEN 'Black or African American'
--				WHEN inpat.FirstRace IN ('Native Hawaiian or Other Pacific Islander', 'Native Hawaiian', 'Pacific Islander', 'Native Hawaiian/Pacific Islander') THEN 'Native Hawaiian or other Pacific Islander'
--				WHEN inpat.FirstRace IN ('White', 'Caucasian', 'White or Caucasian') THEN 'White or Caucasian'
--				WHEN inpat.FirstRace IN ('Other', 'Other Race') THEN 'Other'
--				-- Handle multiple race using both inpat.FirstRace and inpat.SecondRace
--				WHEN inpat.FirstRace IN ('Two or more races', 'Multiple', 'Multiracial', 'Multi Racial', 'More than one race')
--					 OR inpat.SecondRace IN ('Two or more races', 'Multiple', 'Multiracial', 'Multi Racial', 'More than one race')
--					 OR (inpat.SecondRace IS NOT NULL AND inpat.SecondRace <> '' AND inpat.SecondRace <> inpat.FirstRace) THEN 'Two or more races'
--				ELSE inpat.FirstRace
--			END,
--		[Ethnicity] = 
--			CASE 
--				WHEN inpat.Ethnicity IS NULL OR inpat.Ethnicity IN ('', 'Unknown', 'Not Available', 'Missing','Declined','*Unspecified','Unknown-Patient Confirmed') THEN 'Prefer not to answer'
--				WHEN inpat.Ethnicity IN ('Hispanic or Latino', 'Hispanic/Latino', 'Hispanic') THEN 'Hispanic/Latino'
--				WHEN inpat.Ethnicity IN ('Not Hispanic or Latino', 'Not Hispanic/Latino', 'Non-Hispanic','White') THEN 'Not Hispanic/Latino'
--				ELSE inpat.Ethnicity
--			END,
--		[Date of Birth] = CASE 
--			WHEN inpat.BirthDate IS NULL THEN NULL 
--			ELSE FORMAT(inpat.BirthDate, 'MMddyyyy') 
--		END, -- Format the date to MMddyyyy
--		[Language] = ISNULL(PG_Lang_Code.PG_Code,'99'),
--		--[Language] = '99',
--		[Medical Record Number] = inpat.EnterpriseId,
--		[Unique ID] = inpat.EncounterKey,
--		[Location Code] = inpat.LocationEpicId,
--		[Location Name] = inpat.LocationName,
--		[Department Code] = inpat.DepartmentEpicId,
--		[Department Name] = inpat.DepartmentName,
--		[Attending Physician NPI] = ISNULL(IIF(inpat.Npi='','*Unspecified',inpat.Npi),'*Unspecified'),
--		[Attending Physician Name] = ISNULL(IIF(inpat.ProviderName='','*Unspecified',inpat.ProviderName),'*Unspecified'),
--		[Provider Type] = ISNULL(IIF(inpat.ProviderType='','*Unspecified',inpat.ProviderType),'*Unspecified'),
--		[Provider specialty] = ISNULL(IIF(inpat.ProviderSpeciality='','*Unspecified',inpat.ProviderSpeciality),'*Unspecified'),
--		[Site address 1] = inpat.ProviderAddress,
--		[Site address 2] = '',
--		[Site city] = inpat.ProviderCity,
--		[Site state] = inpat.ProviderState,
--		[Site zip] = inpat.ProviderZipcode,
--		[Patient Admission Source] = inpat.AdmissionSourceCode,
--		[Visit or Admit Date] = CASE 
--			WHEN inpat.AdmissionDateKey = '-1' THEN '' -- Return blank if -1
--			WHEN inpat.AdmissionDateKey = '-2' THEN '' -- Return blank if -2
--			WHEN inpat.AdmissionDateKey IS NULL THEN '' -- Return blank if NULL
--			ELSE FORMAT(CONVERT(DATE, CAST(inpat.AdmissionDateKey AS CHAR(8)), 112),'MMddyyyy')
--		END, 
--		[Visit or Admit Time] = ISNULL(inpat.AdmissionTimeOfDayKey,RIGHT('0000' + CAST(FORMAT(CAST(inpat.EventDateTime AS time),'hhmm') AS VARCHAR(4)), 4)),
--		--[Visit or Admit Time] = RIGHT('0000' + CAST(FORMAT(CAST(inpat.EventDateTime AS time),'hhmm') AS VARCHAR(4)), 4), -- Ensure time is in HHMM format
--		[Discharge Date] = CASE 
--			WHEN inpat.DischargeDateKey = '-1' THEN '' -- Return blank if -1
--			WHEN inpat.DischargeDateKey = '-2' THEN '' -- Return blank if -2
--			WHEN inpat.DischargeDateKey IS NULL THEN '' -- Return blank if NULL
--			ELSE FORMAT(CONVERT(DATE, CAST(inpat.DischargeDateKey AS CHAR(8)), 112),'MMddyyyy')
--		END, -- Format the date to MMddyyyy      
--		[Patient Discharge Status] = inpat.DischargeDispositionCode,
--		[Unit] = inpat.DepartmentName,
--		[Service] = HospitalService,
--		[Specialty] = inpat.DepartmentSpecialty,
--		[Payor / Insurance / Financial Class] = '',-- cov.PayorName, -- Not required for Press Ganey
--		--[Payor / Insurance / Financial Class] = cov.PayorName, 
--		[Length of Stay] = LengthOfStayInDays,
--		[Room] = '',
--		[Bed] = '',
--		[Hospitalist] = '',
--		[Fast Track or Acute Flag] = '', --ED
--		[Email] = inpat.EmailAddress,
--		[Hospitalist_1] = '',
--		[Hospitalist_2] = '',
--		[ER_ADMIT] = '',
--		[Other Diagnosis or Procedure Code] = '', 	
--		[Procedure Code 1] =  cptPat.PrimaryDiag,-- Primary for now. 
--		[Procedure Code 2] =  cptPat.OtherDiag1,
--		[Procedure Code 3] =  cptPat.OtherDiag2,
--		[Procedure Code 4] =  cptPat.OtherDiag3,
--		[Procedure Code 5] =  cptPat.OtherDiag4,
--		[Procedure Code 6] =  cptPat.OtherDiag5,
--		[Deceased Flag] = CASE WHEN inpat.DeathDate IS NOT NULL THEN 'Y' ELSE 'N' END,	
--		[No Publicity Flag] = 'N',
--		[State Regulation Flag] = 'N',
--		[Newborn patient] = CASE WHEN inpat.PatientClass = 'Newborn' THEN 'Y' ELSE 'N' END,
--		[Transferred/admitted to inpatient] = '',
--		[PharmacyType] = '',
--		[ICU] = '',
--		[Virtual Nursing] = '', --Y or N
--		'$' EOR,
--		inpat.EventDateTime -- Need this to determine what survey gets sent closested to midnight
--	INTO #PressGaneyFile FROM PatientEncounters inpat 
--		LEFT JOIN [ETLProcedureRepository].[dbo].[PressGaneySurveyMap] loc WITH (NOLOCK) ON inpat.DepartmentEpicId = loc.DepartmentEpicId
--		LEFT JOIN CDW_report.FullAccess.HospitalAdmissionFact ha WITH (NOLOCK) ON inpat.PatientDurableKey = ha.PatientDurableKey AND inpat.PatientKey = ha.PatientKey
--		LEFT JOIN CDW_report.FullAccess.BedRequestFact bedreq WITH (NOLOCK) ON ha.AdmissionBedRequestKey = bedreq.BedRequestKey AND inpat.DepartmentKey = bedreq.DestinationBedKey AND inpat.IsBed = 1
--		LEFT JOIN MobileNumbers mn	ON inpat.PatientDurableKey = mn.PatientDurableKey AND mn.rn = 1
--		LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey
--		LEFT JOIN [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes]as PG_Lang_Code WITH (NOLOCK) ON PG_Lang_Code.Language = inpat.PreferredWrittenLanguage_X



---- Output
--Select * from #PressGaneyFile
