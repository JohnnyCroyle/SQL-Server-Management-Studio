

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/15/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters

			SELECT DISTINCT
				en.type,
                en.PatientDurableKey, 
                en.PatientKey,
				en.DateKey, --This date is of the start of the encounter, visit
				bill.AdmissionTimeOfDayKey,
				en.ProviderKey,
				en.ProviderDurableKey,
				--en.PrimaryDiagnosisKey,
				--bill.PrimaryCoverageKey,				
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
				--bill.AccountEpicId, --Using Ecounter Key as Unique Visit Number instead
				dep.LocationEpicId,
				dep.LocationName,
				prov.Npi,
				prov.Name,
				prov.Type,
				prov.PrimarySpecialty,
				dep.Address,
				dep.City,
				dep.StateOrProvinceAbbreviation,
				dep.PostalCode,
				dep.DepartmentName,
				dep.DepartmentSpecialty,
                --en.DepartmentKey,
                --en.EncounterKey,
                en.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				--bill.DiagnosisComboKey,
				--en.AdmittingProviderDurableKey,
				--bill.AttendingProviderDurableKey,
				DischargeProviderDurableKey,
				AdmissionSourceCode,
				DischargeDispositionCode,
				loc.ServiceAreaEpicId

            FROM CDW_report.FullAccess.EncounterFact en 
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON en.PatientDurableKey = pat.DurableKey AND en.PatientKey = pat.PatientKey
				LEFT JOIN CDW_report.FullAccess.ProviderDim prov WITH (NOLOCK) ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
				LEFT JOIN CDW_Report.FullAccess.DepartmentDim dep WITH (NOLOCK) ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.LocationEpicId NOT IN ('11016', '11017')
                LEFT JOIN CDW_report.dbo.DurationDim d  ON en.AgeKey = d.DurationKey 
                LEFT JOIN CDW_report.dbo.BillingAccountFact bill ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
               	LEFT JOIN CDW_report.FullAccess.DepartmentDim loc  ON en.DepartmentKey = loc.DepartmentKey

            WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
            --WHERE StartDateKey BETWEEN @StartDateInt AND @EndDateInt
				--AND en.[Type] IN ('Occupational Therapy','Physical Therapy','Hospital Encounter','Speech Therapy','Office Visit')
				--AND (en.[Type] IN ('Speech Therapy ','Occupational Therapy','Physical Therapy','Office Visit')
				--AND en.[Type] = 'Hospital Encounter' 
				AND dep.DepartmentSpecialty IN ('Urgent Care')
				--FOR ALL OUTPATIENT THERAPY
				AND loc.ServiceAreaEpicId = '110'
                AND d.Years > 17 -- exclude pediatric



				--Select DISTINCT (Type) from CDW_report.FullAccess.EncounterFact order by Type


				--Select * from CDW_report.dbo.BillingAccountFact


				--Select DISTINCT (DepartmentSpecialty) from CDW_Report.FullAccess.DepartmentDim order by DepartmentSpecialty


				--Select DISTINCT AdministrationAction from CDW_report.FullAccess.MedicationEventFact 
				--where Mode =  'Outpatient'
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted') order by AdministrationDateKey desc




				--Select * from CDW_report.FullAccess.MedicationEventFact where 
				--Mode =  'Outpatient'  and 
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted')