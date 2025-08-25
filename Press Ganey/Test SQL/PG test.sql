DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/05/2025',
        @StartDateInt BIGINT,
        @EndDateInt   BIGINT;

SELECT 
    @StartDateInt = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') AS BIGINT),
    @EndDateInt   = CAST(FORMAT([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') AS BIGINT);

-- OU0101
-- Type
-- Age >=18
-- Service Area '110' = MAINEHEALTH
-- Date Range = Appointment Date???
-- PG Service ID

--9496

--Select top 50 * from CDW_report.FullAccess.EncounterFact  Where [Type] = 'Occupational Therapy'



            --SELECT DISTINCT  TOP(500) 
			SELECT DISTINCT
				bill.AccountEpicId,
				ha.type,
                ha.PatientDurableKey, 
                ha.PatientKey, 
                ha.DepartmentKey,
                EncounterKey,
                AdmissionInstant,
                DischargeInstant,
                ha.AdmissionSource,
                DischargeDisposition,
                PatientClass,
				DiagnosisComboKey,
				AdmissionTimeOfDayKey,
				DischargeTimeOfDayKey,
				bill.AdmissionDateKey,
				bill.DischargeDateKey,
				ProviderDurableKey,
				bill.AdmittingProviderDurableKey,
				DischargeProviderDurableKey,
				bill.AttendingProviderDurableKey,
				ProviderKey

            FROM CDW_report.FullAccess.EncounterFact ha 
                INNER JOIN CDW_report.dbo.DurationDim d  ON ha.AgeKey = d.DurationKey 
                INNER JOIN CDW_report.dbo.BillingAccountFact bill ON ha.PatientDurableKey = bill.PatientDurableKey
               	INNER JOIN CDW_report.FullAccess.DepartmentDim loc  ON ha.DepartmentKey = loc.DepartmentKey
            WHERE bill.AdmissionDateKey BETWEEN @StartDateInt AND @EndDateInt
				AND ha.[Type] IN ('Occupational Therapy','Physical Therapy','Hospital Encounter','Speech Therapy','Office Visit')
				AND loc.ServiceAreaEpicId = '110'
                AND d.Years > 17 -- exclude pediatric
				AND ha.DerivedEncounterStatus = 'Complete'







				
 
 
 

 




				--Select * from CDW_report.FullAccess.DepartmentDim 


			--	Select * from CDW_report.dbo.DurationDim 


				--Select * from CDW_report.dbo.PlaceOfServiceDim Where Name = 'MAINEHEALTH' 
				

				--Select * from [EDW_Epic_DMart].[dbo].MH_LocationIDdepartmentKeyMapping where LocationName = 'MAINEHEALTH'

				--Select * from [EDW_Epic_DMart].[dbo].[DepartmentDimExt]




