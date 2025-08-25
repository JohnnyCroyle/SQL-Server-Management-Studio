



USE [ETLProcedureRepository]
GO

/****** Object:  Table [dbo].[PG_Survey_Language_Codes]    Script Date: 8/22/2025 4:23:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PG_Survey_Language_Codes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Language] [nvarchar](100) NULL,
	[PG_Code] [nvarchar](100) NULL,
	[Created_Date] [datetime] NULL,
	[Created_By] [nvarchar](50) NULL,
	[Updated_Date] [datetime] NULL,
	[Updated_By] [nvarchar](50) NULL
) ON [PRIMARY]
GO


