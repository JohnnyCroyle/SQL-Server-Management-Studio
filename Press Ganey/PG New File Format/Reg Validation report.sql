USE [ETLProcedureRepository]




-- =============================================
-- Compare Tracking Records for Same Patient & Date
-- =============================================
SELECT 
    reg.PatientEnterpriseID,
    reg.ServiceDate as Reg_ServiceDate,
    reg.file_type AS RegulatorySurveyType,
    nonreg.file_type AS NonRegSurveyType,
    --reg.SurveySentDate AS RegulatorySentDate,
    nonreg.ServiceDate AS NonRegServiceDate,
    nonreg.notes AS NonRegNotes
FROM dbo.PressGaney_TrackingRecords reg
INNER JOIN dbo.PressGaney_TrackingRecords_NFF nonreg
    ON reg.PatientEnterpriseID = nonreg.PatientEnterpriseID
    AND nonreg.ServiceDate =  reg.ServiceDate
WHERE reg.file_type IN ('OASCAHPS', 'HCAHPS')
  AND nonreg.file_type NOT IN ('OASCAHPS', 'HCAHPS')
  --AND nonreg.SurveySentDate IS NOT NULL
ORDER BY reg.PatientEnterpriseID, reg.ServiceDate


--Select * from dbo.PressGaney_TrackingRecords_NFF


-- =============================================
-- Unified Survey Report: Sent Status, Type, and Metadata
-- =============================================
--SELECT 
--    COALESCE(reg.PatientEnterpriseID, nonreg.PatientEnterpriseID, archive.[Medical Record Number]) AS PatientEnterpriseID,
--    COALESCE(reg.ServiceDate, nonreg.ServiceDate, archive.[Visit or Admit Date]) AS ServiceDate,
--    COALESCE(reg.file_type, nonreg.file_type, archive.[Survey Designator]) AS SurveyType,
--    archive.[Survey Designator],
--    archive.[Unique ID],
--    archive.[SentStatus],
--    COALESCE(reg.created_date, nonreg.SurveySentDate, archive.CreatedDate) AS SurveySentDate,
--    --COALESCE(reg.notes, nonreg.notes, archive.notes) AS Notes,
--    archive.[Department Name],
--    archive.[Location Name],
--    archive.[Attending Physician Name],
--    archive.[CreatedDate]

--FROM [ETLProcedureRepository].[dbo].[PressGaneyDailyFile_Archive] archive
--LEFT JOIN dbo.PressGaney_TrackingRecords reg
--    ON archive.[Medical Record Number] = reg.PatientEnterpriseID
--    AND archive.[Visit or Admit Date] = reg.ServiceDate
--LEFT JOIN [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords_NFF] nonreg
--    ON archive.[Unique ID] = nonreg.[unique_ID]
--ORDER BY PatientEnterpriseID, ServiceDate;





--Select *  FROM dbo.PressGaney_TrackingRecords where PatientEnterpriseID  is not null

---- =============================================
---- Section 1: Missing Final Survey Records
---- =============================================
--SELECT tr.unique_ID, tr.PatientEnterpriseID, tr.ServiceDate
--FROM dbo.PressGaney_TrackingRecords_NFF tr
--LEFT JOIN dbo.PressGaneyFinalSurveyFile f
--  ON tr.unique_ID = f.[Unique ID]
--WHERE f.[Unique ID] IS NULL
--AND tr.file_type IN ('OASCAHPS', 'HCAHPS');

--Select * from dbo.PressGaney_TrackingRecords_NFF


---- =============================================
---- Section 2: Priority Ranking Validation
---- =============================================
--SELECT df.[Medical Record Number], df.[Unique ID], df.[Survey Designator], stp.priority_rank
--FROM dbo.PressGaneyFinalSurveyFile df
--LEFT JOIN dbo.PressGaneySurveyTypePriority stp
--  ON df.[Survey Designator] = stp.survey_type
--WHERE stp.priority_rank IS NULL;

---- =============================================
---- Section 3: Regulatory Surveys Took Priority
---- =============================================
--SELECT tr.unique_ID, tr.notes
--FROM dbo.PressGaney_TrackingRecords_NFF tr
--WHERE tr.notes LIKE '%Regulatory took Priority%'
--AND tr.file_type NOT IN ('OASCAHPS', 'HCAHPS');

---- =============================================
---- Section 4: Sent Status in Archive
---- =============================================
--SELECT [Survey Designator], [Medical Record Number], [Unique ID], SentStatus
--FROM dbo.PressGaneyDailyFile_Archive
--WHERE SentStatus = 'Not Sent'
--AND [Survey Designator] IN ('OASCAHPS', 'HCAHPS');

---- =============================================
---- Section 5: Duplicate Final Survey Entries
---- =============================================
--SELECT [Medical Record Number], [Unique ID], COUNT(*) AS RecordCount
--FROM dbo.PressGaneyFinalSurveyFile
--GROUP BY [Medical Record Number], [Unique ID]
--HAVING COUNT(*) > 1;