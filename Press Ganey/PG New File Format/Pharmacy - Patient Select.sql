

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
				--meds.*,
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
                en.AdmissionSource,
                en.DischargeDisposition,
                en.PatientClass,
				NULL as AdmissionTimeOfDayKey, --Not required for Press Ganey
                NULL as DischargeTimeOfDayKey, --Not required for Press Ganey 
				en.DateKey as AdmissionDateKey, --This date is of the start of the encounter. Will use for Visits
                --NOTE to self: This is the date of the encounter, not the admission date. 
                --Probably should be used for Visits and not Admissions
				en.DischargeDateKey,
				--bill.AdmittingProviderDurableKey,
				en.DischargeProviderDurableKey,
				en.PrimaryDiagnosisKey,
				--bill.PrimaryCoverageKey,
				en.AdmissionSourceCode,
				en.DischargeDispositionCode,
				NULL as AttendingProviderDurableKey,
				loc.ServiceAreaEpicId,
				en.ProviderKey,
				en.ProviderDurableKey
				--bill.DiagnosisComboKey

            FROM CDW_report.FullAccess.EncounterFact en 
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON en.PatientDurableKey = pat.DurableKey AND en.PatientKey = pat.PatientKey
				INNER JOIN CDW_report.FullAccess.ProviderDim prov  ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep  ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.LocationEpicId NOT IN ('11016', '11017')
				INNER JOIN CDW_report.FullAccess.MedicationEventFact meds ON meds.EncounterKey = en.EncounterKey
                INNER JOIN CDW_report.dbo.DurationDim d  ON en.AgeKey = d.DurationKey 
                INNER JOIN CDW_report.dbo.BillingAccountFact bill ON en.PatientDurableKey = bill.PatientDurableKey AND en.PatientKey = bill.PatientKey
               	INNER JOIN CDW_report.FullAccess.DepartmentDim loc  ON en.DepartmentKey = loc.DepartmentKey
            WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
				AND en.[Type] like ('Pharmacy Visit')
				AND loc.ServiceAreaEpicId = '110'
                AND d.Years > 17 -- exclude pediatric
				AND meds.Mode =  'Outpatient'




--Select * from CDW_report.dbo.BillingAccountFact



				--Select DISTINCT AdministrationAction from CDW_report.FullAccess.MedicationEventFact 
				--where Mode =  'Outpatient'
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted') order by AdministrationDateKey desc




				--Select * from CDW_report.FullAccess.MedicationEventFact where 
				--Mode =  'Outpatient'  and 
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted')

				--Select * from CLARITY.dbo.PATIENT



				--Select * from CDW_report.FullAccess.MedicationEventFact