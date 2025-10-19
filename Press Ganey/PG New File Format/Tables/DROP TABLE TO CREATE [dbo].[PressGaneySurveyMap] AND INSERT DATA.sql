USE [ETLProcedureRepository]

/****** Object:  Table [dbo].[PressGaneySurveyMap]    Script Date: 8/13/2025 5:42:45 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyMap]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyMap]
GO

/****** Object:  Table [dbo].[PressGaneySurveyMap]    Script Date: 8/13/2025 5:42:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneySurveyMap](
	[PressGaneyClientID] [nvarchar](50) NULL,
	[DepartmentEpicId] [nvarchar](50) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO


