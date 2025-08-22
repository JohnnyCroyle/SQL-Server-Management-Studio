

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
				ha.AdmittingProviderDurableKey,
				DischargeProviderDurableKey,
				ha.PrimaryDiagnosisKey,
				bill.PrimaryCoverageKey,
				AdmissionSourceCode,
				DischargeDispositionCode,
				bill.AttendingProviderDurableKey,
				ProviderKey
            FROM CDW_report.FullAccess.EncounterFact ha 
                INNER JOIN CDW_report.dbo.DurationDim d  ON ha.AgeKey = d.DurationKey 
                INNER JOIN CDW_report.dbo.BillingAccountFact bill ON ha.PatientDurableKey = bill.PatientDurableKey
               	INNER JOIN CDW_report.FullAccess.DepartmentDim loc  ON ha.DepartmentKey = loc.DepartmentKey
            WHERE bill.AdmissionDateKey BETWEEN @StartDateInt AND @EndDateInt
				--AND ha.[Type] IN ('Occupational Therapy','Physical Therapy','Hospital Encounter','Speech Therapy','Office Visit')
				AND ha.[Type] like ('Pharmacy Visit')
				AND loc.ServiceAreaEpicId = '110'
                AND d.Years > 17 -- exclude pediatric
