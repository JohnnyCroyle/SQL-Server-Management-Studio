USE [ETLProcedureRepository]
GO
/****** Object:  StoredProcedure [dbo].[sp_PressGaneyExecuteSurveyDataLoaders]    Script Date: 9/18/2025 2:52:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 09/26/2025

------ Description:	Executes all active Press Ganey survey data load procedures
------              Logs the execution status and any errors encountered
------              in the PressGaneySurveyDataLoadLog table
------              Procedures are defined in the PressGaneySurveyDataLoadProcedures table
------              This procedure is intended to be run as a scheduled job
------              to ensure all survey data is loaded regularly.
------              It uses a cursor to iterate through the list of active procedures
------              and execute them with the provided parameters.
-- =============================================*/

ALTER PROCEDURE dbo.sp_PressGaneyExecuteSurveyDataLoaders
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
			SET @startTime = GETDATE();  -- Capture start time
            SET @sql = 'EXEC ' + QUOTENAME(@proc_name) + 
                       ' @StartDate = @p1, @EndDate = @p2';
            EXEC sp_executesql @sql, 
                N'@p1 DATE, @p2 DATE', 
                @p1 = @StartDate, 
                @p2 = @EndDate;

			SET @endTime = GETDATE();  -- Capture end time

            INSERT INTO dbo.PressGaneySurveyDataLoadLog (proc_name, start_date,end_date,start_execution_time, end_execution_time,status)
            VALUES (@proc_name, @StartDate, @EndDate,@startTime,@endTime,  'Success');
        END TRY
        BEGIN CATCH
			SET @endTime = GETDATE();  -- Still capture end time on failure
            SET @error = ERROR_MESSAGE();

            INSERT INTO dbo.PressGaneySurveyDataLoadLog (proc_name, start_date,end_date,start_execution_time, end_execution_time,status,error_message)
            VALUES (@proc_name, @StartDate, @EndDate,@startTime,@endTime,  'Failure',@error);


            -- Re-throw the error to propagate it to SSIS
            THROW;

        END CATCH;

        FETCH NEXT FROM proc_cursor INTO @proc_name;
    END

    CLOSE proc_cursor;
    DEALLOCATE proc_cursor;

    -- Clean up old log entries older than 6 months
    -- This helps maintain the size of the log table and keeps it manageable
	DELETE FROM dbo.PressGaneySurveyDataLoadLog
	WHERE start_execution_time < DATEADD(MONTH, -6, GETDATE());


END;

