/*
Missing Index Details from PG All Services DEV File.sql - COGITORPTDEV.master (MEHEALTH\1jcroyle (59))
The Query Processor estimates that implementing the following index could improve the query cost by 95.261%.
*/


USE [CDW_Report]
GO
CREATE NONCLUSTERED INDEX [idx_DiagnosisTerminologyDim_DiagnosisKey_Type]
ON [dbo].[DiagnosisTerminologyDim] ([DiagnosisKey],[Type])
INCLUDE ([Value])
GO

