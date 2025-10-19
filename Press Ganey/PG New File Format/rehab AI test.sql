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
   

SELECT DISTINCT * FROM (

-- Combined query using UNION ALL
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
		AND en.[Type] = 'Hospital Encounter'
		AND dep.DepartmentSpecialty IN ('Occupational Therapy', 'Physical Therapy', 'Speech Therapy', 'Sports Medicine', 'Rehabilitation')
		AND pat.AgeInYears >= 18
		AND pat.DeathDate IS NULL
		AND en.DerivedEncounterStatus = 'Complete'

	UNION ALL

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
		AND en.[Type] IN ('Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
		AND dep.DepartmentSpecialty IN ('Orthopedic', 'Sports Medicine')
		AND pat.AgeInYears >= 18
		AND pat.DeathDate IS NULL
		AND en.DerivedEncounterStatus = 'Complete'

	UNION ALL

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
		AND en.[Type] IN ('Physical Therapy', 'Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
		AND dep.DepartmentSpecialty IN ('Physical Therapy', 'Orthopedic', 'Sports Medicine', 'Rehabilitation')
		AND pat.AgeInYears >= 18
		AND pat.DeathDate IS NULL
		AND en.DerivedEncounterStatus = 'Complete'

	UNION ALL

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
		AND en.[Type] IN ('Speech Therapy', 'Office Visit', 'Clinical Support', 'Behavioral Health', 'Nurse Triage', 'Results Follow-Up', 'Telemedicine', 'IMAT')
		AND dep.DepartmentSpecialty IN ('Speech Therapy', 'Rehabilitation')
		AND pat.AgeInYears >= 18
		AND pat.DeathDate IS NULL
		AND en.DerivedEncounterStatus = 'Complete'

) AllEncounters