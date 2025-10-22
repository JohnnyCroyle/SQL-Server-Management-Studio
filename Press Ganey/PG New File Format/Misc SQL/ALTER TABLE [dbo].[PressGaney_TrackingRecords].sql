USE [ETLProcedureRepository]
GO

/****** Object:  Table [dbo].[PressGaney_TrackingRecords]    Script Date: 8/22/2025 4:23:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 09/30/2025
------ Description:	Add columns to PressGaney_TrackingRecords

[PatientEnterpriseID] VARCHAR(50),
[ServiceDate] varchar(10);
------ Notes:		Used to store the PatientEnterpriseID and ServiceDate for Press Ganey records.
------ =============================================*/


ALTER TABLE dbo.PressGaney_TrackingRecords
ADD [PatientEnterpriseID] VARCHAR(50),
	[ServiceDate] varchar(10);


