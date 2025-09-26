-- Step 1: Define today's date
DECLARE @Today DATE = CAST(GETDATE() AS DATE);

-- Step 2: Join staged file with priority table and rank events
WITH RankedEvents AS (
    SELECT 
        df.*,
        stp.priority_rank,
        ROW_NUMBER() OVER (
            PARTITION BY df.[Medical Record Number] ,[Visit or Admit Date] --TODO Need to test and triple check this
            ORDER BY stp.priority_rank DESC
        ) AS rn
    FROM dbo.PressGaneyDailyFile df
    INNER JOIN dbo.PressGaneySurveyTypePriority stp
        ON df.[Survey Designator] = stp.survey_type
    LEFT JOIN dbo.PressGaney_TrackingRecords_NFF tr ON tr.PatientID = df.[Medical Record Number] AND tr.unique_ID = df.[Unique ID]
    WHERE tr.SurveySentDate IS NULL -- Only exclude if a survey was actually sent
)

-- Step 3: Select highest-priority event per patient per encounter date
SELECT DISTINCT
    [Survey Designator],
    [Client ID],
    [Last Name],
    [Middle Initial],
    [First Name],
    [Address 1],
    [Address 2],
    [Address 3],
    [City],
    [State],
    [ZIP Code],
    [Telephone Number],
    [Mobile Number],
    [MS-DRG],
    [Gender],
    [Race],
    [Ethnicity],
    [Date of Birth],
    [Language],
    [Medical Record Number],
    [Unique ID],
    [Location Code],
    [Location Name],
    [Department Code],
    [Department Name],
    [Attending Physician NPI],
    [Attending Physician Name],
    [Provider Type],
    [Provider specialty],
    [Site address 1],
    [Site address 2],
    [Site city],
    [Site state],
    [Site zip],
    [Patient Admission Source],
    [Visit or Admit Date],
    [Visit or Admit Time],
    [Discharge Date],
    [Patient Discharge Status],
    [Unit],
    [Service],
    [Specialty],
    [Payor / Insurance / Financial Class],
    [Length of Stay],
    [Room],
    [Bed],
    [Hospitalist],
    [Fast Track or Acute Flag],
    [Email],
    [Hospitalist_1],
    [Hospitalist_2],
    [ER_ADMIT],
    [Other Diagnosis or Procedure Code],
    [Procedure Code 1],
    [Procedure Code 2],
    [Procedure Code 3],
    [Procedure Code 4],
    [Procedure Code 5],
    [Procedure Code 6],
    [Deceased Flag],
    [No Publicity Flag],
    [State Regulation Flag],
    [Newborn patient],
    [Transferred/admitted to inpatient],
    [Pharmacy Type],
    [ICU],
    [EOR]
--INTO #FinalSurveyFile
FROM RankedEvents
WHERE rn = 1
Order By [Last Name]



UPDATE tr
SET 
    tr.SurveySentDate = @Today,
    tr.Priority = stp.priority_rank
FROM dbo.PressGaney_TrackingRecords_NFF tr
	 INNER JOIN dbo.PressGaneyDailyFile df  ON tr.PatientID = df.[Medical Record Number] AND tr.unique_ID = df.[Unique ID]
INNER JOIN dbo.PressGaneySurveyTypePriority stp
    ON df.[Survey Designator] = stp.survey_type
WHERE tr.SurveySentDate IS NULL;


--Update tracking table with 
-- Survey Sent Date
--Priority Sent

-- Archive all records from PressGaneyDailyFile with a SentStatus flag

INSERT INTO dbo.PressGaneyDailyFile_Archive (
    [Survey Designator],
    [Client ID],
    [Last Name],
    [Middle Initial],
    [First Name],
    [Address 1],
    [Address 2],
    [Address 3],
    [City],
    [State],
    [ZIP Code],
    [Telephone Number],
    [Mobile Number],
    [MS-DRG],
    [Gender],
    [Race],
    [Ethnicity],
    [Date of Birth],
    [Language],
    [Medical Record Number],
    [Unique ID],
    [Location Code],
    [Location Name],
    [Department Code],
    [Department Name],
    [Attending Physician NPI],
    [Attending Physician Name],
    [Provider Type],
    [Provider specialty],
    [Site address 1],
    [Site address 2],
    [Site city],
    [Site state],
    [Site zip],
    [Patient Admission Source],
    [Visit or Admit Date],
    [Visit or Admit Time],
    [Discharge Date],
    [Patient Discharge Status],
    [Unit],
    [Service],
    [Specialty],
    [Payor / Insurance / Financial Class],
    [Length of Stay],
    [Room],
    [Bed],
    [Hospitalist],
    [Fast Track or Acute Flag],
    [Email],
    [Hospitalist_1],
    [Hospitalist_2],
    [ER_ADMIT],
    [Other Diagnosis or Procedure Code],
    [Procedure Code 1],
    [Procedure Code 2],
    [Procedure Code 3],
    [Procedure Code 4],
    [Procedure Code 5],
    [Procedure Code 6],
    [Deceased Flag],
    [No Publicity Flag],
    [State Regulation Flag],
    [Newborn patient],
    [Transferred/admitted to inpatient],
    [Pharmacy Type],
    [ICU],
    [EOR],
    SentStatus
)
SELECT 
    df.[Survey Designator],
    df.[Client ID],
    df.[Last Name],
    df.[Middle Initial],
    df.[First Name],
    df.[Address 1],
    df.[Address 2],
    df.[Address 3],
    df.[City],
    df.[State],
    df.[ZIP Code],
    df.[Telephone Number],
    df.[Mobile Number],
    df.[MS-DRG],
    df.[Gender],
    df.[Race],
    df.[Ethnicity],
    df.[Date of Birth],
    df.[Language],
    df.[Medical Record Number],
    df.[Unique ID],
    df.[Location Code],
    df.[Location Name],
    df.[Department Code],
    df.[Department Name],
    df.[Attending Physician NPI],
    df.[Attending Physician Name],
    df.[Provider Type],
    df.[Provider specialty],
    df.[Site address 1],
    df.[Site address 2],
    df.[Site city],
    df.[Site state],
    df.[Site zip],
    df.[Patient Admission Source],
    df.[Visit or Admit Date],
    df.[Visit or Admit Time],
    df.[Discharge Date],
    df.[Patient Discharge Status],
    df.[Unit],
    df.[Service],
    df.[Specialty],
    df.[Payor / Insurance / Financial Class],
    df.[Length of Stay],
    df.[Room],
    df.[Bed],
    df.[Hospitalist],
    df.[Fast Track or Acute Flag],
    df.[Email],
    df.[Hospitalist_1],
    df.[Hospitalist_2],
    df.[ER_ADMIT],
    df.[Other Diagnosis or Procedure Code],
    df.[Procedure Code 1],
    df.[Procedure Code 2],
    df.[Procedure Code 3],
    df.[Procedure Code 4],
    df.[Procedure Code 5],
    df.[Procedure Code 6],
    df.[Deceased Flag],
    df.[No Publicity Flag],
    df.[State Regulation Flag],
    df.[Newborn patient],
    df.[Transferred/admitted to inpatient],
    df.[Pharmacy Type],
    df.[ICU],
    df.[EOR],
    CASE 
        WHEN tr.SurveySentDate IS NOT NULL THEN 'Sent'
        ELSE 'Not Sent'
    END AS SentStatus
FROM dbo.PressGaneyDailyFile df
LEFT JOIN dbo.PressGaney_TrackingRecords_NFF tr	ON tr.PatientID = df.[Medical Record Number] AND tr.unique_ID = df.[Unique ID]





--TRUNCATE TABLE dbo.PressGaneyDailyFile 

-- Step 6: Cleanup
--DROP TABLE #FinalSurveyFile;