-- =============================================================================
-- PRESS GANEY SURVEY ENGINE DATABASE SETUP SCRIPT
-- =============================================================================
-- 
-- DESCRIPTION:
-- This script creates the complete database infrastructure for the Press Ganey 
-- survey management system. It establishes all necessary tables, reference data,
-- and configuration needed to collect, process, and send patient survey data
-- to Press Ganey for analysis and reporting.
--
-- PURPOSE:
-- - Automate patient survey data collection from Epic EMR
-- - Map departments to appropriate Press Ganey client survey types
-- - Transform and validate patient data according to Press Ganey specifications
-- - Track survey processing status and maintain audit trails
-- - Support multiple survey types (inpatient, outpatient, pharmacy, etc.)
--
-- MAIN COMPONENTS:
-- 1. REFERENCE DATA TABLES
--    - Language code mappings for multilingual surveys
--    - Department to Press Ganey client ID mappings for survey routing
--
-- 2. DATA PROCESSING TABLES  
--    - Daily file staging for incoming patient data
--    - Final survey file for Press Ganey export
--
-- 3. ARCHIVE AND TRACKING TABLES
--    - Historical archive of sent surveys
--    - Tracking records for preventing duplicate surveys
--
-- 4. ADMINISTRATIVE TABLES
--    - Procedure configuration and execution logging
--    - System monitoring and error tracking
--
-- DATA FLOW:
-- Epic EMR → Daily File Table → Processing/Validation → Final Survey File → 
-- Press Ganey Export → Archive Table → Tracking Records
--
-- CREATED BY: JohnnyCroyle
-- CREATED DATE: 2025-08-22
-- VERSION: 1.0
-- SERVER: COGITORPTUAT
-- DATABASE: ETLProcedureRepository 
--
-- NOTES:
-- - Requires appropriate permissions on ETLProcedureRepository database
-- - Contains sample data mappings that should be verified for your environment
-- - Supports Press Ganey's new file format specifications
-- - Includes multilingual support for diverse patient populations
-- =============================================================================

-- Press Ganey Survey Engine Database Setup Script
-- =============================================================================
-- This script creates the complete database structure for the Press Ganey 
-- survey engine, including tables for language codes, survey data tracking,
-- file processing, and logging functionality.
-- =============================================================================
USE [ETLProcedureRepository]
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PG_Survey_Language_Codes]') AND type in (N'U'))
DROP TABLE [dbo].[PG_Survey_Language_Codes]
GO

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

-- Insert language code mappings
SET IDENTITY_INSERT [dbo].[PG_Survey_Language_Codes] ON 
GO

INSERT [dbo].[PG_Survey_Language_Codes] ([ID], [Language], [PG_Code], [Created_Date], [Created_By], [Updated_Date], [Updated_By]) VALUES 
(1, N'Albanian', N'57', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(2, N'Arabic', N'22', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(3, N'Armenian', N'31', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(4, N'Bengali', N'60', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(5, N'Bosnian', N'50', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(6, N'Bosnian-Croatian', N'49', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(7, N'Bosnian-Muslim', N'48', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(8, N'Bosnian-Serbian', N'32', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(9, N'Cambodian', N'34', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(10, N'Chao-Chou', N'41', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(11, N'Chinese-Simplified', N'12', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(12, N'Chinese-Traditional', N'10', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(13, N'Chuukese', N'23', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(14, N'Creole', N'21', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(15, N'Croatian', N'52', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(16, N'English', N'0', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(17, N'English/Spanish', N'33', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(18, N'Farsi', N'59', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(19, N'French-Canadian', N'35', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(20, N'French', N'20', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(21, N'German', N'4', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(22, N'Greek', N'7', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(23, N'Haitian-Creole', N'36', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(24, N'Hakha Chin', N'66', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(25, N'Hebrew', N'37', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(26, N'Hindi', N'38', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(27, N'Hmong', N'26', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(28, N'Ilocano', N'56', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(29, N'Indonesian', N'42', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(30, N'Italian', N'5', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(31, N'Japanese', N'28', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(32, N'Korean', N'29', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(33, N'Laotian', N'43', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(34, N'Malayalam', N'58', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(35, N'Malayan', N'44', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(36, N'Marshallese', N'24', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(37, N'Polish', N'6', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(38, N'PORTUGUESE - BRAZILIAN', N'8', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(39, N'Portuguese - European', N'47', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(40, N'Punjabi', N'54', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(41, N'Romanian', N'55', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(42, N'Russian', N'3', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(43, N'Samoan', N'25', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(44, N'Serbian', N'51', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(45, N'Somali', N'27', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(46, N'Spanish', N'1', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(47, N'Swahili', N'45', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(48, N'Tagalog', N'30', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(49, N'Tamil', N'64', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(50, N'Telugu', N'65', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(51, N'Thai', N'46', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(52, N'Turkish', N'53', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(53, N'Urdu', N'39', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(54, N'Vietnamese', N'13', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(55, N'Yiddish', N'40', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T16:45:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(56, N'chinese', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(57, N'Chinese - Cantonese inc Toishanese', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(58, N'Chinese - Mandarin', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE'),
(59, N'Chinese - Other', N'10', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE', CAST(N'2025-08-22T17:08:00.000' AS DateTime), N'MEHEALTH\JCROYLE')
GO

SET IDENTITY_INSERT [dbo].[PG_Survey_Language_Codes] OFF
GO

-- -----------------------------------------------------------------------------
-- Press Ganey Survey Mapping Table
-- Maps Press Ganey Client IDs to Epic Department IDs for survey routing
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyMap]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyMap]
GO

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
-- -----------------------------------------------------------------------------
-- Insert mappings for Press Ganey Client IDs to Epic Department IDs
-- -----------------------------------------------------------------------------
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001141', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001142', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001143', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001149', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001810', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001151', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001005', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001006', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001007', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001008', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001247', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001245', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11002931', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11002932', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11002934', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11002935', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11002936', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'20132103', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'20132104', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'20135000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'20135050', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'40200101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'110016019', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001731', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001702', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001252', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'1100101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001057', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001548', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004103', N'Updated 10/17/25')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001806', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002419', N'Updated 10/17/25')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001054', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004010', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'110022050', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'110022071', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'110025101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'110041151', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004081', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004024', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004043', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004065', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004070', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004062', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004071', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004080', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004052', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1946', N'11004101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014022', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014003', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014008', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014009', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014011', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014012', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014013', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014016', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014019', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014044', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014045', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014049', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014050', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014051', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014052', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'1985', N'11014063', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006217', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11002904', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006211', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006213', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006228', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006229', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006230', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006236', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006243', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006247', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006248', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006249', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006252', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006266', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006323', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006333', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006337', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006234', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006240', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006245', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'13350', N'11006340', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'1101232', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012001', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012002', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012003', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012004', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012005', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012006', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012007', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012008', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012009', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012010', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012011', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012012', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012017', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012018', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012019', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012140', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012142', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'1101236', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'1101235', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'1101261', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'1101237', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002321', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002322', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002130', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002092', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002151', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002088', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002150', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002148', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002270', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002093', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002047', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002051', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002231', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002149', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002236', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002250', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002262', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002245', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002246', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002267', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002268', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002211', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002094', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002427', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002193', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002201', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002174', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002206', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002047', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002051', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002231', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002149', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002236', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002250', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002262', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002245', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002246', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002267', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002268', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002211', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002094', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'21344', N'11002427', N'Believe these client ids should be 16107')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005012', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11002942', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005018', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005019', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005020', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005021', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005022', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005023', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005024', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005025', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005026', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005052', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005083', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005088', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005031', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005030', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018027', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018073', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018074', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018075', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018076', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018077', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018078', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018079', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018080', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018082', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018083', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018084', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018085', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018086', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018087', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018090', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018092', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018094', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018103', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018104', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018114', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018115', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018116', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018119', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018118', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018120', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018113', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018045', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018127', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018044', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018063', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018032', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24198', N'11018029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003013', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11002940', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003017', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003023', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003024', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003025', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003026', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003028', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003057', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003058', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003089', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003090', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003091', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003104', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003064', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003019', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24240', N'11003021', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002193', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002201', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002174', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16107', N'11002206', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'1101258', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'1101286', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11006224', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11006256', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11018039', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11018043', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11018041', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11018040', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11018042', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11001046', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11014029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022001', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022002', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022003', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022014', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022006', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022008', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022012', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022004', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022005', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022007', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022011', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11004016', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002234', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002233', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002235', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002134', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002309', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002057', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11002135', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11003015', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11005016', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022009', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49526', N'11022010', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016032', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016033', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016034', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016002', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016005', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016004', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016003', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016006', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016007', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'11016025', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101704', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101733', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101718', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101720', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101721', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101742', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101722', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101723', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101724', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101725', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101726', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101727', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101728', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49527', N'1101729', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101709', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101710', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101711', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101712', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101713', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101714', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101715', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101716', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101717', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101743', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101744', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101746', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101747', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101478', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101749', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101750', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101703', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101741', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101736', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101752', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101753', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101708', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101751', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101745', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101740', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'1101754', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'11016031', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49528', N'11012113', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000001', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000002', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000005', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000006', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000007', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000010', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000011', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000012', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000013', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000014', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000016', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000018', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000019', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000020', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000023', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000024', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000025', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000026', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000027', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000029', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000115', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000116', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000119', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000125', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11000127', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110001904', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001261', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001262', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001265', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001546', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001547', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001549', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001604', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001614', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001617', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001618', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001619', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001621', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001622', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001623', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001627', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001628', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001630', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001631', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001636', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11012013', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11012016', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11012115', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11012116', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11012117', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11012135', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101242', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101243', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101244', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101245', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101246', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101247', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101248', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101249', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101265', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101266', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014021', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014033', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014036', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014037', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014039', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014040', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014041', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014060', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014061', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014062', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11014086', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101468', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101706', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101719', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101730', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101731', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101734', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101735', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1101739', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018001', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018002', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018028', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018047', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018048', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018049', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018050', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018051', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018052', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018053', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018054', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018055', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018056', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018057', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018058', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018059', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018060', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018061', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018062', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018064', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018065', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018066', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018070', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018072', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018088', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018093', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018095', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018096', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018097', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018099', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018112', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018123', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018124', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018125', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018131', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018132', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018140', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018141', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11018144', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'1182364', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'12000000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'13000000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'14000000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'15000000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'15100000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'15200000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'15300000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'17200000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'17300000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100102', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100103', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100104', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100105', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100106', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20100201', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20110100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20130000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20131000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20132100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20132101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'2013500', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20136000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'2013900', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20149000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20159000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'203000100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500102', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500500', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500503', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20500504', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20600101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20600102', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20600103', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20600200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700102', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700103', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700104', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700105', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700106', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700107', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700108', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700117', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700120', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700121', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700123', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700124', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700125', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700126', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700151', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20700202', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20800100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20900100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'20900110', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'30100100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'30400100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'30600100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'30900100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40100500', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40200100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40300100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40300101', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40300104', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'4030015', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'4030016', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40300200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40300201', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'40300202', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'4030026', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'50400100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'50400200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'50400202', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001017', N'added 10/17/25')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'9', N'11001052', N'added 10/17/25')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'16106', N'11012143', N'added 10/20/25')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'24197', N'11005089', N'added 10/20/25')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001637', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001701', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001704', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001709', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001710', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001711', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001712', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001713', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001730', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001735', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001736', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001760', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001790', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001793', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001798', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001799', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001801', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001804', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001881', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001882', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001883', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001884', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001886', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001888', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001890', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001891', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001893', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001896', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001897', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001898', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001899', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001900', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001901', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001902', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11001924', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002153', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002154', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002155', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002158', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002159', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002160', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002161', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002162', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002164', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002165', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002166', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002172', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002173', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002182', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002183', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002184', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002185', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002188', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002191', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002194', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002198', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110022000', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002202', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002203', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110022060', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110022100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002253', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002295', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002306', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002307', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002310', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110023100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002311', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002315', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002316', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002400', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002401', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002406', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110024100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002414', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002415', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002416', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002417', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002418', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110025100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110025200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110026100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110027100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110028100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002903', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002905', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002906', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110029100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002913', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002914', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002918', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002919', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002920', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110029200', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002921', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002922', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002923', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002928', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002929', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002930', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110029300', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002981', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002984', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002985', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002987', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002988', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002989', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002991', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002993', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11002995', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110030100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003030', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003031', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003032', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003033', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003034', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003036', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003037', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003038', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003039', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003040', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003043', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003044', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003045', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003047', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003048', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003053', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003066', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003070', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003081', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003087', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003088', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003092', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003099', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003106', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110031100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003112', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110031300', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110031600', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110032100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11003225', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004076', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004077', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004078', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004083', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004090', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004096', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004098', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004102', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'110041100', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004203', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004204', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004205', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004206', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11004207', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005062', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005067', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005073', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005074', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005075', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005076', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005077', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005078', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005079', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005080', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005081', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005082', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005085', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11005087', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006204', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006270', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006280', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006287', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006293', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006300', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006322', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006330', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006332', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006334', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006335', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006338', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006339', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006341', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006346', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006348', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [DepartmentEpicId], [Description]) VALUES (N'49529', N'11006350', N'')
GO


-- =============================================================================
-- 2. DATA PROCESSING TABLES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Press Ganey Daily File Table (Main Processing)
-- Stores the daily survey data that gets processed and sent to Press Ganey
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneyDailyFile]') AND type in (N'U'))
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
    [Pharmacy Type] [nvarchar](255) NULL,
    [ICU] [nvarchar](255) NULL,
    [Virtual Nursing] [nvarchar](255) NULL,
    [EOR] [nvarchar](255) NULL,
    [EventCreatedDate] DATETIME NULL, 
    [CreatedBy] [nvarchar](255) NULL,
    [CreatedDate] DATETIME NULL DEFAULT (GETDATE())
) ON [PRIMARY]
GO

-- -----------------------------------------------------------------------------
-- Press Ganey Final Survey File Table
-- Stores the final processed survey data ready for export to Press Ganey
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneyFinalSurveyFile]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneyFinalSurveyFile]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneyFinalSurveyFile](
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
    [Pharmacy Type] [nvarchar](255) NULL,
    [ICU] [nvarchar](255) NULL,
    [Virtual Nursing] [nvarchar](255) NULL,
    [EOR] [nvarchar](255) NULL,
    [CreatedBy] [nvarchar](255) NULL,
    [CreatedDate] DATETIME NULL DEFAULT (GETDATE())
) ON [PRIMARY]
GO

-- =============================================================================
-- 3. ARCHIVE AND TRACKING TABLES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Press Ganey Daily File Archive Table
-- Archives processed survey data with sent status tracking
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneyDailyFile_Archive]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneyDailyFile_Archive]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneyDailyFile_Archive](
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
    [Pharmacy Type] [nvarchar](255) NULL,
    [ICU] [nvarchar](255) NULL,
    [Virtual Nursing] [nvarchar](255) NULL,
    [EOR] [nvarchar](255) NULL,
    [SentStatus] [nvarchar](10) NULL,
    [CreatedDate] DATETIME NULL DEFAULT (GETDATE())
) ON [PRIMARY]
GO

-- -----------------------------------------------------------------------------
-- Press Ganey Tracking Records Table
-- Tracks survey processing status and provides audit trail
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaney_TrackingRecords_NFF]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaney_TrackingRecords_NFF]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaney_TrackingRecords_NFF] (
    [unique_ID] [int] NULL,
    [PatientEnterpriseID] VARCHAR(50),
    [ServiceDate] varchar(10),
    [SurveySentDate] DATE,
    [file_type] [varchar](50) NULL,
    [Priority] INT,
    [created_date] DATETIME DEFAULT GETDATE(),
    [notes] VARCHAR(255)
) ON [PRIMARY]
GO

-- =============================================================================
-- 4. ADMINISTRATIVE AND LOGGING TABLES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Press Ganey Survey Data Load Procedures Table
-- Manages which procedures are active in the survey data load process
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyDataLoadProcedures]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyDataLoadProcedures]
GO

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

ALTER TABLE [dbo].[PressGaneySurveyDataLoadProcedures] ADD DEFAULT ((1)) FOR [is_active]


GO
-- Insert initial procedure entry for Pharmacy survey data load
INSERT INTO dbo.PressGaneySurveyDataLoadProcedures (proc_name, is_active, description)
VALUES ('sp_PressGaney_SP0101_Pharmacy', 1, 'This will load SP0101 Pharmacy survey patient records');
GO
-- -----------------------------------------------------------------------------
-- Press Ganey Survey Data Load Log Table
-- Logs execution of survey data load procedures for monitoring and troubleshooting
-- -----------------------------------------------------------------------------
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneySurveyDataLoadLog]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneySurveyDataLoadLog]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneySurveyDataLoadLog](
    [log_id] [int] IDENTITY(1,1) NOT NULL,
    [proc_name] [nvarchar](255) NULL,
    [start_date] [nvarchar](10) NULL,
    [end_date] [nvarchar](10) NULL,
    [start_execution_time] [datetime] NULL,
    [end_execution_time] [datetime] NULL,
    [status] [nvarchar](50) NULL,
    [error_message] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
    [log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[PressGaneySurveyDataLoadLog] ADD DEFAULT (getdate()) FOR [end_execution_time]
GO



/****** Object:  Table [dbo].[PressGaneyControlTable]    Script Date: 10/22/2025 3:38:19 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PressGaneyControlTable]') AND type in (N'U'))
DROP TABLE [dbo].[PressGaneyControlTable]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PressGaneyControlTable](
	[PackageName] [nvarchar](50) NOT NULL,
	[FilePath] [nvarchar](255) NULL,
	[ErrorPath] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO

INSERT [dbo].[PressGaneyControlTable] ([PackageName], [FilePath], [ErrorPath], [Description]) VALUES (N'PressGaneyEngineProcess', N'\\eftfs\eftcentral\DataEngineeringTeam\PressGaney\New File Format', N'\\eftfs\eftcentral\DataEngineeringTeam\ErrorFiles', N'Control table for Press ganey Survey Engine')
GO



-- =============================================================================
-- Script Complete
-- =============================================================================
PRINT 'Press Ganey Survey System database setup completed successfully.'
