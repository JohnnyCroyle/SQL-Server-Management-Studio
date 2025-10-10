USE [ETLProcedureRepository]
GO
/****** Object:  StoredProcedure [dbo].[sp_PressGaney_OASCAHPS]    Script Date: 10/7/2025 2:03:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================*/
Declare
	@StartDate varchar(10)
	, @EndDate varchar(10)
	, @update int = 0





	declare @StartDateInt	bigint
	, @EndDateInt		bigint
	, @file_type		varchar(10) = 'OASCAHPS'
	, @maxD				datetime 
	, @selfCorrectDate	int
	, @tmpDate			date
	, @errmsg			varchar(255)


		if (@StartDate is null)
			set @StartDate = 't-30'
		if (@EndDate is null)
			set @EndDate = 't'   

		-- self-corrected lookback date for DR purpose
		select @maxD = max(created_date) from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] where file_type = @file_type
		select @selfCorrectDate = datediff(dd, @maxD, getdate())
		if (@maxD < DATEADD(dd, - 9, getdate()))
			select @StartDate = 't - ' + cast((30 + @selfCorrectDate) as varchar(2))  			
		
		--select	@StartDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') as bigint)
		--		, @EndDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') as bigint)
	


-- get list of patient with surgery case
drop table if exists #surgPatList
select PatientDurableKey, PatientKey, AgeKey
		, SurgicalCaseEpicId, SurgicalCaseKey, PrimaryProcedureKey, PrimaryProcedureDurableKey, CodedProcedureComboKey, HospitalEncounterKey, SurgeryEncounterKey, LocationKey
		, AdmissionDateKey, AdmissionInstant, SurgeryDateKey, DischargeDateKey, DischargeInstant 
		, PrimarySurgeonDurableKey, PrimarySurgeonKey
		, PrimaryService
		, IntraOpDepartmentKey
  into	#surgPatList
  from	CDW_report.FullAccess.SurgicalCaseFact pat with (nolock)
 where 0 = 1

if @update = 0
	insert into #surgPatList(PatientDurableKey, PatientKey, AgeKey
			, SurgicalCaseEpicId, SurgicalCaseKey, PrimaryProcedureKey, PrimaryProcedureDurableKey, CodedProcedureComboKey, HospitalEncounterKey, SurgeryEncounterKey, LocationKey
			, AdmissionDateKey, AdmissionInstant, SurgeryDateKey, DischargeDateKey, DischargeInstant 
			, PrimarySurgeonDurableKey, PrimarySurgeonKey
			, PrimaryService
			, IntraOpDepartmentKey)
	select	pat.PatientDurableKey, pat.PatientKey, pat.AgeKey
			, pat.SurgicalCaseEpicId, pat.SurgicalCaseKey, pat.PrimaryProcedureKey, pat.PrimaryProcedureDurableKey
			, pat.CodedProcedureComboKey, pat.HospitalEncounterKey, pat.SurgeryEncounterKey, pat.LocationKey
			, AdmissionDateKey, pat.AdmissionInstant, pat.SurgeryDateKey, pat.DischargeDateKey, pat.DischargeInstant 
			, pat.PrimarySurgeonDurableKey, pat.PrimarySurgeonKey, pat.PrimaryService, pat.IntraOpDepartmentKey
	  from CDW_report.FullAccess.SurgicalCaseFact pat with (nolock)	
	  inner join CDW_report.FullAccess.DurationDim dur with (nolock) on pat.AgeKey = dur.DurationKey and dur.Years > 17
	 where 
	 --DischargeDateKey between @StartDateInt and @EndDateInt
		 DischargeDisposition = 'Home or Self Care'
		and SurgeryPatientClass in ('Hospital Ambulatory Surgery') 
		and LogStatus = 'Posted'
		and CodedProcedureComboKey > -1  -- when this field = -1, PrimaryProcedureKey link to ProcedureDim doesn't yield a surgery case
else
begin
	drop table if exists #errorList
	create table #errorList (SurgicalCaseEpicId nvarchar(50))
	insert into #errorList
	select distinct [Unique_ID] SurgicalCaseEpicId from [ETLProcedureRepository].[dbo].[CAHPS_Error] where CAHPS_file = 'OAS' and [Unique_ID] not like 'E%' 
	union
	select  SurgicalCaseEpicId
	from (
		select distinct id, pat.DurableKey, pat.PatientKey, pdate
		from CDW_report.FullAccess.PatientDim pat 
		inner join (
				select distinct [Unique_ID] id, Event_Date pdate from [ETLProcedureRepository].[dbo].[CAHPS_Error] where CAHPS_file = 'OAS' and [Unique_ID] like 'E%'
					
		)t on pat.EnterpriseId = t.id
	)o
	inner join CDW_report.FullAccess.SurgicalCaseFact surg on surg.PatientDurableKey = o.DurableKey and surg.PatientKey = o.PatientKey and o.pdate = surg.SurgeryDateKey
	
	insert into #surgPatList(PatientDurableKey, PatientKey, AgeKey
				, SurgicalCaseEpicId, SurgicalCaseKey, PrimaryProcedureKey, PrimaryProcedureDurableKey, CodedProcedureComboKey, HospitalEncounterKey, SurgeryEncounterKey, LocationKey
				, AdmissionDateKey, AdmissionInstant, SurgeryDateKey, DischargeDateKey, DischargeInstant 
				, PrimarySurgeonDurableKey, PrimarySurgeonKey
				, PrimaryService
				, IntraOpDepartmentKey)
	select	pat.PatientDurableKey, pat.PatientKey, pat.AgeKey
			, pat.SurgicalCaseEpicId, pat.SurgicalCaseKey, pat.PrimaryProcedureKey, pat.PrimaryProcedureDurableKey
			, pat.CodedProcedureComboKey, pat.HospitalEncounterKey, pat.SurgeryEncounterKey, pat.LocationKey
			, AdmissionDateKey, pat.AdmissionInstant, pat.SurgeryDateKey, pat.DischargeDateKey, pat.DischargeInstant 
			, pat.PrimarySurgeonDurableKey, pat.PrimarySurgeonKey, pat.PrimaryService, pat.IntraOpDepartmentKey
	from CDW_report.FullAccess.SurgicalCaseFact pat with (nolock)	
		inner join #errorList cte on pat.SurgicalCaseEpicId = cte.SurgicalCaseEpicId

end
-- crosstab each surgery case into 6 procedure  

	-- get primary CPT code
	drop table if exists #primCPT
	select pat.PatientDurableKey, pat.PatientKey, pat.SurgicalCaseKey, CptCode = case len(pd.CptCode) when 5 then pd.CptCode else '' end 
	into #primCPT
	from #surgPatList pat
		inner join CDW_report.FullAccess.ProcedureDim pd on pat.PrimaryProcedureDurableKey = pd.DurableKey and pat.PrimaryProcedureKey = pd.ProcedureKey

	-- get all 6 cpt code
	drop table if exists #allCPT
	select	top 6 with ties pat.PatientDurableKey, pat.PatientKey			
				, coalesce(pro.CptCode, pro.Code) Cpt			
				, pat.SurgicalCaseKey -- this is needed for update data with accumulative months
	into #allCPT
	from #surgPatList pat
		inner join CDW_report.FullAccess.ProcedureBridge pro with (nolock) on pat.CodedProcedureComboKey = pro.ProcedureComboKey
	where pro.CptCode between '10004' and '69990' or CptCode between '93451' AND '93462' or CptCode between '93566' and '93572'
			or CptCode in ('92920', '92921','92928','92929','92978','93985','93986')
			or Code in ('G0104', 'G0105', 'G0121', 'G0260')
	order by case when ROW_NUMBER() over (partition by pat.PatientDurableKey order by pat.PatientKey) <= 6 then 0 else 1 end

	-- delete row that has Cpt code the same with primary Cpt code
	delete a
	from #allCPT a
		inner join #primCPT p on a.SurgicalCaseKey = p.SurgicalCaseKey
	where a.Cpt = p.CptCode and Cpt <> ''


	drop table if exists #cptList
	select allCPT.PatientDurableKey, allCPT.PatientKey, allCPT.SurgicalCaseKey
		, CPT1 = primCPT.CptCode
		, CPT2 = coalesce(max(case when rn = 1 then Cpt end), '') 
		, CPT3 = coalesce(max(case when rn = 2 then Cpt end), '')
		, CPT4 = coalesce(max(case when rn = 3 then Cpt end), '') 
		, CPT5 = coalesce(max(case when rn = 4 then Cpt end), '') 
		, CPT6 = coalesce(max(case when rn = 5 then Cpt end), '')
	into #cptList
	from 
	(	
		-- OAS CAHPS ITTI.pdf, p. 14, only 6 procedure codes is needed, filter list for CPT is from this page
		 --according to PG, order in Clarity is not necessary
		select PatientDurableKey, PatientKey, SurgicalCaseKey, Cpt
				, ROW_NUMBER() over (partition by PatientDurableKey order by PatientKey) rn			
		from #allCPT
	)allCPT
	inner join #primCPT primCPT on allCPT.SurgicalCaseKey = primCPT.SurgicalCaseKey
	group by allCPT.PatientDurableKey, allCPT.PatientKey,allCPT.SurgicalCaseKey, CptCode

-- get mobile phone numbers
drop table if exists #mobile
select PatientDurableKey, OTHER_COMMUNIC_NUM
into #mobile
from
(																				-- asume smaller the number, higher the priority
	select distinct s.PatientDurableKey, ph.OTHER_COMMUNIC_NUM, CONTACT_PRIORITY, min(CONTACT_PRIORITY) over (partition by PAT_ID) highestCP
	from #surgPatList s
	inner join CDW_report.FullAccess.PatientDim p with (nolock) on s.PatientDurableKey = p.DurableKey and p.IsCurrent = 1
	inner join CLARITY.dbo.OTHER_COMMUNCTN ph with (nolock) 
		on p.PatientEpicId = ph.PAT_ID and ph.OTHER_COMMUNIC_C = 1  -- 1 is mobile number
) t
where CONTACT_PRIORITY = highestCP

-- get excluded patients
	drop table if exists #excludePat
	select distinct PAT_ID 
	into #excludePat
	from CLARITY.dbo.PATIENT_TYPE patT (nolock)
		inner join CLARITY.dbo.ZC_PATIENT_TYPE zc on patT.PATIENT_TYPE_C = zc.PATIENT_TYPE_C and zc.PATIENT_TYPE_C in (2,6) -- 2 confidential, 6 prisioner

-- get patient's data
drop table if exists #OAS
SELECT distinct	
--cptPat.PatientDurableKey,
--cptPat.PatientKey,
--cptpat.SurgicalCaseKey,
	--[Survey Designator] = case when /*sdept.LocationEpicId =  '10740603'*/ dep.DepartmentEpicId = '11002124' then 'AS0102' else 'AS0101' end
	--, [Client ID] =  loc.[PressGaneyId]
	[Survey Designator] = case when adate.DateValue < '09/01/2025' then 'AS0101'
							   else case when /*sdept.LocationEpicId =  '10740603'*/ dep.DepartmentEpicId = '11002124' then 'AS0103'
									   when loc.[PressGaneyId] = '21344' then 'AS0102'
									   else 'AS0101' end
						  end
	, [Client ID] = case when adate.DateValue < '09/01/2025' then loc.[PressGaneyId]
						 else case loc.[PressGaneyId] when '21344' then '16107' else loc.[PressGaneyId] end
					end
	, [Last Name] = pat.LastName
	, [Middle Initial] = pat.MiddleName
	, [First Name] = pat.FirstName
	, [Address 1] = pat.AddressLine1_X
	, [Address 2] = pat.AddressLine2_X
	, [City] = pat.City
	, [State] = pat.StateOrProvinceAbbreviation
	, [ZIP Code] = pat.PostalCode
	, [Telephone Number] = pat.HomePhoneNumber
	, [Mobile Number] = coalesce(phone.OTHER_COMMUNIC_NUM, '')
	, [Gender] = case pat.Sex when 'Male' then '1' when 'Female' then '2' else 'M' end
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
	, [Site address 2] = ''
	, [Site city] = dep.City -- sdept.City
	, [Site state] = dep.StateOrProvinceAbbreviation -- sdept.StateOrProvinceAbbreviation
	, [Site zip] = dep.PostalCode -- sdept.PostalCode
	, [Patient Admission Source] = --coalesce(nullif(enc.AdmissionSourceCode, ''), nullif(hsp.ADMISSION_SOURCE_C, ''),9)
								case when len(enc.AdmissionSourceCode) > 0 or enc.AdmissionSourceCode <> '' then enc.AdmissionSourceCode 	
									 when hsp.ADMISSION_SOURCE_C <> '' or hsp.ADMISSION_SOURCE_C is not null then hsp.ADMISSION_SOURCE_C
									 else case enc.AdmissionSource	
											when 'Clinic or Physician''s Office' then '2'
											when 'Clinic/Physician Referral' then '2'
											when 'Court/Law Enforcement' then '8'
											when 'Hospital Transfer' then '4'
											when 'Information Not Available' then '9'
											when 'Information Unavailable' then '9'
											when 'Non Healthcare Facility Point of Origin' then '1'
											when 'Non-Health Care Facility Point of Origin' then '1'
											when 'Other Facility' then '6'
											when 'Skilled Nursing Facility Transfer' then '5'
											when 'Transfer from a Hospital (Different Facility)' then '4'
											when 'Transfer from Another Health Care Facility' then '6'
											when 'Transfer from One Distinct Unit to another Distinct Unit in Same Hospital' then 'D'
											when 'Transfer from Skilled Nursing (SNF), Intermediate Care (ICF) or Assisted Living (ALF)' then '5'
											when 'Transfer to Swing-Same Facility' then 'D'
																					else '9' -- Information not available
									end
								end
	, [Patient Discharge Status] = case when len(enc.DischargeDispositionCode) > 0 or enc.DischargeDispositionCode <> '' then enc.DischargeDispositionCode
										when hsp.PATIENT_STATUS_C <> ''  or hsp.PATIENT_STATUS_C is not null then hsp.PATIENT_STATUS_C
										else case enc.DischargeDisposition 
													when 'Acute Inpatient Rehabilitation Facility' then '62' -- map from ITTI
													when 'Admitted as an Inpatient to this Hospital' then '09'
													when 'Another Health Care Institution w/Plan Acute Hosp Re-admit' then '95'
													when 'Another Type of Health Care Institution, not defined elsewhere' then '70' -- map from ITTI
													when 'Another Type of Health Care Institution, not defined elsewhere w/Plan Acute Hosp Re-Admit' then '95' -- map from ITTI
													when 'Court/Law Enforcement' then '21' -- map from ITTI
													when 'Court/Law Enforcement w/Plan Acute Hosp Re-Admit' then '87'
													when 'Custodial/Supportive Care Facility w/Plan Acute Hosp Re-Admit' then '84' -- map from ITTI
													when 'Critical Access Hosp w/Plan Acute Hosp Re-admit' then '94'
													when 'Critical Access Hospital' then '66' -- map from ITTI	
													when 'Designated Cancer Center or Children''s Hospital' then '05' -- map from ITTI
													when 'Designated Cancer Center or Children''s Hospital w/Plan Acute Hosp Re-Admit' then '86' -- map from ITTI
													when 'Designated Disaster Alternate Care' then '69'												
													when 'Disch/trans to Another Type of Health Care Inst not Defined Elsewhere in this List' then '70'
													when 'Discharge Home' then '01'
													when 'Discharged to Home or Self Care (Routine Discharge)' then '01'
													when 'Discharged to OF w/Plan Acute Hosp Re-admit' then '85'
													when 'Discharged/transferred to a another type of health care institution, NEC' then '05'
													when 'Discharged/transferred to a Critical Access Hospital (CAH)' then '66'
													when 'Discharged/transferred to a Facility that Provides Custodial or Supportive Care' then '04'
													when 'Discharged/transferred to a Federal Health Care Facility' then '43'
													when 'Discharged/transferred to a Hospital-Based Medicare Approved Swing Bed' then '61'
													when 'Discharged/transferred to a Medicare Certified Long Term Care Hospital (LTCH)' then '63'
													when 'Discharged/transferred to a Nursing Fac Certified under Medicaid but not Medicare' then '64'
													when 'Discharged/transferred to a Psychiatric Hospital or Psychiatric Hospital Unit' then '65'
													when 'Discharged/transferred to a Short-Term General Hospital for Inpatient Care' then '02'
													when 'Discharged/transferred to an Inpatient Rehab Facility (IRF)' then '62'
													when 'Discharged/transferred to Court/Law Enforcement' then '21'
													when 'Discharged/transferred to Home Under Care of Organized Home Health Service Org' then '06'
													when 'Discharged/transferred to Skilled Nursing Facility (SNF) with Medicare Certification' then '03'
													when 'Expired - Place Unknown' then '42'												
													when 'Expired in a Medical Facility (e.g. hospital, SNF, ICF, or free standing hospice)' then '41'
													when 'Expired in Medical Facility (Hospice Use Only)' then '41' -- map from ITTI													
													when 'Expired' then '20'
													when 'Federal Hospital' then '43' -- map from ITTI
													when 'Federal Hospital w/Plan Acute Hosp Re-admit' then '88'
													when 'Home Health Care Svc' then '06' -- map from ITTI
													when 'Home Health Care Svc w/Plan Acute Hosp Re-admit' then '86'
													when 'Home or Self Care' then '01'
													when 'Home or Self w/Plan Acute Hosp Re-admit' then '81'
													when 'Hospice - Home' then '50'
													when 'Hospice - Medical Facility (Certified) Providing Hospice Level of Care' then '51'
													when 'Hospice/Home' then '50' -- map from ITTI		
													when 'Intermediate CareFacility w/plan Acute Hosp Re-admit' then '84'
													when 'Left Against Medical Advice or Discontinued Care' then '07'
													when 'Left Against Medical Advice' then '07'	-- map from ITTI													
													when 'Left Before Exam Complete' then '2014'											
													when 'Long Term Care' then '63' -- map from ITTI	
													when 'Long Term Care w/Plan Acute Hosp Re-admit' then '91'											
													when 'Nursing Facility' then '03' -- map from ITTI
													when 'Nursing Facility w/Plan Acute Hosp Re-admit' then '92'
													when 'Psychiatric Hospital' then '65' -- map from ITTI
													when 'Psychiatric Hospital w/Plan Acute Hosp Re-admit' then '93'
													when 'Rehab Facility w/Plan Acute Hosp Re-admit' then '90'
													when 'Short Term Hosp w/Plan Acute Hosp Re-admit' then '82'
													when 'Short Term Hospital' then '02' -- map from ITTI
													when 'Skilled NSF w/Plan Acute Hosp Re-admit' then '83'
													when 'Skilled Nursing Facility w/Plan Acute Hosp Re-admit' then '83' -- map from ITTI
													when 'Skilled Rehabilitation Nursing Facility' then '03' -- map from ITTI													
													when 'Still a Patient' then '30'
													when 'Still Patient' then '30'
													when 'Swing Bed w/Plan Acute Hosp Re-admit' then '89'	
												else 'M' end
											end
	, [Visit or Admit Date] = adate.DisplayString
	, [Visit or Admit Time] = format(cast(surgPat.AdmissionInstant as time), 'hhmm')
	, [Discharge Date] = ddate.DisplayString
	, [Discharge Time] = format(cast(surgPat.DischargeInstant as time), 'hhmm')
	, [Service] = surgPat.PrimaryService 
	, [Specialty] = dep.DepartmentSpecialty
	, [Email] = pat.EmailAddress
	, [Procedure Code 1] = coalesce(cptPat.CPT1, '')
	, [Procedure Code 2] = coalesce(cptPat.CPT2, '')
	, [Procedure Code 3] = coalesce(cptPat.CPT3, '')
	, [Procedure Code 4] = coalesce(cptPat.CPT4, '')
	, [Procedure Code 5] = coalesce(cptPat.CPT5, '')
	, [Procedure Code 6] = coalesce(cptPat.CPT6, '')
	, [Deceased Flag] = case when pat.DeathDate is null then 'N' else 'Y' end
	, [Newborn patient] = case when enc.PatientClass = 'Newborn' then 'Y' else 'N' end
	, [Transferred/admitted to inpatient] = 'N' -- since it gets filtered already
	, '$' EOR
into #OAS
FROM #surgPatList surgPat  
	inner join #cptList cptPat on cptPat.PatientDurableKey = surgPat.PatientDurableKey and surgPat.PatientKey = cptPat.PatientKey
	--inner join CDW_report.FullAccess.DepartmentDim sdept with (nolock) on surgPat.LocationKey = sdept.DepartmentKey and sdept.ServiceAreaEpicId = '110'
	inner join CDW_report.FullAccess.ProviderDim prov with (nolock) on surgPat.PrimarySurgeonDurableKey = prov.DurableKey and surgPat.PrimarySurgeonKey = prov.ProviderKey
	inner join CDW_report.FullAccess.EncounterFact enc with (nolock) on surgPat.HospitalEncounterKey = enc.EncounterKey
		left join CDW_report.FullAccess.BillingAccountFact baf on enc.EncounterKey = baf.PrimaryEncounterKey
			left join CLARITY.dbo.HSP_ACCOUNT hsp on baf.AccountEpicId = hsp.HSP_ACCOUNT_ID
	inner join CDW_report.FullAccess.PatientDim pat with (nolock) on cptPat.PatientDurableKey = pat.DurableKey and pat.IsCurrent = 1 -- cptPat.PatientKey = pat.PatientKey
		and pat.PatientEpicId not in (select PAT_ID from #excludePat) -- exclude patients with patient_type in ('confidential', 'prisioner')
	left join #mobile phone on surgPat.PatientDurableKey = phone.PatientDurableKey
	inner join CDW_report.FullAccess.DateDim adate with (nolock) on surgPat.AdmissionDateKey = adate.DateKey
	inner join CDW_report.FullAccess.DateDim ddate with (nolock) on surgPat.DischargeDateKey = ddate.DateKey
	inner join [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc with (nolock) on  surgPat.IntraOpDepartmentKey = loc.DepartmentKey 			
	inner join CDW_report.FullAccess.DepartmentDim dep with (nolock) on surgPat.IntraOpDepartmentKey = dep.DepartmentKey and dep.IsDepartment = 1 and dep.ServiceAreaEpicId = '110'

Where pat.EnterpriseId IN ('E3889067','E1480462') and surgPat.SurgicalCaseEpicId IN('1607963','1635051')
--Where pat.EnterpriseId =  'E1480462' and surgPat.SurgicalCaseEpicId = '1635051'
--		Where pat.EnterpriseId =  'E3889067' and surgPat.SurgicalCaseEpicId = '1607963'
--Where pat.EnterpriseId =  'E1480462' and surgPat.SurgicalCaseEpicId = '1635051'


--1607963-E3889067 --No CPT code
--1635051-E1480462 --No CPT codes
--1607963-E3889067 --No CPT code
--1635051-E1480462 --No CPT codes


Select * from #OAS


--Select * from #allCPT where PatientDurableKey = '860740' and PatientKey = '21825226'

--Select * from CDW_report.FullAccess.PatientDim where EnterpriseId = 'E1480462'

