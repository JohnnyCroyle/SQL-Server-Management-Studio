USE [ETLProcedureRepository]
GO

ALTER TABLE [dbo].[PressGaneySurveyDataLoadProcedures] DROP CONSTRAINT [DF__PressGane__is_ac__648DC6E3]
GO

/****** Object:  Table [dbo].[PressGaneySurveyDataLoadProcedures]    Script Date: 9/26/2025 9:20:58 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyDataLoadProcedures]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyDataLoadProcedures]
GO

/****** Object:  Table [dbo].[PressGaneySurveyDataLoadProcedures]    Script Date: 9/26/2025 9:20:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneySurveyDataLoadProcedures](
	[proc_name] [nvarchar](255) NOT NULL,
	[is_active] [bit] NULL,
	[description] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[proc_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PressGaneySurveyDataLoadProcedures] ADD  DEFAULT ((1)) FOR [is_active]
GO


