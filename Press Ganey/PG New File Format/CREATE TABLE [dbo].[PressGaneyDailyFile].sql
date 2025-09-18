USE [ETLProcedureRepository]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneyDailyFile]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneyDailyFile]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneyDailyFile](
	[Survey Designator] [nvarchar](255) NULL,
	[Client ID] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[Middle Initial] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Address 1] [nvarchar](255) NULL,
	[Address 2] [nvarchar](255) NULL,
	[Address 3] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[ZIP Code] [nvarchar](255) NULL,
	[Telephone Number] [nvarchar](255) NULL,
	[Mobile Number] [nvarchar](255) NULL,
	[MS-DRG] [nvarchar](255) NULL,
	[Gender] [nvarchar](255) NULL,
	[Race] [nvarchar](255) NULL,
	[Ethnicity] [nvarchar](255) NULL,
	[Date of Birth] [nvarchar](255) NULL,
	[Language] [nvarchar](255) NULL,
	[Medical Record Number] [nvarchar](255) NULL,
	[Unique ID] [nvarchar](255) NULL,
	[Location Code] [nvarchar](255) NULL,
	[Location Name] [nvarchar](255) NULL,
	[Department Code] [nvarchar](255) NULL,
	[Department Name] [nvarchar](255) NULL,
	[Attending Physician NPI] [nvarchar](255) NULL,
	[Attending Physician Name] [nvarchar](255) NULL,
	[Provider Type] [nvarchar](255) NULL,
	[Provider specialty] [nvarchar](255) NULL,
	[Site address 1] [nvarchar](255) NULL,
	[Site address 2] [nvarchar](255) NULL,
	[Site city] [nvarchar](255) NULL,
	[Site state] [nvarchar](255) NULL,
	[Site zip] [nvarchar](255) NULL,
	[Patient Admission Source] [nvarchar](255) NULL,
	[Visit or Admit Date] [nvarchar](255) NULL,
	[Visit or Admit Time] [nvarchar](255) NULL,
	[Discharge Date] [nvarchar](255) NULL,
	[Patient Discharge Status] [nvarchar](255) NULL,
	[Unit] [nvarchar](255) NULL,
	[Service] [nvarchar](255) NULL,
	[Specialty] [nvarchar](255) NULL,
	[Payor / Insurance / Financial Class] [nvarchar](255) NULL,
	[Length of Stay] [nvarchar](255) NULL,
	[Room] [nvarchar](255) NULL,
	[Bed] [nvarchar](255) NULL,
	[Hospitalist] [nvarchar](255) NULL,
	[Fast Track or Acute Flag] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Hospitalist_1] [nvarchar](255) NULL,
	[Hospitalist_2] [nvarchar](255) NULL,
	[ER_ADMIT] [nvarchar](255) NULL,
	[Other Diagnosis or Procedure Code] [nvarchar](255) NULL,
	[Procedure Code 1] [nvarchar](255) NULL,
	[Procedure Code 2] [nvarchar](255) NULL,
	[Procedure Code 3] [nvarchar](255) NULL,
	[Procedure Code 4] [nvarchar](255) NULL,
	[Procedure Code 5] [nvarchar](255) NULL,
	[Procedure Code 6] [nvarchar](255) NULL,
	[Deceased Flag] [nvarchar](255) NULL,
	[No Publicity Flag] [nvarchar](255) NULL,
	[State Regulation Flag] [nvarchar](255) NULL,
	[Newborn patient] [nvarchar](255) NULL,
	[Transferred/admitted to inpatient] [nvarchar](255) NULL,
	[EOR] [nvarchar](255) NULL,
	[CreatedBy] [nvarchar](255) NULL,
	[CreatedDate] DATETIME NULL DEFAULT (GETDATE())
) ON [PRIMARY]
GO
