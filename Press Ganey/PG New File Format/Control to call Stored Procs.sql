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
Select * from  [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF where notes is not null and SurveySentDate is not null

Select * from dbo.PressGaneyDailyFile_Archive where [Survey Designator] = 'SP0101' and SentStatus = 'Sent'  ---10219

Select * from PressGaneyFinalSurveyFile where [Medical Record Number] = 'E3760498'  and [Visit or Admit Date] = '03092025' 



Select * from  [ETLProcedureRepository].[dbo].[PressGaney_TrackingRecords] where PatientEnterpriseID = 'E3760498'  and ServiceDate = '09/04/2024'




--and [Client ID] = ''
--and [Visit or Admit Date] > '01312025'

Select * from [dbo].[PressGaneySurveyDataLoadLog] order by start_execution_time desc

SELECT CAST(GETDATE()- 31 AS DATETIME) AS CurrentDateTime;
Select * from PressGaneyFinalSurveyFile


Select *  From  ETLProcedureRepository.[dbo].[ErrorLog]

Select * from dbo.PressGaneySurveyTypePriority


Select * from dbo.PressGaneySurveyDataLoadProcedures

--2/26/2025	3/28/2025

-- Reset tables to start
Delete from [ETLProcedureRepository].[dbo].[PressGaneySurveyDataLoadLog] 
Delete from [ETLProcedureRepository].[dbo].PressGaneyDailyFile_Archive
Delete from [ETLProcedureRepository].[dbo].[PressGaneyDailyFile]
Delete from [ETLProcedureRepository].[dbo].PressGaney_TrackingRecords_NFF
Delete from [ETLProcedureRepository].[dbo].PressGaneyFinalSurveyFile

-- Set all to active
  --UPDATE [ETLProcedureRepository].[dbo].[PressGaneySurveyDataLoadProcedures]
  --Set is_active = 1



EXEC sp_PressGaneyExecuteSurveyDataLoaders 'mb-6','me-6'



--Change Department number 11004103 to Client id 1946
--Change Department number 11002419 to Client id 16107

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


Select * from  dbo.PressGaneyDailyFile_Archive where [Survey Designator] = 'NICU0101'

Select * from  dbo.PressGaney_TrackingRecords_NFF where file_type  = 'NICU0101'



SELECT CAST(FORMAT(getdate()-74 , 'MM/dd/yyyy') as varchar(10)) AS StartDate, CAST(FORMAT(getdate() - 3, 'MM/dd/yyyy') as varchar(10)) as EndDate

