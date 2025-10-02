USE [ETLProcedureRepository]
GO

/****** Object:  Table [dbo].[PressGaneySurveyTypePriority]    Script Date: 9/26/2025 11:18:34 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyTypePriority]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyTypePriority]
GO

/****** Object:  Table [dbo].[PressGaneySurveyTypePriority]    Script Date: 9/26/2025 11:18:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneySurveyTypePriority](
	[survey_type] [nvarchar](50) NOT NULL,
	[priority_rank] [int] NOT NULL,
) ON [PRIMARY]
GO

-- Insert priority values into SurveyTypePriority table
INSERT INTO dbo.PressGaneySurveyTypePriority (survey_type, priority_rank)
VALUES 
    ('SP0101', 1),
    ('OU0101', 2);

GO


