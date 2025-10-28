-- =============================================
-- Press Ganey Survey Engine Setup Script
-- Target Server: DATAWHprdAGL
-- Author: Johnny Croyle
-- Create date: 10/22/2025
-- Description: Sets up control table entry and stored procedure for Press Ganey Survey Engine SSIS package
-- =============================================

USE [EDW_Work]
GO

-- =============================================
-- Insert control information for Press Ganey Survey Engine
-- This record contains configuration details needed by the SSIS package
-- =============================================
INSERT [dbo].[EpicExtracts_FileInfo] (
    [ID], 
    [file_path], 
    [package_name], 
    [datetime_stamp], 
    [file_ext], 
    [file_name_pattern], 
    [file_name], 
    [col_delimiter], 
    [txt_qualifier_req], 
    [team_email], 
    [report_schedule], 
    [SLA], 
    [datasource], 
    [stored_proc], 
    [param], 
    [result_set], 
    [row_count], 
    [col_count], 
    [avoid_special_chars], 
    [error_file_path], 
    [request_num]
) 
VALUES (
    45,                                                                         -- Unique ID for this configuration
    N'\\eftfs\eftcentral\DataEngineeringTeam\PressGaney',                      -- Source file path
    N'PressGaneyEngineProcess',                                                 -- SSIS package name
    NULL,                                                                       -- Dynamic datetime stamp
    N'.csv',                                                                    -- Expected file extension
    N'PG_GENERAL_MAINEHEALTH',                                                  -- File name pattern to match
    NULL,                                                                       -- Specific file name (NULL for pattern matching)
    N'|',                                                                       -- Column delimiter (pipe)
    0,                                                                          -- Text qualifier not required
    N'data_engineering@mainehealth.org',                                        -- Team email for notifications
    N'daily,1pm',                                                               -- Report schedule
    NULL,                                                                       -- SLA not specified
    N'COGITORPTP2',                                                            -- Data source server
    N'ETLProcedureRepository.dbo.sp_PressGaneyExecuteSurveyDataLoaders ?, ?',  -- Stored procedure to execute
    NULL,                                                                       -- Parameters (handled dynamically)
    NULL,                                                                       -- Result set info
    CAST(0 AS Numeric(2, 0)),                                                  -- Row count placeholder
    78,                                                                         -- Expected column count
    NULL,                                                                       -- Special character handling
    N'\\eftfs\eftcentral\DataEngineeringTeam\ErrorFiles',                      -- Error file path
    NULL                                                                        -- Request number
)
GO

-- =============================================
-- Create/Alter stored procedure to retrieve Press Ganey control information
-- This procedure provides configuration data needed by the SSIS package
-- =============================================
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_PressGaneySurvey_ControlInfo]') AND type in (N'P', N'PC'))
BEGIN
    EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_PressGaneySurvey_ControlInfo] AS'
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_PressGaneySurvey_ControlInfo] 
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from interfering with SELECT statements
    SET NOCOUNT ON;

    -- Return control information for Press Ganey Survey Engine
    -- StartDate: 31 days ago from current date
    -- EndDate: Yesterday's date  
    -- FilePath: Source directory for Press Ganey files
    -- ErrorPath: Directory for error/failed files
    -- ServerName: Target server for data processing

	--PROD
    --SELECT 
    --    CAST(FORMAT(GETDATE() - 31, 'MM/dd/yyyy') AS VARCHAR(10)) AS StartDate,     -- Data extraction start date (31 days back)
    --    CAST(FORMAT(GETDATE() - 1, 'MM/dd/yyyy') AS VARCHAR(10)) AS EndDate,       -- Data extraction end date (yesterday)
    --    file_path AS FilePath,                                                      -- Source file directory
    --    error_file_path AS ErrorPath,                                               -- Error file directory
    --    datasource AS ServerName                                                    -- Target server name
    --FROM EpicExtracts_FileInfo
    --WHERE package_name = 'PressGaneyEngineProcess'                                  -- Filter for Press Ganey package configuration


	--UPDATE FILE
	SELECT '08/01/2025' AS StartDate, 
	'10/11/2025' as EndDate, file_path as FilePath,error_file_path as  ErrorPath,datasource as ServerName  from EpicExtracts_FileInfo
	Where package_name = 'PressGaneyEngineProcess'

	----BACK LOAD FILE
	--SELECT '10/12/2025' AS StartDate, 
	--'10/11/2025' as EndDate, file_path as FilePath,error_file_path as  ErrorPath,datasource as ServerName  from EpicExtracts_FileInfo
	--Where package_name = 'PressGaneyEngineProcess'

END
GO

-- Script execution completed
PRINT 'Press Ganey Survey Engine setup completed successfully on DATAWHprdAGL'
