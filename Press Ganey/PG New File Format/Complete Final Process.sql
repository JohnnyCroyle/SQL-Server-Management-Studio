
-- Clear the final survey file table to prepare for new data
TRUNCATE TABLE PressGaneyFinalSurveyFile
GO

-- Step 1: Define today's date
DECLARE @Today DATE = CAST(GETDATE() AS DATE),
		@ProcName AS varchar(255);
-- retrieve sp name for created by		
SET @ProcName = OBJECT_NAME(@@PROCID);


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
  --Exclude patients who already had a regulatory survey sent that day
	AND NOT EXISTS (
		SELECT 1
		FROM [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] trk
		WHERE trk.file_type IN ('OASCHAPS', 'HCHAPS')
		  AND trk.created_date = @Today
		  AND trk.unique_ID = df.[Unique ID]
		  --AND trk.PatientID = df.[Medical Record Number] -- TODO -- Trang needs to add to her table\process
	)
)

-- Step 3: Select highest-priority event per patient per encounter date
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
    ISNULL([EOR], ''),
	@ProcName,
	getdate()
FROM RankedEvents
WHERE rn = 1
ORDER BY ISNULL([Last Name], '')




-- Step 4: Update tracking records with sent date and priority rank
UPDATE tr
SET 
    tr.SurveySentDate = @Today,
    tr.Priority = stp.priority_rank
FROM dbo.PressGaney_TrackingRecords_NFF tr
    INNER JOIN [dbo].[PressGaneyFinalSurveyFile] df  ON tr.PatientID = df.[Medical Record Number] AND tr.unique_ID = df.[Unique ID]
    INNER JOIN dbo.PressGaneySurveyTypePriority stp
        ON df.[Survey Designator] = stp.survey_type

-- Step 5: Archive the final survey file
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
    ISNULL(df.[Survey Designator], ''),
    ISNULL(df.[Client ID], ''),
    ISNULL(df.[Last Name], ''),
    ISNULL(df.[Middle Initial], ''),
    ISNULL(df.[First Name], ''),
    ISNULL(df.[Address 1], ''),
    ISNULL(df.[Address 2], ''),
    ISNULL(df.[Address 3], ''),
    ISNULL(df.[City], ''),
    ISNULL(df.[State], ''),
    ISNULL(df.[ZIP Code], ''),
    ISNULL(df.[Telephone Number], ''),
    ISNULL(df.[Mobile Number], ''),
    ISNULL(df.[MS-DRG], ''),
    ISNULL(df.[Gender], ''),
    ISNULL(df.[Race], ''),
    ISNULL(df.[Ethnicity], ''),
    ISNULL(df.[Date of Birth], ''),
    ISNULL(df.[Language], ''),
    ISNULL(df.[Medical Record Number], ''),
    ISNULL(df.[Unique ID], ''),
    ISNULL(df.[Location Code], ''),
    ISNULL(df.[Location Name], ''),
    ISNULL(df.[Department Code], ''),
    ISNULL(df.[Department Name], ''),
    ISNULL(df.[Attending Physician NPI], ''),
    ISNULL(df.[Attending Physician Name], ''),
    ISNULL(df.[Provider Type], ''),
    ISNULL(df.[Provider specialty], ''),
    ISNULL(df.[Site address 1], ''),
    ISNULL(df.[Site address 2], ''),
    ISNULL(df.[Site city], ''),
    ISNULL(df.[Site state], ''),
    ISNULL(df.[Site zip], ''),
    ISNULL(df.[Patient Admission Source], ''),
    ISNULL(df.[Visit or Admit Date], ''),
    ISNULL(df.[Visit or Admit Time], ''),
    ISNULL(df.[Discharge Date], ''),
    ISNULL(df.[Patient Discharge Status], ''),
    ISNULL(df.[Unit], ''),
    ISNULL(df.[Service], ''),
    ISNULL(df.[Specialty], ''),
    ISNULL(df.[Payor / Insurance / Financial Class], ''),
    ISNULL(df.[Length of Stay], ''),
    ISNULL(df.[Room], ''),
    ISNULL(df.[Bed], ''),
    ISNULL(df.[Hospitalist], ''),
    ISNULL(df.[Fast Track or Acute Flag], ''),
    ISNULL(df.[Email], ''),
    ISNULL(df.[Hospitalist_1], ''),
    ISNULL(df.[Hospitalist_2], ''),
    ISNULL(df.[ER_ADMIT], ''),
    ISNULL(df.[Other Diagnosis or Procedure Code], ''),
    ISNULL(df.[Procedure Code 1], ''),
    ISNULL(df.[Procedure Code 2], ''),
    ISNULL(df.[Procedure Code 3], ''),
    ISNULL(df.[Procedure Code 4], ''),
    ISNULL(df.[Procedure Code 5], ''),
    ISNULL(df.[Procedure Code 6], ''),
    ISNULL(df.[Deceased Flag], ''),
    ISNULL(df.[No Publicity Flag], ''),
    ISNULL(df.[State Regulation Flag], ''),
    ISNULL(df.[Newborn patient], ''),
    ISNULL(df.[Transferred/admitted to inpatient], ''),
    ISNULL(df.[Pharmacy Type], ''),
    ISNULL(df.[ICU], ''),
    ISNULL(df.[EOR], ''),
    CASE 
        WHEN tr.SurveySentDate IS NOT NULL THEN 'Sent'
        ELSE 'Not Sent'
    END AS SentStatus
FROM dbo.PressGaneyDailyFile df
LEFT JOIN dbo.PressGaney_TrackingRecords_NFF tr ON tr.PatientID = df.[Medical Record Number] AND tr.unique_ID = df.[Unique ID]


-- Clear the daily file table to prepare for the next day's data
TRUNCATE TABLE dbo.PressGaneyDailyFile 



Select * from PressGaneyFinalSurveyFile
