
USE [ETLProcedureRepository]
GO

--INSERT INTO dbo.PressGaneySurveyDataLoadProcedures (proc_name, is_active, description)
--VALUES ('sp_PressGaney_SP0101_Pharmacy', 1, 'This will load SP0101 Pharmacy survey patient records');
--GO
INSERT INTO dbo.PressGaneySurveyDataLoadProcedures (proc_name, is_active, description)
VALUES ('sp_PressGaney_OU0101_Rehab', 1, 'This will load OU0101 Rehab survey patient records');






--Select * from dbo.PressGaneySurveyDataLoadProcedures