USE [JCROYLE]
GO

/****** Object:  Table [Aetna].[CodesLookup]    Script Date: 8/15/2025 2:47:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Aetna].[CodesLookup]') AND type in (N'U'))
DROP TABLE [Aetna].[CodesLookup]
GO

/****** Object:  Table [Aetna].[CodesLookup]    Script Date: 8/15/2025 2:47:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Aetna].[CodesLookup](
	[code] [nvarchar](50) NULL,
	[code_value] [nvarchar](255) NULL,
	[code_desc] [nvarchar](max) NULL,
	[lkup_code] [nvarchar](max) NULL,
	[lkup_value] [nvarchar](max) NULL,
	[lkup_desc] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


