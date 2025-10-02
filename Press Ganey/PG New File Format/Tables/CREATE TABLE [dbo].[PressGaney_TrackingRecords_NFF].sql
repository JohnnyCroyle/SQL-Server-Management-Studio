USE [ETLProcedureRepository]
GO

/****** Object:  Table [dbo].[PressGaney_TrackingRecords_NFF]    Script Date: 9/18/2025 2:54:20 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaney_TrackingRecords_NFF]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaney_TrackingRecords_NFF]
GO

/****** Object:  Table [dbo].[PressGaney_TrackingRecords_NFF]    Script Date: 9/18/2025 2:54:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--CREATE TABLE [dbo].[PressGaney_TrackingRecords_NFF](
--	[file_type] [varchar](20) NULL,
--	[unique_ID] [int] NULL,
--	[created_date] [datetime] NULL
--) ON [PRIMARY]
--GO


CREATE TABLE dbo.PressGaney_TrackingRecords_NFF (
	[unique_ID] [int] NULL,
    [PatientEnterpriseID] VARCHAR(50),
    [ServiceDate] varchar(10),
    [SurveySentDate] DATE,
	[file_type] [varchar](20) NULL,
    [Priority] INT,
    [created_date] DATETIME DEFAULT GETDATE()
) ON [PRIMARY]

--ALTER TABLE [dbo].[PressGaney_TrackingRecords_NFF] ADD  CONSTRAINT [DF_PressGaney_TrackingRecords_NFF_created_date]  DEFAULT (getdate()) FOR [created_date]
--GO


