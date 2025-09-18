

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/07/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

-- Select patient encounters for the specified date range and service area
-- and filter by specific types of encounters

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
				dep.ServiceAreaEpicId,
                meds.MedicationDispenseKey as EncounterKey, -- this is not encounter key but I need a Prim key for tracking
				meds.PatientDurableKey,
				meds.PatientKey,
                NULL as AdmissionSource,
                NULL as DischargeDisposition,
                NULL as PatientClass,
				NULL as AdmissionTimeOfDayKey,
				NULL as DischargeTimeOfDayKey,
				DispenseReceivedDateKey as AdmissionDateKey,
			    NULL as DischargeDateKey,
				NULL as DischargeProviderDurableKey,
				NULL as AdmissionSourceCode,
				NULL as DischargeDispositionCode,
				NULL as DiagnosisComboKey,
				NULL as PrimaryDiagnosisKey,
				DispensePreparedDateKey as DateKey  --This date is of the start of the encounter, visit, etc
            FROM CDW_report.FullAccess.MedicationDispenseFact as meds
				INNER JOIN CDW_Report.FullAccess.PatientDim pat ON meds.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1 --Most Current
				LEFT JOIN CDW_report.FullAccess.MedicationOrderFact as medorder ON  medorder.MedicationOrderKey = meds.MedicationOrderKey 
																		AND  medorder.SentToPharmacyKey = meds.DispensePharmacyKey 
																		AND medorder.PatientDurableKey = pat.DurableKey 
				LEFT JOIN CDW_report.FullAccess.ProviderDim prov ON  prov.ProviderKey = medorder.OrderedByProviderKey 
				INNER JOIN CDW_Report.FullAccess.DepartmentDim dep ON meds.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
            WHERE 
			meds.DispensePreparedDateKey BETWEEN @StartDateInt AND @EndDateInt
			AND meds.Mode =  'Outpatient'
			AND FillStatus = 'Dispensed'




--Select * from CDW_report.dbo.BillingAccountFact

--Select * from CDW_report.FullAccess.MedicationDispenseFact

				--Select DISTINCT AdministrationAction from CDW_report.FullAccess.MedicationEventFact 
				--where Mode =  'Outpatient'
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted') order by AdministrationDateKey desc




				--Select * from CDW_report.FullAccess.MedicationEventFact where 
				--Mode =  'Outpatient'  and 
				
				--AdministrationAction NOT IN  ('*Unspecified','*Deleted')

				--Select * from CLARITY.dbo.PATIENT



				--Select * from CDW_report.FullAccess.MedicationEventFact