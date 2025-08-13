



	Declare @StartDate varchar(10) = '04/01/2024'
	Declare @EndDate varchar(10) = '07/30/2025'
	Declare @StartDateInt bigint
		  , @EndDateInt bigint
		  , @file_type varchar(10) = 'OASCAHPS'
		  , @maxD datetime 
		  , @selfCorrectDate int

	If (@StartDate is null)
		Set @StartDate = 't-30'
	If (@EndDate is null)
		Set @EndDate = 't'   

	-- self-corrected lookback date for DR purpose
	SELECT @maxD = max(created_date) FROM [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] WHERE file_type = @file_type
	SELECT @selfCorrectDate = datedIff(dd, @maxD, getdate())
	If (@maxD < DATEADD(dd, - 9, getdate()))
		SELECT @StartDate = 't - ' + cast((30 + @selfCorrectDate) as varchar(2))  	
	
	SELECT @StartDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') as bigint)
		 , @EndDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') as bigint)




	--**********Clean up temp tables *************
	If OBJECT_ID('tempdb..#mobile') IS NOT NULL
		DROP TABLE #mobile;
	If OBJECT_ID('tempdb..#excludePat') IS NOT NULL
		DROP TABLE #excludePat;		
	If OBJECT_ID('tempdb..#cptList') IS NOT NULL
		DROP TABLE #cptList;	
	If OBJECT_ID('tempdb..#surgPatList') IS NOT NULL
		DROP TABLE #surgPatList;
	If OBJECT_ID('tempdb..#OAS') IS NOT NULL
		DROP TABLE #OAS;			
		
		

-- get list of patient with surgery case
select PatientDurableKey, PatientKey, AgeKey
	, SurgicalCaseEpicId, SurgicalCaseKey, PrimaryProcedureKey, PrimaryProcedureDurableKey, CodedProcedureComboKey, HospitalEncounterKey, SurgeryEncounterKey, LocationKey
	, AdmissionDateKey, AdmissionInstant, SurgeryDateKey, DischargeDateKey, DischargeInstant 
	, PrimarySurgeonDurableKey, PrimarySurgeonKey
	, PrimaryService
	, IntraOpDepartmentKey
into #surgPatList
from CDW_report.FullAccess.SurgicalCaseFact pat with (nolock)	
	inner join CDW_report.FullAccess.DurationDim dur with (nolock) on pat.AgeKey = dur.DurationKey and dur.Years > 17
	inner join ETLProcedureRepository.dbo.OasCAHPSSurveyDemographicDetail_20250612_combined sdd
		on sdd.[Unique ID] = SurgicalCaseEpicId
where DischargeDateKey between @StartDateInt and @EndDateInt
	and DischargeDisposition = 'Home or Self Care'
	and SurgeryPatientClass in ('Hospital Ambulatory Surgery') 
	and LogStatus = 'Posted'
	and CodedProcedureComboKey > -1  -- when this field = -1, PrimaryProcedureKey link to ProcedureDim doesn't yield a surgery case

-- crosstab each surgery case into 6 procedure  
select PatientDurableKey, PatientKey
	, max(case when rn = 1 then Cpt end) as CPT1
	, max(case when rn = 2 then Cpt end) as CPT2
	, max(case when rn = 3 then Cpt end) as CPT3
	, max(case when rn = 4 then Cpt end) as CPT4
	, max(case when rn = 5 then Cpt end) as CPT5
	, max(case when rn = 6 then Cpt end) as CPT6
into #cptList
from 
(	-- OAS CAHPS ITTI.pdf, p. 14, only 6 procedure codes is needed, filter list for CPT is from this page
	-- according to PG, order in Clarity is not necessary
	select	top 6 with ties pat.PatientDurableKey, pat.PatientKey, coalesce(pro.CptCode, pro.Code) Cpt
			, ROW_NUMBER() over (partition by PatientDurableKey order by ProcedureKey) rn
	from #surgPatList pat
		inner join CDW_report.FullAccess.ProcedureBridge pro with (nolock) on pat.CodedProcedureComboKey = pro.ProcedureComboKey
	where CptCode between '10004' and '69990' or CptCode between '93451' AND '93462' or CptCode between '93566' and '93572'
			or CptCode in ('92920', '92921','92928','92929','92978','93985','93986')
			or Code in ('G0104', 'G0105', 'G0121', 'G0260')
	order by case when ROW_NUMBER() over (partition by PatientDurableKey order by PatientKey) <= 6 then 0 else 1 end
)t
group by PatientDurableKey, PatientKey

-- get mobile phone numbers
select PatientDurableKey, OTHER_COMMUNIC_NUM
into #mobile
from
(																				-- asume smaller the number, higher the priority
	select distinct s.PatientDurableKey, ph.OTHER_COMMUNIC_NUM, CONTACT_PRIORITY, min(CONTACT_PRIORITY) over (partition by PAT_ID) highestCP
	from #surgPatList s
		inner join CDW_report.FullAccess.PatientDim p with (nolock) on s.PatientDurableKey = p.DurableKey and p.IsCurrent = 1
			inner join CLARITY.dbo.OTHER_COMMUNCTN ph with (nolock) on p.PatientEpicId = ph.PAT_ID and ph.OTHER_COMMUNIC_C = 1  -- 1 is mobile number
) t
where CONTACT_PRIORITY = highestCP

-- get excluded patients
	select distinct PAT_ID 
	into #excludePat
	from CLARITY.dbo.PATIENT_TYPE patT (nolock)
		inner join CLARITY.dbo.ZC_PATIENT_TYPE zc on patT.PATIENT_TYPE_C = zc.PATIENT_TYPE_C and zc.PATIENT_TYPE_C in (2,6) -- 2 confidential, 6 prisioner

-- get patient's data
SELECT distinct
	[Survey Designator] = case when /*sdept.LocationEpicId =  '10740603'*/ dep.DepartmentEpicId = '11002124' then 'AS0102' else 'AS0101' end
	, [Client ID] =  loc.[PressGaneyId]
	, [Last Name] = pat.LastName
	, [Middle Initial] = pat.MiddleName
	, [First Name] = pat.FirstName
	, [Address 1] = pat.AddressLine1_X
	, [Address 2] = pat.AddressLine2_X
	, [City] = pat.City
	, [State] = pat.StateOrProvinceAbbreviation
	, [ZIP Code] = pat.PostalCode
	, [Telephone Number] = pat.HomePhoneNumber
	, [Mobile Number] = phone.OTHER_COMMUNIC_NUM
	, [Gender] = case pat.Sex when 'Male' then '1' when 'Female' then '2' else '' end
	, [Race]	= pat.FirstRace	 
	, [Ethnicity] = pat.Ethnicity
	, [Date of Birth] = format(pat.BirthDate, 'MMddyyyy')
	, [Language]  = pat.PreferredWrittenLanguage_X
	, [Medical Record Number] = pat.EnterpriseId
	, [Unique ID] = surgPat.SurgicalCaseEpicId
	, [Location Code]  = dep.DepartmentEpicId -- sdept.LocationEpicId 
	, [Location Name] = dep.DepartmentName -- sdept.LocationName
	, [Attending Physician NPI] = prov.Npi	-- primary surgeon 
	, [Attending Physician Name]  = prov.Name
	, [Provider Type] = prov.Type
	, [Provider specialty] = prov.PrimarySpecialty
	, [Site address 1] = dep.Address -- sdept.Address
	, [Site address 2] = null
	, [Site city] = dep.City -- sdept.City
	, [Site state] = dep.StateOrProvinceAbbreviation -- sdept.StateOrProvinceAbbreviation
	, [Site zip] = dep.PostalCode -- sdept.PostalCode
	, [Patient Admission Source] = enc.AdmissionSourceCode
	, [Patient Discharge Status] = COALESCE(enc.DischargeDispositionCode, 'M')
	, [Visit or Admit Date] = adate.DisplayString
	, [Visit or Admit Time] = format(cast(surgPat.AdmissionInstant as time), 'hhmm')
	, [Discharge Date] = ddate.DisplayString
	, [Discharge Time] = format(cast(surgPat.DischargeInstant as time), 'hhmm')
	, [Service] = surgPat.PrimaryService 
	, [Specialty] = dep.DepartmentSpecialty
	, [Email] = pat.EmailAddress
	, [Procedure Code 1] = cptPat.CPT1		
	, [Procedure Code 2] = cptPat.CPT2
	, [Procedure Code 3] = cptPat.CPT3
	, [Procedure Code 4] = cptPat.CPT4
	, [Procedure Code 5] = cptPat.CPT5
	, [Procedure Code 6] = cptPat.CPT6
	, [Deceased Flag] = case when pat.DeathDate is null then 'N' else 'Y' end
	, [Newborn patient] = case when enc.PatientClass = 'Newborn' then 'Y' else 'N' end
	, [Transferred/admitted to inpatient] = 'N' -- since it gets filtered already
	, '$' EOR
into #OAS
FROM #surgPatList surgPat  
	inner join #cptList cptPat on cptPat.PatientDurableKey = surgPat.PatientDurableKey 		
	--inner join CDW_report.FullAccess.DepartmentDim sdept with (nolock) on surgPat.LocationKey = sdept.DepartmentKey and sdept.ServiceAreaEpicId = '110'
	inner join CDW_report.FullAccess.ProviderDim prov with (nolock) on surgPat.PrimarySurgeonDurableKey = prov.DurableKey and surgPat.PrimarySurgeonKey = prov.ProviderKey
	inner join CDW_report.FullAccess.EncounterFact enc with (nolock) on surgPat.HospitalEncounterKey = enc.EncounterKey
	inner join CDW_report.FullAccess.PatientDim pat with (nolock) on cptPat.PatientDurableKey = pat.DurableKey and pat.IsCurrent = 1 -- cptPat.PatientKey = pat.PatientKey
		and pat.PatientEpicId not in (select PAT_ID from #excludePat) -- exclude patients with patient_type in ('confidential', 'prisioner')
	left join #mobile phone on surgPat.PatientDurableKey = phone.PatientDurableKey
	inner join CDW_report.FullAccess.DateDim adate with (nolock) on surgPat.AdmissionDateKey = adate.DateKey
	inner join CDW_report.FullAccess.DateDim ddate with (nolock) on surgPat.DischargeDateKey = ddate.DateKey
	inner join [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc with (nolock) on  surgPat.IntraOpDepartmentKey = loc.DepartmentKey 			
	inner join CDW_report.FullAccess.DepartmentDim dep with (nolock) on surgPat.IntraOpDepartmentKey = dep.DepartmentKey and dep.IsDepartment = 1 and dep.ServiceAreaEpicId = '110'

	-- delete record that were uploaded last week
	--if @update = 0
	--	delete from #OAS
	--	where [Unique ID] in (select [unique_ID] from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] where [file_type] = @file_type )

	--if @testing = 0
	---- track the records that being sent this time
	--	insert into [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords ([file_type],[unique_ID])
	--	select @file_type, [Unique ID] from #OAS

	-- OUTPUT
	select * from #OAS
		


--Select * from OasCAHPSSurveyDemographicDetail_20250612_combined

