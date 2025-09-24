USE [AetnaClaims]
GO

/****** Object:  Table [staging].[CodesLookup]    Script Date: 8/15/2025 2:47:07 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[CodesLookup]') AND type in (N'U'))
DROP TABLE [staging].[CodesLookup]
GO

/****** Object:  Table [staging].[CodesLookup]    Script Date: 8/15/2025 2:47:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[CodesLookup](
	[code] [nvarchar](max) NULL,
	[code_value] [nvarchar](max) NULL,
	[code_desc] [nvarchar](max) NULL,
	[lkup_code] [nvarchar](max) NULL,
	[lkup_value] [nvarchar](max) NULL,
	[lkup_desc] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


