USE [ETLProcedureRepository]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_PressGaneyExecuteSurveyDataLoaders]
		@StartDate = N'01/01/2025',
		@EndDate = N'01/14/2025'

SELECT	'Return Value' = @return_value

GO




--Select * from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
--Select * from  [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF


Select * from dbo.PressGaneyDailyFile_Archive order by [Last Name]

Select * from [dbo].[PressGaneySurveyDataLoadLog] order by execution_time desc

--Delete from [dbo].[PressGaneySurveyDataLoadLog] 
--Delete from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
--Delete from [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF


