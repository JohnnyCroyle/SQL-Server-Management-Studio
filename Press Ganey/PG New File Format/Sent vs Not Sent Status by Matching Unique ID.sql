
SELECT
    ServiceDate,
	a.[Survey Designator],
	a.[Medical Record Number],
    a.[Unique ID],
	CONCAT(a.[Last Name],', ',a.[First Name]) as PatientName, 
    --a.[SentStatus] AS ArchiveSentStatus,
    tr.[SurveySentDate],
    CASE 
        WHEN tr.[SurveySentDate] IS NULL THEN 'Not Sent'
        ELSE 'Sent'
    END AS TrackingSentStatus,
	notes
FROM dbo.PressGaneyDailyFile_Archive a
LEFT JOIN dbo.PressGaney_TrackingRecords_NFF tr
    ON a.[Unique ID] = CAST(tr.[unique_ID] AS NVARCHAR(255))

	--Where [Survey Designator] = 'NICU0101'

Order by [Last Name]


--SELECT
--    a.[Unique ID],
--    a.[SentStatus] AS ArchiveSentStatus,
--    trnff.[SurveySentDate],
--    CASE 
--        WHEN trnff.[SurveySentDate] IS NULL THEN 'Not Sent'
--        ELSE 'Sent'
--    END AS TrackingSentStatus,
--    tr.[file_type] AS RegulatoryType
--FROM dbo.PressGaneyDailyFile_Archive a
--LEFT JOIN dbo.PressGaney_TrackingRecords_NFF trnff
--    ON a.[Unique ID] = CAST(trnff.[unique_ID] AS NVARCHAR(255))
--LEFT JOIN dbo.PressGaney_TrackingRecords tr
--    ON a.[Medical Record Number] = CAST(tr.[unique_ID] AS NVARCHAR(255))
--WHERE tr.[file_type] IN ('OASCHAPS', 'HCHAPS');


--Select * from dbo.PressGaneyDailyFile_Archive


--SELECT
--    CASE 
--        WHEN SurveySentDate IS NULL THEN 'Not Sent'
--        ELSE 'Sent'
--    END AS SurveyStatus,
--    COUNT(*) AS RecordCount
--FROM dbo.PressGaney_TrackingRecords_NFF
--GROUP BY 
--    CASE 
--        WHEN SurveySentDate IS NULL THEN 'Not Sent'
--        ELSE 'Sent'
--    END;