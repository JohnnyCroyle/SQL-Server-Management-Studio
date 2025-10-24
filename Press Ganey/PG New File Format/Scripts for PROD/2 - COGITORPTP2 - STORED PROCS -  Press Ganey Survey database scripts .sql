USE [ETLProcedureRepository]
GO

-- =============================================
-- Combined Press Ganey Stored Procedures for UAT and PROD
-- Author: Johnny Croyle
-- Date: 9/27/2025
-- Description: Combined deployment script for Press Ganey procedures
-- =============================================

-- =============================================
-- 1. sp_PressGaneyExecuteSurveyDataLoaders
-- =============================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PressGaneyExecuteSurveyDataLoaders]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PressGaneyExecuteSurveyDataLoaders]
GO

CREATE PROCEDURE dbo.sp_PressGaneyExecuteSurveyDataLoaders
    @StartDate varchar(10),
    @EndDate varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @proc_name NVARCHAR(255);
    DECLARE @sql NVARCHAR(MAX);
    DECLARE @error NVARCHAR(MAX);
    DECLARE @startTime DATETIME;
    DECLARE @endTime DATETIME;

    DECLARE proc_cursor CURSOR FOR
    SELECT proc_name
    FROM dbo.PressGaneySurveyDataLoadProcedures
    WHERE is_active = 1;

    OPEN proc_cursor;
    FETCH NEXT FROM proc_cursor INTO @proc_name;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        BEGIN TRY
            SET @startTime = GETDATE();
            SET @sql = 'EXEC ' + QUOTENAME(@proc_name) + 
                       ' @StartDate = @p1, @EndDate = @p2';
            EXEC sp_executesql @sql, 
                N'@p1 DATE, @p2 DATE', 
                @p1 = @StartDate, 
                @p2 = @EndDate;

            SET @endTime = GETDATE();

            INSERT INTO dbo.PressGaneySurveyDataLoadLog (proc_name, start_date,end_date,start_execution_time, end_execution_time,status)
            VALUES (@proc_name, @StartDate, @EndDate,@startTime,@endTime,  'Success');
        END TRY
        BEGIN CATCH
            SET @endTime = GETDATE();
            SET @error = ERROR_MESSAGE();

            INSERT INTO dbo.PressGaneySurveyDataLoadLog (proc_name, start_date,end_date,start_execution_time, end_execution_time,status,error_message)
            VALUES (@proc_name, @StartDate, @EndDate,@startTime,@endTime,  'Failure',@error);

            THROW;
        END CATCH;

        FETCH NEXT FROM proc_cursor INTO @proc_name;
    END

    CLOSE proc_cursor;
    DEALLOCATE proc_cursor;

    DELETE FROM dbo.PressGaneySurveyDataLoadLog
    WHERE start_execution_time < DATEADD(MONTH, -6, GETDATE());
END;
GO

-- =============================================
-- 2. sp_PressGaneyProcessSurveyFile
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PressGaneyProcessSurveyFile]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PressGaneyProcessSurveyFile]
GO

CREATE PROCEDURE [dbo].[sp_PressGaneyProcessSurveyFile]
AS
BEGIN TRY
    SET NOCOUNT ON;

    DECLARE @Today DATE = CAST(GETDATE() AS DATE),
            @ProcName AS varchar(255) = OBJECT_NAME(@@PROCID);

    TRUNCATE TABLE PressGaneyFinalSurveyFile;

    WITH RankedEvents AS (
        SELECT 
            df.*,
            1 as priority_rank,
            ROW_NUMBER() OVER (
                PARTITION BY df.[Medical Record Number]
                ORDER BY df.[EventCreatedDate] DESC
            ) AS rn
        FROM dbo.PressGaneyDailyFile df
        LEFT JOIN dbo.PressGaney_TrackingRecords_NFF tr ON tr.PatientEnterpriseID = df.[Medical Record Number] 
                                                            AND tr.unique_ID = df.[Unique ID]
        WHERE tr.SurveySentDate IS NULL
        AND NOT EXISTS (
            SELECT 1
            FROM [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] trk
            WHERE trk.file_type IN ('OASCAHPS', 'HCAHPS')
              AND trk.PatientEnterpriseID = tr.PatientEnterpriseID
              AND trk.ServiceDate = tr.ServiceDate
        )
    )

    INSERT INTO [dbo].[PressGaneyFinalSurveyFile]
    SELECT DISTINCT
        ISNULL([Survey Designator], ''),
        ISNULL([Client ID], ''), 
        ISNULL([Last Name], ''),
        ISNULL([Middle Initial], ''),
        ISNULL([First Name], ''),
        ISNULL([Address 1], ''),
        ISNULL([Address 2], ''),
        ISNULL([Address 3], ''),
        ISNULL([City], ''),
        ISNULL([State], ''),
        ISNULL([ZIP Code], ''),
        ISNULL([Telephone Number], ''),
        ISNULL([Mobile Number], ''),
        ISNULL([MS-DRG], ''),
        ISNULL([Gender], ''),
        ISNULL([Race], ''),
        ISNULL([Ethnicity], ''),
        ISNULL([Date of Birth], ''),
        ISNULL([Language], ''),
        ISNULL([Medical Record Number], ''),
        ISNULL([Unique ID], ''),
        ISNULL([Location Code], ''),
        ISNULL([Location Name], ''),
        ISNULL([Department Code], ''),
        ISNULL([Department Name], ''),
        ISNULL([Attending Physician NPI], ''),
        ISNULL([Attending Physician Name], ''),
        ISNULL([Provider Type], ''),
        ISNULL([Provider specialty], ''),
        ISNULL([Site address 1], ''),
        ISNULL([Site address 2], ''),
        ISNULL([Site city], ''),
        ISNULL([Site state], ''),
        ISNULL([Site zip], ''),
        ISNULL([Patient Admission Source], ''),
        ISNULL([Visit or Admit Date], ''),
        ISNULL([Visit or Admit Time], ''),
        ISNULL([Discharge Date], ''),
        ISNULL([Patient Discharge Status], ''),
        ISNULL([Unit], ''),
        ISNULL([Service], ''),
        ISNULL([Specialty], ''),
        ISNULL([Payor / Insurance / Financial Class], ''),
        ISNULL([Length of Stay], ''),
        ISNULL([Room], ''),
        ISNULL([Bed], ''),
        ISNULL([Hospitalist], ''),
        ISNULL([Fast Track or Acute Flag], ''),
        ISNULL([Email], ''),
        ISNULL([Hospitalist_1], ''),
        ISNULL([Hospitalist_2], ''),
        ISNULL([ER_ADMIT], ''),
        ISNULL([Other Diagnosis or Procedure Code], ''),
        ISNULL([Procedure Code 1], ''),
        ISNULL([Procedure Code 2], ''),
        ISNULL([Procedure Code 3], ''),
        ISNULL([Procedure Code 4], ''),
        ISNULL([Procedure Code 5], ''),
        ISNULL([Procedure Code 6], ''),
        ISNULL([Deceased Flag], ''),
        ISNULL([No Publicity Flag], ''),
        ISNULL([State Regulation Flag], ''),
        ISNULL([Newborn patient], ''),
        ISNULL([Transferred/admitted to inpatient], ''),
        ISNULL([Pharmacy Type], ''),
        ISNULL([ICU], ''),
        ISNULL([Virtual Nursing], ''),
        ISNULL([EOR], ''),
        @ProcName,
        GETDATE()
    FROM RankedEvents
    WHERE rn = 1;

    UPDATE tr
    SET tr.SurveySentDate = @Today
    FROM dbo.PressGaney_TrackingRecords_NFF tr
    INNER JOIN [dbo].[PressGaneyFinalSurveyFile] df  
        ON tr.PatientEnterpriseID = df.[Medical Record Number] AND tr.unique_ID = df.[Unique ID]
    WHERE file_type NOT IN ('OASCAHPS', 'HCAHPS')
    AND tr.SurveySentDate IS NULL;

    WITH RegulatorySurveys AS (
        SELECT
            trk.file_type,
            df.[Unique ID],
            df.[Medical Record Number] as PatientEnterpriseID,
            tr.ServiceDate,
            tr.created_date as SurveySentDate
        FROM dbo.PressGaneyDailyFile df
        INNER JOIN [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] tr ON tr.unique_ID = df.[Unique ID]
        INNER JOIN [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] trk ON trk.PatientEnterpriseID = tr.PatientEnterpriseID
                            AND trk.ServiceDate = tr.ServiceDate
        WHERE trk.file_type IN ('OASCAHPS', 'HCAHPS')
    )

    UPDATE tr
    SET tr.notes = CONCAT(trk.file_type, ' - Regulatory took Priority')
    FROM [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] tr
    INNER JOIN [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] trk ON trk.PatientEnterpriseID = tr.PatientEnterpriseID 
                                        AND trk.ServiceDate = tr.ServiceDate
    INNER JOIN RegulatorySurveys r 	ON r.[Unique ID] = tr.unique_ID;

    INSERT INTO dbo.PressGaneyDailyFile_Archive (
        [Survey Designator],[Client ID],[Last Name],[Middle Initial],[First Name],[Address 1],[Address 2],[Address 3],
        [City],[State],[ZIP Code],[Telephone Number],[Mobile Number],[MS-DRG],[Gender],[Race],[Ethnicity],
        [Date of Birth],[Language],[Medical Record Number],[Unique ID],[Location Code],[Location Name],
        [Department Code],[Department Name],[Attending Physician NPI],[Attending Physician Name],[Provider Type],
        [Provider specialty],[Site address 1],[Site address 2],[Site city],[Site state],[Site zip],
        [Patient Admission Source],[Visit or Admit Date],[Visit or Admit Time],[Discharge Date],
        [Patient Discharge Status],[Unit],[Service],[Specialty],[Payor / Insurance / Financial Class],
        [Length of Stay],[Room],[Bed],[Hospitalist],[Fast Track or Acute Flag],[Email],[Hospitalist_1],
        [Hospitalist_2],[ER_ADMIT],[Other Diagnosis or Procedure Code],[Procedure Code 1],[Procedure Code 2],
        [Procedure Code 3],[Procedure Code 4],[Procedure Code 5],[Procedure Code 6],[Deceased Flag],
        [No Publicity Flag],[State Regulation Flag],[Newborn patient],[Transferred/admitted to inpatient],
        [Pharmacy Type],[ICU],[Virtual Nursing],[EOR],SentStatus
    )
    SELECT 
        ISNULL(df.[Survey Designator], ''),ISNULL(df.[Client ID], ''),ISNULL(df.[Last Name], ''),
        ISNULL(df.[Middle Initial], ''),ISNULL(df.[First Name], ''),ISNULL(df.[Address 1], ''),
        ISNULL(df.[Address 2], ''),ISNULL(df.[Address 3], ''),ISNULL(df.[City], ''),ISNULL(df.[State], ''),
        ISNULL(df.[ZIP Code], ''),ISNULL(df.[Telephone Number], ''),ISNULL(df.[Mobile Number], ''),
        ISNULL(df.[MS-DRG], ''),ISNULL(df.[Gender], ''),ISNULL(df.[Race], ''),ISNULL(df.[Ethnicity], ''),
        ISNULL(df.[Date of Birth], ''),ISNULL(df.[Language], ''),ISNULL(df.[Medical Record Number], ''),
        ISNULL(df.[Unique ID], ''),ISNULL(df.[Location Code], ''),ISNULL(df.[Location Name], ''),
        ISNULL(df.[Department Code], ''),ISNULL(df.[Department Name], ''),ISNULL(df.[Attending Physician NPI], ''),
        ISNULL(df.[Attending Physician Name], ''),ISNULL(df.[Provider Type], ''),ISNULL(df.[Provider specialty], ''),
        ISNULL(df.[Site address 1], ''),ISNULL(df.[Site address 2], ''),ISNULL(df.[Site city], ''),
        ISNULL(df.[Site state], ''),ISNULL(df.[Site zip], ''),ISNULL(df.[Patient Admission Source], ''),
        ISNULL(df.[Visit or Admit Date], ''),ISNULL(df.[Visit or Admit Time], ''),ISNULL(df.[Discharge Date], ''),
        ISNULL(df.[Patient Discharge Status], ''),ISNULL(df.[Unit], ''),ISNULL(df.[Service], ''),
        ISNULL(df.[Specialty], ''),ISNULL(df.[Payor / Insurance / Financial Class], ''),ISNULL(df.[Length of Stay], ''),
        ISNULL(df.[Room], ''),ISNULL(df.[Bed], ''),ISNULL(df.[Hospitalist], ''),ISNULL(df.[Fast Track or Acute Flag], ''),
        ISNULL(df.[Email], ''),ISNULL(df.[Hospitalist_1], ''),ISNULL(df.[Hospitalist_2], ''),ISNULL(df.[ER_ADMIT], ''),
        ISNULL(df.[Other Diagnosis or Procedure Code], ''),ISNULL(df.[Procedure Code 1], ''),
        ISNULL(df.[Procedure Code 2], ''),ISNULL(df.[Procedure Code 3], ''),ISNULL(df.[Procedure Code 4], ''),
        ISNULL(df.[Procedure Code 5], ''),ISNULL(df.[Procedure Code 6], ''),ISNULL(df.[Deceased Flag], ''),
        ISNULL(df.[No Publicity Flag], ''),ISNULL(df.[State Regulation Flag], ''),ISNULL(df.[Newborn patient], ''),
        ISNULL(df.[Transferred/admitted to inpatient], ''),ISNULL(df.[Pharmacy Type], ''),ISNULL(df.[ICU], ''),
        ISNULL(df.[Virtual Nursing], ''),ISNULL(df.[EOR], ''),
        CASE 
            WHEN tr.[Medical Record Number] IS NULL AND tr.[Unique ID] IS NULL THEN 'Not Sent'
            ELSE 'Sent'
        END AS SentStatus
    FROM dbo.PressGaneyDailyFile df
    LEFT JOIN [dbo].[PressGaneyFinalSurveyFile] tr 
        ON tr.[Medical Record Number] = df.[Medical Record Number] AND tr.[Unique ID] = df.[Unique ID];

    TRUNCATE TABLE dbo.PressGaneyDailyFile;

    DELETE FROM dbo.PressGaneyDailyFile_Archive
    WHERE CreatedDate < DATEADD(MONTH, -6, GETDATE());

END TRY
BEGIN CATCH
    EXEC [ETLProcedureRepository].[dbo].[sp_logErrorInfo] @ProcName;
    THROW;
END CATCH
GO

-- =============================================
-- 3. sp_PressGaney_SP0101_Pharmacy
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PressGaney_SP0101_Pharmacy]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PressGaney_SP0101_Pharmacy]
GO

CREATE PROCEDURE [dbo].[sp_PressGaney_SP0101_Pharmacy] 
    @StartDate varchar(10),
    @EndDate varchar(10)
AS
BEGIN TRY
    SET NOCOUNT ON;

    IF OBJECT_ID('tempdb..#PressGaneyFile') IS NOT NULL
    DROP TABLE #PressGaneyFile;

    DECLARE @StartDateInt BIGINT,
            @EndDateInt   BIGINT,
            @file_type	  varchar(10) = 'SP0101',
            @maxD		  datetime, 
            @selfCorrectDate	int,
            @tmpDate			date,
            @errmsg			varchar(255),
            @ProcName		varchar(255)

    SET @ProcName = OBJECT_NAME(@@PROCID);

    IF (@StartDate is null)
        SET @StartDate = 't-30'
    IF (@EndDate is null)
        SET @EndDate = 't'   

    SELECT @maxD = max(created_date) FROM [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] WHERE file_type = @file_type
    SELECT @selfCorrectDate = datediff(dd, @maxD, getdate())
    IF (@maxD < DATEADD(dd, - 9, getdate()))
        SELECT @StartDate = 't - ' + cast((30 + @selfCorrectDate) as varchar(2))  			
    
    SELECT	@StartDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_Start_Date_Fn(@StartDate), 'yyyyMMdd') as bigint)
            , @EndDateInt  = cast(format([ETLProcedureRepository].dbo.MH_Interpret_End_Date_Fn(@EndDate), 'yyyyMMdd') as bigint)

    ;WITH Patients AS (
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
            medorder.EncounterKey, 
            meds.PatientDurableKey,
            meds.PatientKey,
            NULL as AdmissionSource,
            NULL as DischargeDisposition,
            NULL as PatientClass,
            NULL as AdmissionTimeOfDayKey,
            NULL as DischargeTimeOfDayKey,
            DispensePreparedDateKey as AdmissionDateKey,
            DispensePreparedUtcInstant as EventDateTime,
            NULL as DischargeDateKey,
            NULL as DischargeProviderDurableKey,
            NULL as AdmissionSourceCode,
            NULL as DischargeDispositionCode,
            NULL as DiagnosisComboKey,
            NULL as PrimaryDiagnosisKey,
            DispensePreparedDateKey as DateKey
        FROM CDW_report.FullAccess.MedicationDispenseFact as meds WITH (NOLOCK)
            INNER JOIN CDW_Report.FullAccess.PatientDim pat WITH (NOLOCK) ON meds.PatientDurableKey = pat.DurableKey AND pat.isCurrent = 1
                        and pat.PatientEpicId not in (select PAT_ID from ExcludedPatients)
            INNER JOIN CDW_report.FullAccess.MedicationOrderFact as medorder WITH (NOLOCK) ON  medorder.MedicationOrderKey = meds.MedicationOrderKey 
                                                                    AND medorder.PatientDurableKey = pat.DurableKey 
            LEFT JOIN CDW_report.FullAccess.ProviderDim prov ON  prov.ProviderKey = medorder.OrderedByProviderKey 
            INNER JOIN CDW_Report.FullAccess.DepartmentDim dep ON meds.DepartmentKey = dep.DepartmentKey AND dep.IsDepartment = 1 AND dep.ServiceAreaEpicId = '110'
        WHERE 
        meds.DispensePreparedDateKey BETWEEN @StartDateInt AND @EndDateInt
        AND meds.Mode =  'Outpatient'
        AND FillStatus = 'Dispensed'
        AND pat.AgeInYears >= 18
        AND pat.DeathDate IS NULL
        AND NOT EXISTS (SELECT 1
                        FROM CLARITY.dbo.PATIENT_TYPE patT WITH (NOLOCK)
                        INNER JOIN CLARITY.dbo.ZC_PATIENT_TYPE zc WITH (NOLOCK)
                            ON patT.PATIENT_TYPE_C = zc.PATIENT_TYPE_C
                        WHERE patT.PAT_ID = pat.PatientEpicId
                            AND zc.PATIENT_TYPE_C IN (2, 6))
    ),
    MobileNumbers AS (
        SELECT
            p.DurableKey AS PatientDurableKey,
            ph.OTHER_COMMUNIC_NUM,
            ROW_NUMBER() OVER (PARTITION BY p.DurableKey ORDER BY ph.CONTACT_PRIORITY) AS rn
        FROM Patients p
            INNER JOIN CLARITY.dbo.OTHER_COMMUNCTN ph WITH (NOLOCK)
                ON p.PatientEpicId = ph.PAT_ID
                AND ph.OTHER_COMMUNIC_C = 1  AND ph.CONTACT_PRIORITY = 1
    ),
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
            from Patients pat
            inner join CDW_report.FullAccess.ProcedureBridge pro with (nolock) 
                on pat.DiagnosisComboKey = pro.ProcedureComboKey
                where CptCode between '10004' and '69990' or CptCode between '93451' AND '93462' or CptCode between '93566' and '93572'
                        or CptCode in ('92920', '92921','92928','92929','92978','93985','93986')
                        or Code in ('G0104', 'G0105', 'G0121', 'G0260')
            order by ROW_NUMBER() over (partition by pat.PatientDurableKey order by pat.PatientKey)
        ) t
        group by PatientDurableKey, PatientKey
    ),
    PharmacyType as (
        SELECT top 1 with ties
            PAT_MRN_ID,
            PAT_FLAG_TYPE_C,
            ACCT_NOTE_INSTANT,
            CASE 
            WHEN PAT_FLAG_TYPE_C = 2028 THEN 'Home Delivery'
            WHEN PAT_FLAG_TYPE_C IN (2012, 2027) THEN 'Specialty Pharmacy'
        ELSE NULL
        END AS PharmacyType
        FROM Patients as p
            INNER JOIN [CLARITY].[dbo].[PATIENT] AS pat WITH (NOLOCK) ON p.EnterpriseId = pat.PAT_MRN_ID
            INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS] as flags WITH (NOLOCK) ON PATIENT_ID =  pat.PAT_ID          
        WHERE PAT_FLAG_TYPE_C IN (2012,2027,2028) AND ACTIVE_C = 1
        order by  ROW_NUMBER() over (partition by PAT_MRN_ID order by ACCT_NOTE_INSTANT desc)
    )

    SELECT DISTINCT
        [Survey Designator] = 'SP0101',
        [Client ID] = ISNULL(loc.PressGaneyClientID,''),
        [Last Name] = inpat.LastName,
        [Middle Initial] =  ISNULL(LEFT(inpat.MiddleName, 1), ''),
        [First Name] = inpat.FirstName,
        [Address 1] = inpat.AddressLine1_X,
        [Address 2] = inpat.AddressLine2_X,
        [Address 3] = CONVERT(nvarchar(50),''),
        [City] = inpat.City,
        [State] = inpat.StateOrProvinceAbbreviation,
        [ZIP Code] = inpat.PostalCode,
        [Telephone Number] = inpat.HomePhoneNumber,
        [Mobile Number] = ISNULL(mn.OTHER_COMMUNIC_NUM,''),
        [MS-DRG] = ISNULL(drg.Code,''),
        [Gender] = CASE inpat.Sex WHEN 'Male' THEN '1' WHEN 'Female' THEN '2' ELSE 'M' END,
        [Race] = 
            CASE 
                WHEN inpat.FirstRace IS NULL OR inpat.FirstRace IN ('', 'Unknown', 'Not Available', 'Missing','Declined','*Unspecified','*Deleted','*Not Applicable','*Unknown') THEN 'Prefer not to answer'
                WHEN inpat.FirstRace IN ('American Indian or Alaska Native', 'American Indian/Alaska Native', 'American Indian', 'Alaska Native') THEN 'American Indian or Alaskan Native'
                WHEN inpat.FirstRace IN ('Asian', 'Asian - Chinese', 'Asian - Indian', 'Asian - Japanese', 'Asian - Korean', 'Asian - Vietnamese', 'Asian - Filipino', 'Asian - Other') THEN 'Asian'
                WHEN inpat.FirstRace IN ('Black or African American', 'Black/African American', 'Black', 'African American') THEN 'Black or African American'
                WHEN inpat.FirstRace IN ('Native Hawaiian or Other Pacific Islander', 'Native Hawaiian', 'Pacific Islander', 'Native Hawaiian/Pacific Islander') THEN 'Native Hawaiian or other Pacific Islander'
                WHEN inpat.FirstRace IN ('White', 'Caucasian', 'White or Caucasian') THEN 'White or Caucasian'
                WHEN inpat.FirstRace IN ('Other', 'Other Race') THEN 'Other'
                WHEN inpat.FirstRace IN ('Two or more races', 'Multiple', 'Multiracial', 'Multi Racial', 'More than one race')
                     OR inpat.SecondRace IN ('Two or more races', 'Multiple', 'Multiracial', 'Multi Racial', 'More than one race')
                     OR (inpat.SecondRace IS NOT NULL AND inpat.SecondRace <> '' AND inpat.SecondRace <> inpat.FirstRace) THEN 'Two or more races'
                ELSE inpat.FirstRace
            END,
        [Ethnicity] = 
            CASE 
                WHEN inpat.Ethnicity IS NULL OR inpat.Ethnicity IN ('', 'Unknown', 'Not Available', 'Missing','Declined','*Unspecified','Unknown-Patient Confirmed') THEN 'Prefer not to answer'
                WHEN inpat.Ethnicity IN ('Hispanic or Latino', 'Hispanic/Latino', 'Hispanic') THEN 'Hispanic/Latino'
                WHEN inpat.Ethnicity IN ('Not Hispanic or Latino', 'Not Hispanic/Latino', 'Non-Hispanic','White') THEN 'Not Hispanic/Latino'
                ELSE inpat.Ethnicity
            END,
        [Date of Birth] = CASE 
            WHEN inpat.BirthDate IS NULL THEN NULL 
            ELSE FORMAT(inpat.BirthDate, 'MMddyyyy') 
        END,
        [Language] = ISNULL(PG_Lang_Code.PG_Code,'99'),
        [Medical Record Number] = inpat.EnterpriseId,
        [Unique ID] = inpat.EncounterKey,
        [Location Code] = inpat.LocationEpicId,
        [Location Name] = inpat.LocationName,
        [Department Code] = inpat.DepartmentEpicId,
        [Department Name] = inpat.DepartmentName,
        [Attending Physician NPI] = ISNULL(IIF(inpat.Npi='','*Unspecified',inpat.Npi),'*Unspecified'),
        [Attending Physician Name] = ISNULL(IIF(inpat.ProviderName='','*Unspecified',inpat.ProviderName),'*Unspecified'),
        [Provider Type] = ISNULL(IIF(inpat.ProviderType='','*Unspecified',inpat.ProviderType),'*Unspecified'),
        [Provider specialty] = ISNULL(IIF(inpat.ProviderSpeciality='','*Unspecified',inpat.ProviderSpeciality),'*Unspecified'),
        [Site address 1] = inpat.ProviderAddress,
        [Site address 2] = '',
        [Site city] = inpat.ProviderCity,
        [Site state] = inpat.ProviderState,
        [Site zip] = inpat.ProviderZipcode,
        [Patient Admission Source] = inpat.AdmissionSourceCode,
        [Visit or Admit Date] = CASE 
            WHEN inpat.AdmissionDateKey = '-1' THEN ''
            WHEN inpat.AdmissionDateKey = '-2' THEN ''
            WHEN inpat.AdmissionDateKey IS NULL THEN ''
            ELSE FORMAT(CONVERT(DATE, CAST(inpat.AdmissionDateKey AS CHAR(8)), 112),'MMddyyyy')
        END, 
        [Visit or Admit Time] = RIGHT('0000' + CAST(FORMAT(CAST(inpat.EventDateTime AS time),'hhmm') AS VARCHAR(4)), 4),
        [Discharge Date] = CASE 
            WHEN inpat.DischargeDateKey = '-1' THEN ''
            WHEN inpat.DischargeDateKey = '-2' THEN ''
            WHEN inpat.DischargeDateKey IS NULL THEN ''
            ELSE FORMAT(CONVERT(DATE, CAST(inpat.DischargeDateKey AS CHAR(8)), 112),'MMddyyyy')
        END,      
        [Patient Discharge Status] = inpat.DischargeDispositionCode,
        [Unit] = inpat.DepartmentName,
        [Service] = HospitalService,
        [Specialty] = inpat.DepartmentSpecialty,
        [Payor / Insurance / Financial Class] = '',
        [Length of Stay] = LengthOfStayInDays,
        [Room] = '',
        [Bed] = '',
        [Hospitalist] = '',
        [Fast Track or Acute Flag] = '',
        [Email] = inpat.EmailAddress,
        [Hospitalist_1] = '',
        [Hospitalist_2] = '',
        [ER_ADMIT] = '',
        [Other Diagnosis or Procedure Code] = '', 	
        [Procedure Code 1] =  cptPat.CPT1,
        [Procedure Code 2] =  cptPat.CPT2,
        [Procedure Code 3] =  cptPat.CPT3,
        [Procedure Code 4] =  cptPat.CPT4,
        [Procedure Code 5] =  cptPat.CPT5,
        [Procedure Code 6] =  cptPat.CPT6,
        [Deceased Flag] = CASE WHEN inpat.DeathDate IS NOT NULL THEN 'Y' ELSE 'N' END,	
        [No Publicity Flag] = 'N',
        [State Regulation Flag] = 'N',
        [Newborn patient] = CASE WHEN inpat.PatientClass = 'Newborn' THEN 'Y' ELSE 'N' END,
        [Transferred/admitted to inpatient] = '',
        [PharmacyType] = ISNULL(pharm.PharmacyType,'Retail Pharmacy'),
        [ICU] = '',
        [Virtual Nursing] = '',
        '$' EOR,
        inpat.EventDateTime
    INTO #PressGaneyFile 
    FROM Patients inpat 
        LEFT JOIN CDW_report.FullAccess.DrgDim drg WITH (NOLOCK) ON inpat.PrimaryDiagnosisKey = drg.DrgKey AND drg.DrgCodeSet = 'MS-DRG'
        LEFT JOIN CDW_report.FullAccess.DiagnosisDim dia WITH (NOLOCK)  ON inpat.PrimaryDiagnosisKey = dia.DiagnosisKey
        LEFT JOIN CDW_report.FullAccess.DiagnosisTerminologyDim diaTerm WITH (NOLOCK) ON dia.DiagnosisKey = diaTerm.DiagnosisKey AND diaTerm.[Type] = 'ICD-10-CM'
        LEFT JOIN [ETLProcedureRepository].[dbo].[PressGaneySurveyMap] loc WITH (NOLOCK) ON inpat.DepartmentEpicId = loc.DepartmentEpicId
        LEFT JOIN CDW_report.FullAccess.HospitalAdmissionFact ha WITH (NOLOCK) ON inpat.PatientDurableKey = ha.PatientDurableKey AND inpat.PatientKey = ha.PatientKey
        LEFT JOIN CDW_report.FullAccess.BedRequestFact bedreq WITH (NOLOCK) ON ha.AdmissionBedRequestKey = bedreq.BedRequestKey AND inpat.DepartmentKey = bedreq.DestinationBedKey AND inpat.IsBed = 1
        LEFT JOIN MobileNumbers mn	ON inpat.PatientDurableKey = mn.PatientDurableKey AND mn.rn = 1
        LEFT JOIN CPTList cptPat on cptPat.PatientDurableKey = inpat.PatientDurableKey
        LEFT JOIN PharmacyType pharm on inpat.EnterpriseId = pharm.PAT_MRN_ID
        LEFT JOIN [ETLProcedureRepository].[dbo].[PG_Survey_Language_Codes] as PG_Lang_Code WITH (NOLOCK) ON PG_Lang_Code.Language = inpat.PreferredWrittenLanguage_X

    DELETE FROM #PressGaneyFile
    WHERE [Unique ID] in (select [unique_ID] from [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] where [file_type] = @file_type)

    INSERT INTO [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF ([file_type],[unique_ID],[PatientEnterpriseID],[ServiceDate])
    SELECT @file_type, [Unique ID],[Medical Record Number],[Visit or Admit Date] FROM #PressGaneyFile

    INSERT INTO [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
    SELECT *, @ProcName as CreatedBy, getdate()as CreatedDate FROM #PressGaneyFile

    DROP TABLE #PressGaneyFile;

END TRY
BEGIN CATCH
    EXEC [ETLProcedureRepository].[dbo].[sp_logErrorInfo] @ProcName;
    THROW;
END CATCH
GO

-- =============================================
-- 4. sp_PressGaneySurvey_ControlInfo   
-- =============================================
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PressGaneySurvey_ControlInfo]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[sp_PressGaneySurvey_ControlInfo]

GO
/****** Object:  StoredProcedure [dbo].[sp_PressGaneySurvey_ControlInfo]    Script Date: 10/21/2025 1:33:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johnny Croyle
-- Create date: 10/22/2025
-- Description:	Retrieve control information needed to run the SSIS package PressGaneySurveyEngine
-- =============================================
CREATE PROCEDURE [dbo].[sp_PressGaneySurvey_ControlInfo] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT CAST(FORMAT(getdate()-82 , 'MM/dd/yyyy') as varchar(10)) AS StartDate, 
	CAST(FORMAT(getdate() - 11, 'MM/dd/yyyy') as varchar(10)) as EndDate, FilePath,ErrorPath  from PressGaneyControlTable


END
GO


PRINT 'All Press Ganey stored procedures have been successfully deployed to PROD.'
