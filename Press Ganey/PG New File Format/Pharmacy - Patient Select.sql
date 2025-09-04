

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/02/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters

			SELECT DISTINCT
				en.type,
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
                en.PatientDurableKey, 
                en.PatientKey, 
                en.DepartmentKey,
                en.EncounterKey,
                --AdmissionInstant,
                --DischargeInstant,
                en.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				bill.DiagnosisComboKey,
				NULL as AdmissionTimeOfDayKey, --Not required for Press Ganey
                NULL as DischargeTimeOfDayKey, --Not required for Press Ganey 
				--bill.AdmissionDateKey,
				en.DateKey as AdmissionDateKey, --This date is of the start of the encounter. Will use for Visits
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
				en.ProviderDurableKey
            FROM CDW_report.FullAccess.EncounterFact en 
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON en.PatientDurableKey = pat.DurableKey AND en.PatientKey = pat.PatientKey
				INNER JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.LocationEpicId NOT IN ('11016', '11017')
				INNER JOIN CDW_report.FullAccess.MedicationEventFact meds ON meds.EncounterKey = en.EncounterKey
                INNER JOIN CDW_report.dbo.DurationDim d  ON en.AgeKey = d.DurationKey 
                INNER JOIN CDW_report.dbo.BillingAccountFact bill ON en.PatientDurableKey = bill.PatientDurableKey AND en.PatientKey = bill.PatientKey
               	INNER JOIN CDW_report.FullAccess.DepartmentDim loc  ON en.DepartmentKey = loc.DepartmentKey


            WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
            --WHERE StartDateKey BETWEEN @StartDateInt AND @EndDateInt
				--AND en.[Type] IN ('Occupational Therapy','Physical Therapy','Hospital Encounter','Speech Therapy','Office Visit')
				AND en.[Type] like ('Pharmacy Visit')
				AND loc.ServiceAreaEpicId = '110'
                AND d.Years > 17 -- exclude pediatric
				--AND bill.DiagnosisComboKey <> -1



--Select * from CDW_report.dbo.BillingAccountFact



				--Select DISTINCT AdministrationAction from CDW_report.FullAccess.MedicationEventFact 
				--where Mode =  'Outpatient'
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted') order by AdministrationDateKey desc




				--Select * from CDW_report.FullAccess.MedicationEventFact where 
				--Mode =  'Outpatient'  and 
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted')

				--Select * from CLARITY.dbo.PATIENT