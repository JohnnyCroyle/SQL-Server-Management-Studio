USE [ETLProcedureRepository]
GO

/****** Object:  Table [dbo].[PG_Survey_Language_Codes]    Script Date: 8/22/2025 5:58:09 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PG_Survey_Language_Codes]') AND type in (N'U'))
DROP TABLE [dbo].[PG_Survey_Language_Codes]
GO

/****** Object:  Table [dbo].[PG_Survey_Language_Codes]    Script Date: 8/22/2025 5:58:09 PM ******/
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

SET IDENTITY_INSERT [dbo].[PG_Survey_Language_Codes] ON 
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (1, N'Albanian', N'57', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (2, N'Arabic', N'22', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (3, N'Armenian', N'31', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (4, N'Bengali', N'60', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (5, N'Bosnian', N'50', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (6, N'Bosnian-Croatian', N'49', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (7, N'Bosnian-Muslim', N'48', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (8, N'Bosnian-Serbian', N'32', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (9, N'Cambodian', N'34', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (10, N'Chao-Chou', N'41', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (11, N'Chinese-Simplified', N'12', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (12, N'Chinese-Traditional', N'10', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (13, N'Chuukese', N'23', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (14, N'Creole', N'21', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (15, N'Croatian', N'52', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (16, N'English', N'0', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (17, N'English/Spanish', N'33', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (18, N'Farsi', N'59', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (19, N'French-Canadian', N'35', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (20, N'French', N'20', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (21, N'German', N'4', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (22, N'Greek', N'7', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (23, N'Haitian-Creole', N'36', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (24, N'Hakha Chin', N'66', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (25, N'Hebrew', N'37', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (26, N'Hindi', N'38', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (27, N'Hmong', N'26', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (28, N'Ilocano', N'56', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (29, N'Indonesian', N'42', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (30, N'Italian', N'5', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (31, N'Japanese', N'28', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (32, N'Korean', N'29', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (33, N'Laotian', N'43', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (34, N'Malayalam', N'58', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (35, N'Malayan', N'44', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (36, N'Marshallese', N'24', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (37, N'Polish', N'6', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (38, N'PORTUGUESE - BRAZILIAN', N'8', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (39, N'Portuguese - European', N'47', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (40, N'Punjabi', N'54', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (41, N'Romanian', N'55', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (42, N'Russian', N'3', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (43, N'Samoan', N'25', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (44, N'Serbian', N'51', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (45, N'Somali', N'27', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (46, N'Spanish', N'1', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (47, N'Swahili', N'45', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (48, N'Tagalog', N'30', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (49, N'Tamil', N'64', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (50, N'Telugu', N'65', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (51, N'Thai', N'46', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (52, N'Turkish', N'53', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (53, N'Urdu', N'39', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (54, N'Vietnamese', N'13', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (55, N'Yiddish', N'40', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (56, N'chinese', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (57, N'Chinese - Cantonese inc Toishanese', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (58, N'Chinese - Mandarin', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES (59, N'Chinese - Other', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO
SET IDENTITY_INSERT [dbo].[PG_Survey_Language_Codes] OFF
GO
