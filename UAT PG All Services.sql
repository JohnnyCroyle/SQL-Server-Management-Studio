DECLARE @StartDate VARCHAR(10) = '04/01/2024',
        @EndDate   VARCHAR(10) = '04/30/2024',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

        ;WITH Patients35Days AS (
            SELECT DISTINCT 
                ha.PatientDurableKey, 
                ha.PatientKey, 
                ha.DepartmentKey,
                EncounterKey,
                AdmissionInstant,
                DischargeInstant,
                ha.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				DiagnosisComboKey
            FROM CDW_report.FullAccess.EncounterFact ha WITH (NOLOCK)
                INNER JOIN CDW_report.dbo.DurationDim d WITH (NOLOCK) ON ha.AgeKey = d.DurationKey 
                LEFT JOIN CDW_report.dbo.BillingAccountFact bill ON ha.PatientDurableKey = bill.PatientDurableKey
            WHERE ha.DischargeDateKey BETWEEN @StartDateInt AND @EndDateInt
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
                from Patients35Days pat
                inner join CDW_report.FullAccess.ProcedureBridge pro with (nolock) 
                    on pat.DiagnosisComboKey = pro.ProcedureComboKey
                order by ROW_NUMBER() over (partition by pat.PatientDurableKey order by pat.PatientKey)
            ) t
            group by PatientDurableKey, PatientKey
        )
        


SELECT DISTINCT
    [Survey Designator] = 'IN0101',
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
    [Ethnicity] = pat.Ethnicity,
    [Date of Birth] = FORMAT(pat.BirthDate, 'MMddyyyy'),
    [Language] = pat.PreferredWrittenLanguage_X,
    [Medical Record Number] = pat.EnterpriseId,
    [Unique ID] = inpat.EncounterKey,
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
    [Visit or Admit Date] = DTime.DisplayString24Hour,
    [Visit or Admit Time] = Atime.DisplayString24Hour,
    [Discharge Date] = FORMAT(inpat.DischargeInstant, 'MMddyyyy'),
    [Discharge Time] = DTime.DisplayString24Hour,
    [Patient Discharge Status] = inpat.DischargeDispositionCode,
    [Unit] = dep.DepartmentName,
    [Service] = HospitalService,
    [Specialty] = dep.DepartmentSpecialty,
    [Payor / Insurance / Financial Class] = cov.PayorName,
    [Length of Stay] = LengthOfStayInDays,
    [Room] = bed.RoomName,
    [Bed] = bed.BedName,
    [Hospitalist] = '',
    [Fast Track or Acute Flag] = '',
    [Email] = pat.EmailAddress,
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
	[Deceased Flag] = case when pat.DeathDate is not null then 'Y' else 'N' end,	
    [ICD-10] = diaTerm.[Value],
    [No Publicity Flag] = 'N',
    [State Regulation Flag] = 'N',
    [Newborn patient] = CASE WHEN inpat.PatientClass = 'Newborn' THEN 'Y' ELSE 'N' END,
    [Transferred/admitted to inpatient] = ''
FROM CDW_report.FullAccess.EncounterFact inpat
	INNER JOIN Patients35Days as encount ON  inpat.EncounterKey = encount.EncounterKey 
	INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON inpat.PatientDurableKey = pat.DurableKey AND inpat.PatientKey = pat.PatientKey
	INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON inpat.DischargeProviderDurableKey = prov.DurableKey AND inpat.DischargeProviderKey = prov.ProviderKey
	INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON inpat.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.LocationEpicId NOT IN ('11016', '11017')
	LEFT JOIN CDW_report.FullAccess.DrgDim drg WITH (NOLOCK )ON inpat.PrimaryDiagnosisKey = drg.DrgKey AND drg.DrgCodeSet = 'MS-DRG'
	LEFT JOIN CDW_report.FullAccess.DiagnosisDim dia WITH (NOLOCK) ON inpat.PrimaryDiagnosisKey = dia.DiagnosisKey
	INNER JOIN CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm WITH (NOLOCK)	ON dia.DiagnosisKey = diaTerm.DiagnosisKey AND diaTerm.[Type] = 'ICD-10-CM'
	LEFT JOIN CDW_Report.FullAccess.TimeOfDayDim Atime WITH (NOLOCK) ON inpat.AdmissionDateKey = Atime.TimeOfDayKey
	LEFT JOIN CDW_Report.FullAccess.TimeOfDayDim DTime WITH (NOLOCK) ON inpat.DischargeDateKey = DTime.TimeOfDayKey
	LEFT JOIN CDW_report.FullAccess.CoverageDim cov WITH (NOLOCK) ON inpat.PrimaryCoverageKey = cov.CoverageKey	
	LEFT JOIN [EDW_Epic_DMart].[dbo].[DepartmentDimExt] loc WITH (NOLOCK) ON inpat.DepartmentKey = loc.DepartmentKey
	LEFT JOIN CDW_report.FullAccess.HospitalAdmissionFact ha WITH (NOLOCK)	ON inpat.PatientDurableKey = ha.PatientDurableKey AND inpat.PatientKey = ha.PatientKey
	LEFT JOIN CDW_report.FullAccess.BedRequestFact bedreq WITH (NOLOCK)	ON ha.AdmissionBedRequestKey = bedreq.BedRequestKey
	LEFT JOIN CDW_report.FullAccess.DepartmentDim bed WITH (NOLOCK)	ON bed.DepartmentKey = bedreq.DestinationBedKey AND bed.IsBed = 1
	LEFT JOIN MobileNumbers mn	ON pat.DurableKey = mn.PatientDurableKey AND mn.rn = 1
	LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey 
WHERE inpat.DischargeDateKey BETWEEN @StartDateInt AND @EndDateInt 



