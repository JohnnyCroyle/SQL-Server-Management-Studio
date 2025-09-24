

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/07/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    --@StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    --@EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

	@StartDateInt =  20250821,
	@EndDateInt = 20250821;
	

-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters

			SELECT DISTINCT
			--en.*,

				en.type as EncounterType,
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
				dep.IsBed,
				dep.RoomName,
				dep.BedName,
				dep.ServiceAreaEpicId,
                en.PatientDurableKey, 
                en.PatientKey,
				en.DateKey, --This date is of the start of the encounter, visit
				bill.AdmissionTimeOfDayKey,
				en.ProviderKey,
				en.ProviderDurableKey,
				en.PrimaryDiagnosisKey,
				--bill.PrimaryCoverageKey,
                en.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				--bill.DiagnosisComboKey,
				--en.AdmittingProviderDurableKey,
				--bill.AttendingProviderDurableKey,
				DischargeProviderDurableKey,
				AdmissionSourceCode,
				DischargeDispositionCode,
				ServiceAreaEpicId

            FROM CDW_report.FullAccess.EncounterFact en 
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON en.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1 --Most Current
				INNER JOIN CDW_report.FullAccess.ProviderDim prov ON  prov.ProviderKey = en.ProviderKey  
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep ON en.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
                LEFT JOIN CDW_report.dbo.BillingAccountFact bill ON en.PatientDurableKey = bill.PatientDurableKey AND bill.PrimaryEncounterKey = en.EncounterKey
            WHERE en.DateKey BETWEEN @StartDateInt AND @EndDateInt
				AND en.[Type] IN ('Office Visit','Clinical Support','Behavioral Health','Nurse Triage','Results Follow-Up','Telemedicine','IMAT','Hospital Encounter')
				AND dep.DepartmentSpecialty IN ('Family Medicine','Primary Care','Multi-Specialty','Emergency Medicine')
				AND DerivedEncounterStatus = 'Complete'


				--AND  EnterpriseId IN ('E424662','E442724','E460384','E476402','E500288','E500858')


--				Hospital Encounter
--History
--Hospital Encounter
--Hospital Encounter
--Hospital Encounter
--History
--Hospital Encounter
--Office Visit
--Hospital Encounter
--Telephone

--'E506942,'
--'E514383,'
--'E26594,'
--'E538661,'
--'E540589,'
--'E573163,'
--'E596750,'
--'E607452,')


				Order by LastName

				
				







				--Select DISTINCT (Type) from CDW_report.FullAccess.EncounterFact order by Type


				--Select * from CDW_report.dbo.BillingAccountFact


				--Select DISTINCT (DepartmentSpecialty) from CDW_Report.FullAccess.DepartmentDim order by DepartmentSpecialty


				--Select DISTINCT AdministrationAction from CDW_report.FullAccess.MedicationEventFact 
				--where Mode =  'Outpatient'
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted') order by AdministrationDateKey desc




				--Select * from CDW_report.FullAccess.MedicationEventFact where 
				--Mode =  'Outpatient'  and 
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted')