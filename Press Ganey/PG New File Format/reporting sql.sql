



SELECT
    CAST(SurveySentDate AS DATE) AS SurveyDate,
    COUNT(*) AS DailySurveyCount
FROM dbo.PressGaney_TrackingRecords_NFF
GROUP BY CAST(SurveySentDate AS DATE)
ORDER BY SurveyDate;




Select * from dbo.PressGaney_TrackingRecords_NFF



SELECT
    AVG(DATEDIFF(DAY, CAST(ServiceDate AS DATE), SurveySentDate)) AS AvgDaysToSend
FROM dbo.PressGaney_TrackingRecords_NFF
WHERE ISDATE(ServiceDate) = 1;


SELECT
    [Department Name],
    COUNT(*) AS SurveyCount
FROM dbo.PressGaneyDailyFile_Archive
GROUP BY [Department Name]
ORDER BY SurveyCount DESC;
