



	Declare @StartDate varchar(10) = '04/01/2023'
	Declare @EndDate varchar(10) = '04/30/2024'



	 declare @StartDateInt bigint
		, @EndDateInt bigint
		, @file_type varchar(10) = 'HCAHPS'
		, @maxD datetime 
		, @selfCorrectDate int

	if (@StartDate is null)
		set @StartDate = 't-30'
	if (@EndDate is null)
		set @EndDate = 't'   

	-- self-corrected lookback date for DR purpose
	select @maxD = max(created_date) from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] where file_type = @file_type
	select @selfCorrectDate = datediff(dd, @maxD, getdate())
	if (@maxD < DATEADD(dd, - 9, getdate()))
		select @StartDate = 't - ' + cast((30 + @selfCorrectDate) as varchar(2))  	
	
	select @StartDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') as bigint)
		 , @EndDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') as bigint)
	
	---- get list of haients that get discharge within 35 days
	--drop table if exists #haients
	select distinct 
		[Survey Designator] = 'IN0101' -- case when pat.AgeInYears > 17 then 'IN0101' else 'IN0102' end  -- no pediatric per HRA
		, [Client ID] = loc.[PressGaneyId]
		, [Last Name] = pat.LastName
		, [Middle Initial] = left(pat.MiddleName,1)
		, [First Name] = pat.FirstName
		, [Address 1] = pat.AddressLine1_X
		, [Address 2] = pat.AddressLine2_X
		, [City] = pat.City
		, [State] = pat.StateOrProvinceAbbreviation
		, [ZIP Code] = pat.PostalCode
		, [Telephone Number] = pat.HomePhoneNumber
		--, [Mobile Number] = phone.OTHER_COMMUNIC_NUM
		, [MS-DRG] = drg.Code		-- M
		, [Gender] = case pat.Sex when 'Male' then '1'
								  when 'Female' then '2'
								  else 'M' end  -- Unknown/Missing
		, [Race]	= pat.FirstRace	 
		, [Ethnicity] = pat.Ethnicity
		, [Date of Birth] = format(pat.BirthDate, 'MMddyyyy')
		, [Language]  = pat.PreferredWrittenLanguage_X  
		, [Medical Record Number] = pat.EnterpriseId
		, [Unique ID] = ha.EncounterKey 
		, [Location Code] = dep.LocationEpicId 
		, [Location Name] = dep.LocationName
		, [Attending Physician NPI] = prov.Npi			-- using discharge provider's data based on Helena A.'s confirmation 20241120
		, [Attending Physician Name]  = prov.Name
		, [Provider Type] = prov.Type
		, [Provider specialty] = prov.PrimarySpecialty	
		, [Site address 1] = dep.Address				-- site where the patient was discharged
		, [Site address 2] = null
		, [Site city] = dep.City
		, [Site state] = dep.StateOrProvinceAbbreviation
		, [Site zip] = dep.PostalCode
		, [Patient Admission Source] = enc.AdmissionSourceCode	
		, [Visit or Admit Date] = format(adat.DateValue, 'MMddyyyy') 
		, [Visit or Admit Time] = Atime.DisplayString24Hour -- optional
		, [Discharge Date] = format(ha.DischargeInstant, 'MMddyyyy')
		, [Discharge Time] = Dtime.DisplayString24Hour -- optional
		, [Patient Discharge Status] = enc.DischargeDispositionCode
		, [Unit] = dep.DepartmentName		-- get the department name where the patient was discharged
		, [Service] = ha.HospitalService  -- SERVICE LINE not anything in particular, this is for MH to group on
		, [Specialty] = bed.DepartmentSpecialty
		, [Payor / Insurance / Financial Class] = cov.PayorName
		, [Length of Stay] = ha.LengthOfStayInDays
		, [Room] = bed.RoomName
		, [Bed] = bed.BedName
		-- these 2 fields are optional ... don't have time to find them 
		--, [Hospitalist] =
		--, [Fast Track or Acute Flag] 
		, [Email] = pat.EmailAddress
		, [ER_ADMIT] = case when ha.AdmissionSource = 'Emergency Room' then 'Y' else 'N' end
		, [Deceased Flag] = case when pat.DeathDate is not null then 'Y' else 'N' end
		, [No Publicity Flag] = 'N' -- Epic doesn't store this info. Press Ganey is provided with the list to exclude from their end.
		, [State Regulation Flag] = 'N' -- already excluded them
		, [Newborn patient] = case when ha.PatientClass = 'Newborn' then 'Y' else 'N' end
		, [ICD-10] = diaTerm.[Value]
		, '$' EOR	

	from CDW_report.FullAccess.HospitalAdmissionFact ha with (nolock)
		inner join CDW_report.dbo.DurationDim d  with (nolock) on ha.AgeKey = d.DurationKey 
		inner join CDW_Report.FullAccess.PatientDim pat  with (nolock) on ha.PatientDurableKey = pat.DurableKey and pat.IsCurrent = 1 -- and ha.PatientKey = pat.PatientKey
				   and pat.PatientEpicId not in (select distinct PAT_ID from CLARITY.dbo.PATIENT_TYPE patT	inner join CLARITY.dbo.ZC_PATIENT_TYPE zc on patT.PATIENT_TYPE_C = zc.PATIENT_TYPE_C and zc.PATIENT_TYPE_C in (2,6)) -- 2 confidential, 6 prisioner)
		--	left join #mobile phone on ha.PatientDurableKey = phone.PatientDurableKey
		left join CDW_report.FullAccess.DrgDim drg with (nolock) on ha.MsDrgKey = drg.DrgKey and drg.DrgCodeSet = 'MS-DRG' --and drg.[Version] = @drg_current_ver
		inner join CDW_Report.FullAccess.DepartmentDim dep with (nolock)  on ha.DepartmentKey = dep.DepartmentKey and IsDepartment = 1
				   and dep.LocationEpicId not in ( '11016', '11017') --MaineHealth Behavioral Health at Spring Harbor is not on PG's list
		inner join CDW_Report.FullAccess.EncounterFact enc with (nolock)  on ha.EncounterKey = enc.EncounterKey
		left join CDW_report.FullAccess.DiagnosisDim dia on enc.PrimaryDiagnosisKey = dia.DiagnosisKey
		inner join CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm on dia.DiagnosisKey = diaTerm.DiagnosisKey and diaTerm.[Type] = 'ICD-10-CM'
		inner join CDW_Report.FullAccess.TimeOfDayDim Atime with (nolock)  on ha.AdmissionTimeOfDayKey = Atime.TimeOfDayKey
		inner join CDW_Report.FullAccess.TimeOfDayDim Dtime with (nolock)  on ha.DischargeTimeOfDayKey = Dtime.TimeOfDayKey
		inner join CDW_report.FullAccess.ProviderDim prov with (nolock)  on ha.DischargingProviderDurableKey = prov.DurableKey and ha.DischargingProviderKey = prov.ProviderKey
		inner join CDW_report.FullAccess.CoverageDim cov with (nolock)  on ha.PrimaryCoverageKey = cov.CoverageKey
		inner join CDW_report.FullAccess.BedRequestFact bedreq with (nolock)  on ha.AdmissionBedRequestKey = bedreq.BedRequestKey
		left join CDW_report.FullAccess.DepartmentDim bed with (nolock)  on bed.DepartmentKey = bedreq.DestinationBedKey and bed.IsBed = 1
		--inner join #lastService lser on ha.PatientDurableKey = lser.PatientDurableKey and ha.EncounterKey = lser.EncounterKey
		inner join [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc with (nolock)  on ha.DepartmentKey = loc.DepartmentKey --and loc.is_department = 1
				   and loc.[PressGaneyId] is not null and loc.PressGaneyId <> 16107
		inner join CDW_report.FullAccess.DateDim adat with (nolock)  on ha.AdmissionDateKey = adat.DateKey
		where ha.DischargeDateKey between @StartDateInt and @EndDateInt
		and DischargePatientClass in ('haient' , 'Observation')  -- 'Observation' patient is included by Helena A.
		and d.Years > 17 
		




	--		SELECT 
	--	[Survey Designator] = 'IN0101' -- case when pat.AgeInYears > 17 then 'IN0101' else 'IN0102' end  -- no pediatric per HRA
	--	, [Client ID] = loc.[PressGaneyId]
	--	, [Last Name] = pat.LastName
	--	, [Middle Initial] = left(pat.MiddleName,1)
	--	, [First Name] = pat.FirstName
	--	, [Address 1] = pat.AddressLine1_X
	--	, [Address 2] = pat.AddressLine2_X
	--	, [City] = pat.City
	--	, [State] = pat.StateOrProvinceAbbreviation
	--	, [ZIP Code] = pat.PostalCode
	--	, [Telephone Number] = pat.HomePhoneNumber
	--	, [Mobile Number] = phone.OTHER_COMMUNIC_NUM
	--	, [MS-DRG] = drg.Code		-- M
	--	, [Gender] = case pat.Sex when 'Male' then '1'
	--							  when 'Female' then '2'
	--							  else 'M' end  -- Unknown/Missing
	--	, [Race]	= pat.FirstRace	 
	--	, [Ethnicity] = pat.Ethnicity
	--	, [Date of Birth] = format(pat.BirthDate, 'MMddyyyy')
	--	, [Language]  = pat.PreferredWrittenLanguage_X  
	--	, [Medical Record Number] = pat.EnterpriseId
	--	, [Unique ID] = ha.EncounterKey 
	--	, [Location Code] = dep.LocationEpicId 
	--	, [Location Name] = dep.LocationName
	--	, [Attending Physician NPI] = prov.Npi			-- using discharge provider's data based on Helena A.'s confirmation 20241120
	--	, [Attending Physician Name]  = prov.Name
	--	, [Provider Type] = prov.Type
	--	, [Provider specialty] = prov.PrimarySpecialty	
	--	, [Site address 1] = dep.Address				-- site where the patient was discharged
	--	, [Site address 2] = null
	--	, [Site city] = dep.City
	--	, [Site state] = dep.StateOrProvinceAbbreviation
	--	, [Site zip] = dep.PostalCode
	--	, [Patient Admission Source] = enc.AdmissionSourceCode	
	--	, [Visit or Admit Date] = format(adat.DateValue, 'MMddyyyy') 
	--	, [Visit or Admit Time] = Atime.DisplayString24Hour -- optional
	--	, [Discharge Date] = format(ha.DischargeInstant, 'MMddyyyy')
	--	, [Discharge Time] = Dtime.DisplayString24Hour -- optional
	--	, [Patient Discharge Status] = enc.DischargeDispositionCode
	--	, [Unit] = dep.DepartmentName		-- get the department name where the patient was discharged
	--	, [Service] = ha.HospitalService  -- SERVICE LINE not anything in particular, this is for MH to group on
	--	, [Specialty] = bed.DepartmentSpecialty
	--	, [Payor / Insurance / Financial Class] = cov.PayorName
	--	, [Length of Stay] = ha.LengthOfStayInDays
	--	, [Room] = bed.RoomName
	--	, [Bed] = bed.BedName
	--	-- these 2 fields are optional ... don't have time to find them 
	--	--, [Hospitalist] =
	--	--, [Fast Track or Acute Flag] 
	--	, [Email] = pat.EmailAddress
	--	, [ER_ADMIT] = case when ha.AdmissionSource = 'Emergency Room' then 'Y' else 'N' end
	--	, [Deceased Flag] = case when pat.DeathDate is not null then 'Y' else 'N' end
	--	, [No Publicity Flag] = 'N' -- Epic doesn't store this info. Press Ganey is provided with the list to exclude from their end.
	--	, [State Regulation Flag] = 'N' -- already excluded them
	--	, [Newborn patient] = case when ha.PatientClass = 'Newborn' then 'Y' else 'N' end
	--	, [ICD-10] = diaTerm.[Value]
	--	, '$' EOR	
	--into #HCAPHS
	--from #haients ha
	--	inner join CDW_Report.FullAccess.PatientDim pat  with (nolock) on ha.PatientDurableKey = pat.DurableKey and pat.IsCurrent = 1 -- and ha.PatientKey = pat.PatientKey
	--		and pat.PatientEpicId not in (select PAT_ID from #excludePat)
	--		left join #mobile phone on ha.PatientDurableKey = phone.PatientDurableKey
	--	left join CDW_report.FullAccess.DrgDim drg with (nolock) on ha.MsDrgKey = drg.DrgKey and drg.DrgCodeSet = 'MS-DRG' --and drg.[Version] = @drg_current_ver
	--	inner join CDW_Report.FullAccess.DepartmentDim dep with (nolock)  on ha.DepartmentKey = dep.DepartmentKey and IsDepartment = 1
	--		and dep.LocationEpicId not in ( '11016', '11017') --MaineHealth Behavioral Health at Spring Harbor is not on PG's list
	--	inner join CDW_Report.FullAccess.EncounterFact enc with (nolock)  on ha.EncounterKey = enc.EncounterKey
	--		left join CDW_report.FullAccess.DiagnosisDim dia on enc.PrimaryDiagnosisKey = dia.DiagnosisKey
	--			inner join CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm on dia.DiagnosisKey = diaTerm.DiagnosisKey and diaTerm.[Type] = 'ICD-10-CM'
	--	inner join CDW_Report.FullAccess.TimeOfDayDim Atime with (nolock)  on ha.AdmissionTimeOfDayKey = Atime.TimeOfDayKey
	--	inner join CDW_Report.FullAccess.TimeOfDayDim Dtime with (nolock)  on ha.DischargeTimeOfDayKey = Dtime.TimeOfDayKey
	--	inner join CDW_report.FullAccess.ProviderDim prov with (nolock)  on ha.DischargingProviderDurableKey = prov.DurableKey and ha.DischargingProviderKey = prov.ProviderKey
	--	inner join CDW_report.FullAccess.CoverageDim cov with (nolock)  on ha.PrimaryCoverageKey = cov.CoverageKey
	--	inner join CDW_report.FullAccess.BedRequestFact bedreq with (nolock)  on ha.AdmissionBedRequestKey = bedreq.BedRequestKey
	--		left join CDW_report.FullAccess.DepartmentDim bed with (nolock)  on bed.DepartmentKey = bedreq.DestinationBedKey and bed.IsBed = 1
	--	inner join #lastService lser on ha.PatientDurableKey = lser.PatientDurableKey and ha.EncounterKey = lser.EncounterKey
	--	inner join [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc with (nolock)  on ha.DepartmentKey = loc.DepartmentKey --and loc.is_department = 1
	--		and loc.[PressGaneyId] is not null and loc.PressGaneyId <> 16107
	--	inner join CDW_report.FullAccess.DateDim adat with (nolock)  on ha.AdmissionDateKey = adat.DateKey