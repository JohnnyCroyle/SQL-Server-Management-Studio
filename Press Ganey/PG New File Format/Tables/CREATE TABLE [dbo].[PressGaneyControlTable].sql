USE [EDW_Work]
GO

/****** Object:  Table [dbo].[DV_tableList]    Script Date: 10/22/2025 4:53:54 PM ******/
SET ANSI_NULLS ON
GO

/****** Object:  Table [dbo].[PressGaneyControlTable]    Script Date: 10/22/2025 3:38:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneyControlTable]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneyControlTable]
GO

/****** Object:  Table [dbo].[PressGaneyControlTable]    Script Date: 10/22/2025 3:38:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneyControlTable](
	[PackageName] [nvarchar](50) NOT NULL,
	[FilePath] [nvarchar](255) NULL,
	[ErrorPath] [nvarchar](255) NULL,
	[ServerName] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO
GO
INSERT [dbo].[PressGaneyControlTable] ([PackageName], [FilePath],[ErrorPath],[ServerName],[Description]) VALUES (N'PressGaneyEngineProcess', N'\\eftfs\eftcentral\DataEngineeringTeam\PressGaney\New File Format', N'\\eftfs\eftcentral\DataEngineeringTeam\ErrorFiles',N'COGITORPTUAT', N'Control table for Press ganey Survey Engine')
GO

--COGITORPTUAT