-- Main query with individual time elapsed per row
SELECT
    [log_id],
    [proc_name],
    [start_date],
    [end_date],
    [start_execution_time],
    [end_execution_time],
    [status],
    [error_message],
    CONVERT(VARCHAR, DATEADD(SECOND, 
        DATEDIFF(SECOND, [start_execution_time], [end_execution_time]), 0), 108) AS time_elapsed
FROM 
    [ETLProcedureRepository].[dbo].[PressGaneySurveyDataLoadLog]

UNION ALL

-- Summary row with total time elapsed
SELECT  
    NULL AS log_id,
    'TOTAL' AS proc_name,
    NULL AS start_date,
    NULL AS end_date,
    NULL AS start_execution_time,
    NULL AS end_execution_time,
    NULL AS status,
    NULL AS error_message,
    CONVERT(VARCHAR, DATEADD(SECOND, 
        SUM(DATEDIFF(SECOND, [start_execution_time], [end_execution_time])), 0), 108) AS time_elapsed
FROM 
    [ETLProcedureRepository].[dbo].[PressGaneySurveyDataLoadLog]



ORDER BY 
    start_date DESC;