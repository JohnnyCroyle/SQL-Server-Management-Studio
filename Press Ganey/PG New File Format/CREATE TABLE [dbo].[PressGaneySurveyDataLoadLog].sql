USE [ETLProcedureRepository]
GO

ALTER TABLE [dbo].[PressGaneySurveyDataLoadLog] DROP CONSTRAINT [DF__PressGane__execu__6A46A039]
GO

/****** Object:  Table [dbo].[PressGaneySurveyDataLoadLog]    Script Date: 9/26/2025 9:23:38 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyDataLoadLog]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyDataLoadLog]
GO

/****** Object:  Table [dbo].[PressGaneySurveyDataLoadLog]    Script Date: 9/26/2025 9:23:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneySurveyDataLoadLog](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[proc_name] [nvarchar](255) NULL,
	[execution_time] [datetime] NULL,
	[status] [nvarchar](50) NULL,
	[error_message] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[PressGaneySurveyDataLoadLog] ADD  DEFAULT (getdate()) FOR [execution_time]
GO


