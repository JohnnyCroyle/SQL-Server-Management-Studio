USE [ETLProcedureRepository]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_PressGaneyExecuteSurveyDataLoaders]
		@StartDate = N'01/28/2025',
		@EndDate = N'02/27/2025'

SELECT	'Return Value' = @return_value

GO

--PROD 8/1/2025 for first run. Waitng to confirm

EXEC sp_PressGaneyExecuteSurveyDataLoaders '01/28/2025', '02/27/2025'


--FOR TESING
--1/28/2025	2/27/2025

Select * from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
Select * from  [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF where file_type = 'SP0101' 

Select * from dbo.PressGaneyDailyFile_Archive where [Survey Designator] = 'SP0101' and [Client ID] = ''
and [Visit or Admit Date] > '01312025'

Select * from [dbo].[PressGaneySurveyDataLoadLog] order by start_execution_time desc

SELECT CAST(GETDATE()- 31 AS DATETIME) AS CurrentDateTime;
Select * from PressGaneyFinalSurveyFile


Select *  From  ETLProcedureRepository.[dbo].[ErrorLog]

Select * from dbo.PressGaneySurveyTypePriority


Select * from dbo.PressGaneySurveyDataLoadProcedures

--2/26/2025	3/28/2025

-- Reset tables to start
Delete from [dbo].[PressGaneySurveyDataLoadLog] 
Delete from  dbo.PressGaneyDailyFile_Archive
Delete from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
Delete from [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF
Delete from PressGaneyFinalSurveyFile


EXEC sp_PressGaneyExecuteSurveyDataLoaders 'mb-6','me-6'



--Delete from dbo.PressGaneyDailyFile_Archive where [Survey Designator] = 'SP0101' and [Visit or Admit Date] > '01312025'

--Delete from  [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF where file_type = 'SP0101' and ServiceDate > '01312025'


--Select * from  [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords



    SELECT *
    FROM dbo.PressGaneySurveyDataLoadProcedures
    WHERE is_active = 1;


--EXEC sp_PressGaney_SP0101_Pharmacy '01/28/2025','02/27/2025'

--EXEC sp_PressGaney_OU0101_Rehab '01/28/2025','02/27/2025'

--EXEC sp_PressGaney_UC0101_UrgentCare '01/28/2025','02/27/2025'


SELECT CAST(FORMAT(getdate()- 31, 'MM/dd/yyyy') as varchar(10)) AS StartDate, CAST(FORMAT(getdate() - 1, 'MM/dd/yyyy') as varchar(10)) as EndDate,
'\\eftfs\eftcentral\DataEngineeringTeam\PressGaney\New File Format\' as FilePath

--01/28/2025	02/27/2025

