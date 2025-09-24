USE [ETLProcedureRepository]
GO

-- This is just to test calling procs and will be include in the process

--Clear bucket table
Delete from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]

DECLARE @StartDate VARCHAR(10) = '01/01/2025',
        @EndDate   VARCHAR(10) = '01/07/2025';


EXEC	[ETLProcedureRepository].[dbo].[sp_PressGaney_SP0101_Pharmacy]
		@StartDate =@StartDate,
		@EndDate = @EndDate


EXEC	[dbo].[sp_PressGaney_OU0101_Rehab]
		@StartDate =@StartDate,
		@EndDate = @EndDate


GO


Select * from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
Select * from  [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF


--Delete from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
--Delete from [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF
