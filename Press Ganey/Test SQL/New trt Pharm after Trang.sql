	
	
DECLARE @StartDate VARCHAR(10) = '08/21/2025',
        @EndDate   VARCHAR(10) = '08/21/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
	--@StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
 --   @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);


	@StartDateInt =  20250821,
	@EndDateInt = 20250821;
	
	
	
	
	SELECT DISTINCT
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
                en.EncounterKey,
                en.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				bill.DiagnosisComboKey,
				en.DateKey as AdmissionDateKey, --This date is of the start of the encounter. Will use for Visits
                --NOTE to self: This is the date of the encounter, not the admission date. 
                --Probably should be used for Visits and not Admissions
				en.DischargeDateKey,
				NULL as AdmissionTimeOfDayKey, --Not required for Press Ganey
                NULL as DischargeTimeOfDayKey, --Not required for Press Ganey 
				DischargeProviderDurableKey,
				AdmissionSourceCode,
				DischargeDispositionCode,
				ServiceAreaEpicId,
                en.PatientDurableKey, 
                en.PatientKey,
				en.DateKey, --This date is of the start of the encounter, visit
				en.ProviderKey,
				en.ProviderDurableKey,
				en.PrimaryDiagnosisKey
            FROM CDW_report.FullAccess.MedicationDispenseFact as meds
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON meds.PatientDurableKey = pat.DurableKey AND meds.PatientKey = pat.PatientKey
				LEFT JOIN CDW_report.FullAccess.EncounterFact as en ON en.EncounterKey = meds.EncounterKey
				LEFT JOIN CDW_report.FullAccess.ProviderDim prov ON en.ProviderDurableKey = prov.DurableKey AND en.ProviderKey = prov.ProviderKey
                LEFT JOIN CDW_report.dbo.BillingAccountFact bill ON en.PatientDurableKey = bill.PatientDurableKey
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep ON meds.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
            WHERE 
			meds.DispenseReceivedDateKey BETWEEN @StartDateInt AND @EndDateInt
			AND meds.Mode =  'Outpatient'
			AND en.DerivedEncounterStatus <> 'Invalid'


			Order by LastName