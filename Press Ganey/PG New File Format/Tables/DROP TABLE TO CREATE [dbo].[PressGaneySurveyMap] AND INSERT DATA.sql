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
	[SurveyDesignator] [nvarchar](50) NULL,
	[Service] [nvarchar](50) NULL,
	[DepartmentEpicId] [nvarchar](50) NULL,
	[AgeQualifier] [nchar](10) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO




GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OR0101', N'Outpatient Rehab', N'11001141', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OR0101', N'Outpatient Rehab', N'11001142', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OR0101', N'Outpatient Rehab', N'11001143', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OR0101', N'Outpatient Rehab', N'11001149', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OR0101', N'Outpatient Rehab', N'11001810', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OR0101', N'Outpatient Rehab', N'11001151', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'ER0101', N'Emergency Dept - Adult', N'11001029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PE0101', N'Emergency Dept - Peds', N'11001029', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PD0101', N'Inpatient Peds - Child HCAHPS', N'11001005', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PD0101', N'Inpatient Peds - Child HCAHPS', N'11001006', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PD0101', N'Inpatient Peds - Child HCAHPS', N'11001007', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PD0101', N'Inpatient Peds - Child HCAHPS', N'11001008', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PD0101', N'Inpatient Peds - Child HCAHPS', N'11001247', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PD0101', N'Inpatient Peds - Child HCAHPS', N'11001245', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'11002931', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'11002932', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'11002934', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'11002935', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'11002936', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'20132103', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'20132104', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'20135000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'20135050', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'40200101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0101', N'Outpatient Imaging - Testing', N'110016019', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'ON0101', N'Outpatient Oncology', N'11001731', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'ON0101', N'Outpatient Oncology', N'11001702', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'ON0101', N'Outpatient Oncology', N'11001252', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'UC0101', N'Urgent Care - Adult', N'1100101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'UC0102', N'Urgent Care - Peds', N'1100101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'PY0101', N'Inpatient Behavioral Health', N'11001057', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'SP0101', N'Pharmacy (Retail)', N'11001548', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'SP0101', N'Pharmacy (Retail)', N'11004103', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'SP0101', N'Pharmacy (Retail)', N'11001806', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'SP0101', N'Pharmacy (Retail)', N'11002419', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (9, N'OU0102', N'MMCP FBC Lactation Clinic', N'11001054', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'ER0101', N'Emergency Dept - Adult', N'11004010', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'PE0101', N'Emergency Dept - Peds', N'11004010', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OU0101', N'Outpatient Imaging - Testing', N'110022050', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OU0101', N'Outpatient Imaging - Testing', N'110022071', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OU0101', N'Outpatient Imaging - Testing', N'110025101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OU0101', N'Outpatient Imaging - Testing', N'110041151', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004081', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004024', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004043', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004065', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004070', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004062', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004071', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'OR0101', N'Outpatient Rehab', N'11004080', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'PY0101', N'Inpatient Behavioral Health', N'11004052', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'UC0101', N'Urgent Care', N'11004101', N'>=18      ', N'New - 4/24/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'UC0102', N'Urgent Care', N'11004101', N'<18       ', N'New - 4/24/2026')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'ER0101', N'Emergency Dept - Adult', N'11014022', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'PE0101', N'Emergency Dept - Peds', N'11014022', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014003', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014008', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014009', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014011', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014012', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014013', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014016', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014019', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014044', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014045', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014049', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014050', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014051', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014052', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1985, N'OU0101', N'Outpatient Imaging - Testing', N'11014063', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'ER0101', N'Emergency Dept - Adult', N'11006217', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'PE0101', N'Emergency Dept - Peds', N'11006217', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11002904', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006211', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006213', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006228', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006229', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006230', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006236', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006243', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006247', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006248', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006249', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006252', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006266', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006323', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006333', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OU0101', N'Outpatient Imaging - Testing', N'11006337', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OR0101', N'Outpatient Rehab', N'11006234', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OR0101', N'Outpatient Rehab', N'11006240', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'OR0101', N'Outpatient Rehab', N'11006245', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'UC0101', N'WIC / Urgent Care - Adult', N'11006340', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (13350, N'UC0102', N'WIC / Urgent Care - Peds', N'11006340', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'ER0101', N'Emergency Dept - Adult', N'1101232', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'PE0101', N'Emergency Dept - Peds', N'1101232', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012001', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012002', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012003', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012004', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012005', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012006', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012007', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012008', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012009', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012010', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012011', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012012', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012017', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012018', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012019', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012140', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OU0101', N'Outpatient Imaging - Testing', N'11012142', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OR0101', N'Outpatient Rehab', N'1101236', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OR0101', N'Outpatient Rehab', N'1101235', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OR0101', N'Outpatient Rehab', N'1101261', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16106, N'OR0101', N'Outpatient Rehab', N'1101237', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'PY0101', N'Inpatient Behavioral Health', N'11002321', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'PY0101', N'Inpatient Behavioral Health', N'11002322', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'ER0101', N'Emergency Dept - Adult', N'11002130', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'PE0101', N'Emergency Dept - Peds', N'11002130', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002092', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002151', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002088', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002150', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002148', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002270', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0101', N'Outpatient Imaging - Testing', N'11002093', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'ER0102', N'Emergency Dept - Adult', N'11002047', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'PE0102', N'Emergency Dept - Peds', N'11002047', N'<18       ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002051', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002231', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002149', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002236', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002250', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002262', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002245', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002246', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002267', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002268', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002211', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002094', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'OU0102', N'Outpatient Imaging - Testing', N'11002427', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0109', N'Walk-In Clinic - Adult', N'11002193', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0109', N'Walk-In Clinic - Adult', N'11002201', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0109', N'Walk-In Clinic - Adult', N'11002174', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0109', N'Walk-In Clinic - Adult', N'11002206', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0110', N'Walk-In Clinic - Peds', N'11002193', N'<18       ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0110', N'Walk-In Clinic - Peds', N'11002201', N'<18       ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0110', N'Walk-In Clinic - Peds', N'11002174', N'<18       ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (16107, N'UC0110', N'Walk-In Clinic - Peds', N'11002206', N'<18       ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'ER0101', N'Emergency Dept - Adult', N'11002047', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'PE0101', N'Emergency Dept - Peds', N'11002047', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002051', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002231', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002149', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002236', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002250', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002262', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002245', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002246', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002267', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002268', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002211', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002094', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002427', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'ER0101', N'Emergency Dept - Adult', N'11002047', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'PE0101', N'Emergency Dept - Peds', N'11002047', N'<18       ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002051', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002231', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002149', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002236', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002250', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002262', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002245', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002246', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002267', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002268', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002211', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002094', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (21344, N'OU0101', N'Outpatient Imaging - Testing', N'11002427', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'ER0101', N'Emergency Dept - Adult', N'11005012', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'PE0101', N'Emergency Dept - Peds', N'11005012', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11002942', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005018', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005019', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005020', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005021', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005022', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005023', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005024', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005025', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005026', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005052', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005083', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OU0101', N'Outpatient Imaging - Testing', N'11005088', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OR0101', N'Outpatient Rehab', N'11005031', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OR0101', N'Outpatient Rehab', N'11005029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24197, N'OR0101', N'Outpatient Rehab', N'11005030', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'ER0101', N'Emergency Dept - Adult', N'11018027', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'PE0101', N'Emergency Dept - Peds', N'11018027', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018073', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018074', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018075', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018076', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018077', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018078', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018079', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018080', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018082', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018083', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018084', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018085', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018086', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018087', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018090', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018092', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018094', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018103', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018104', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018114', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018115', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OU0101', N'Outpatient Imaging - Testing', N'11018116', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018119', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018118', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018120', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018113', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018045', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018127', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OR0101', N'Outpatient Rehab', N'11018044', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'UC0101', N'WIC / Urgent Care - Adult', N'11018063', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'UC0102', N'WIC / Urgent Care - Peds', N'11018063', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'OY0101', N'Outpatient Behavioral Health', N'11018032', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24198, N'PY0101', N'Inpatient Behavioral Health', N'11018029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'ER0101', N'Emergency Dept - Adult', N'11003013', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'PE0101', N'Emergency Dept - Peds', N'11003013', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11002940', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003017', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003023', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003024', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003025', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003026', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003028', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003057', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003058', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003089', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003090', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003091', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OU0101', N'Outpatient Imaging - Testing', N'11003104', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OR0101', N'Outpatient Rehab', N'11003064', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OR0101', N'Outpatient Rehab', N'11003019', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (24240, N'OR0101', N'Outpatient Rehab', N'11003021', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'UC0101', N'Walk-In Clinic - Adult', N'11004101', N'>=18      ', N'Changing to client ID 1946 - 4/24/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002193', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002201', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002174', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002206', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (1946, N'UC0102', N'Walk-In Clinic - Peds', N'11004101', N'<18       ', N'Changing to client ID 1946 - 4/24/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002193', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002201', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002174', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002206', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002193', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002201', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002174', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0101', N'Walk-In Clinic - Adult', N'11002206', N'>=18      ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002193', N'<18       ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002201', N'<18       ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002174', N'<18       ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (30270, N'UC0102', N'Walk-In Clinic - Peds', N'11002206', N'<18       ', N'Removed 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'1101258', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'1101286', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11006224', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11006256', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11018039', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11018043', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11018041', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11018040', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11018042', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11001046', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11014029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022001', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022002', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022003', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022014', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022006', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022008', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022012', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022004', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022005', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022007', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022011', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11004016', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002234', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002233', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002235', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002134', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002309', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002057', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11002135', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11003015', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11005016', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022009', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49526, N'OU0101', N'Outpatient Lab Testing', N'11022010', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'OY0101', N'Outpatient Behavioral Health', N'11016032', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'OY0101', N'Outpatient Behavioral Health', N'11016033', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'OY0101', N'Outpatient Behavioral Health', N'11016034', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016002', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016005', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016004', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016003', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016006', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016007', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'11016025', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'OY0101', N'Inpatient Behavioral Health', N'1101704', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101733', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101718', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101720', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101721', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101742', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101722', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101723', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101724', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101725', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101726', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101727', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101728', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'PY0101', N'Inpatient Behavioral Health', N'1101729', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'OY0101', N'Behavioral Health Spring Harbor', N'11016033', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49527, N'OY0102', N'Behavioral Health Biddeford', N'11016034', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101709', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101710', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101711', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101712', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101713', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101714', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101715', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101716', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101717', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101743', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101744', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101746', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101747', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101478', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101749', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101750', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101703', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101741', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101736', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101752', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101753', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101708', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101751', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101745', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101740', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Outpatient Behavioral Health', N'1101754', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0101', N'Behavioral Health SH Lancaster', N'11016031', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49528, N'OY0102', N'Behavioral Health Livermore Falls', N'11012113', N'>=18      ', N'New 7/1/2025')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000001', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000002', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000005', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000006', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000007', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000010', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000011', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000012', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000013', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000014', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000016', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000018', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000019', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000020', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000023', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000024', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000025', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000026', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000027', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000029', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000115', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000116', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000119', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000125', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11000127', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110001904', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001261', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001262', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001265', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001546', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001547', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001549', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001604', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001614', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001617', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001618', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001619', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001621', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001622', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001623', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001627', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001628', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001630', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001631', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001636', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001637', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001701', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001704', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001709', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001710', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001711', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001712', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001713', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001730', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001735', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001736', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001760', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001790', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001793', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001798', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001799', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001801', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001804', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001881', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001882', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001883', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001884', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001886', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001888', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001890', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001891', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001893', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001896', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001897', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001898', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001899', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001900', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001901', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001902', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11001924', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002153', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002154', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002155', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002158', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002159', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002160', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002161', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002162', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002164', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002165', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002166', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002172', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002173', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002182', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002183', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002184', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002185', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002188', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002191', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002194', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002198', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110022000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002202', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002203', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110022060', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110022100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002253', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002295', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002306', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002307', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002310', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110023100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002311', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002315', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002316', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002400', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002401', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002406', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110024100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002414', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002415', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002416', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002417', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002418', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110025100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110025200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110026100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110027100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110028100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002903', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002905', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002906', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110029100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002913', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002914', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002918', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002919', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002920', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110029200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002921', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002922', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002923', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002928', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002929', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002930', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110029300', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002981', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002984', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002985', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002987', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002988', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002989', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002991', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002993', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11002995', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110030100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003030', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003031', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003032', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003033', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003034', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003036', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003037', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003038', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003039', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003040', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003043', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003044', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003045', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003047', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003048', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003053', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003066', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003070', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003081', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003087', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003088', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003092', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003099', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003106', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110031100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003112', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110031300', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110031600', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110032100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11003225', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004076', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004077', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004078', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004083', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004090', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004096', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004098', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004102', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'110041100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004203', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004204', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004205', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004206', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11004207', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005062', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005067', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005073', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005074', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005075', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005076', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005077', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005078', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005079', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005080', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005081', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005082', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005085', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11005087', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'OU0101', N'Ambul. Medical Practice - Adult', N'11006204', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006270', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006280', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006287', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006293', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006300', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006322', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006330', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006332', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006334', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006335', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006338', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006339', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006341', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006346', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006348', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11006350', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11012013', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11012016', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11012115', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11012116', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11012117', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11012135', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101242', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101243', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101244', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101245', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101246', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101247', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101248', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101249', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101265', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101266', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014021', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014033', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014036', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014037', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014039', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014040', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014041', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014060', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014061', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014062', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11014086', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101468', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101706', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101719', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101730', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101731', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101734', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101735', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1101739', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018001', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018002', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018028', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018047', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018048', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018049', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018050', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018051', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018052', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018053', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018054', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018055', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018056', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018057', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018058', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018059', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018060', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018061', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018062', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018064', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018065', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018066', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018070', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018072', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018088', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018093', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018095', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018096', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018097', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018099', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018112', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018123', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018124', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018125', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018131', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018132', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018140', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018141', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'11018144', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'1182364', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'12000000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'13000000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'14000000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'15000000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'15100000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'15200000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'15300000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'17200000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'17300000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100102', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100103', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100104', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100105', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100106', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20100201', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20110100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20130000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20131000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20132100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20132101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'2013500', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20136000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'2013900', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20149000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20159000', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'203000100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500102', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500500', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500503', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20500504', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20600101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20600102', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20600103', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20600200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700102', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700103', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700104', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700105', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700106', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700107', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700108', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700117', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700120', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700121', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700123', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700124', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700125', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700126', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700151', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20700202', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20800100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20900100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'20900110', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'30100100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'30400100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'30600100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'30900100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40100500', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40200100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40300100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40300101', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40300104', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'4030015', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'4030016', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40300200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40300201', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'40300202', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'4030026', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'50400100', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'50400200', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0101', N'Ambul. Medical Practice - Adult', N'50400202', N'>=18      ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000001', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000002', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000005', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000006', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000007', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000010', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000011', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000012', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000013', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000014', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000016', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000018', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000019', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000020', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000023', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000024', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000025', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000026', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000027', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000029', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000115', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000116', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000119', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000125', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11000127', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110001904', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001261', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001262', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001265', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001546', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001547', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001549', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001604', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001614', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001617', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001618', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001619', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001621', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001622', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001623', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001627', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001628', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001630', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001631', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001636', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001637', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001701', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001704', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001709', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001710', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001711', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001712', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001713', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001730', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001735', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001736', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001760', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001790', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001793', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001798', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001799', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001801', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001804', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001881', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001882', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001883', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001884', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001886', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001888', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001890', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001891', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001893', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001896', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001897', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001898', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001899', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001900', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001901', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001902', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11001924', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002153', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002154', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002155', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002158', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002159', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002160', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002161', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002162', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002164', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002165', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002166', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002172', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002173', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002182', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002183', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002184', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002185', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002188', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002191', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002194', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002198', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110022000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002202', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002203', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110022060', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110022100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002253', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002295', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002306', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002307', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002310', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110023100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002311', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002315', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002316', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002400', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002401', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002406', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110024100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002414', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002415', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002416', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002417', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002418', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110025100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110025200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110026100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110027100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110028100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002903', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002905', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002906', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110029100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002913', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002914', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002918', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002919', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002920', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110029200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002921', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002922', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002923', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002928', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002929', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002930', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110029300', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002981', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002984', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002985', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002987', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002988', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002989', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002991', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002993', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11002995', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110030100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003030', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003031', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003032', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003033', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003034', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003036', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003037', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003038', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003039', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003040', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003043', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003044', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003045', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003047', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003048', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003053', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003066', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003070', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003081', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003087', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003088', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003092', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003099', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003106', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110031100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003112', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110031300', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110031600', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110032100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11003225', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004076', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004077', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004078', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004083', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004090', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004096', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004098', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004102', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'110041100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004203', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004204', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004205', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004206', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11004207', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005062', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005067', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005073', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005074', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005075', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005076', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005077', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005078', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005079', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005080', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005081', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005082', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005085', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11005087', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006204', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006270', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006280', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006287', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006293', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006300', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006322', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006330', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006332', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006334', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006335', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006338', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006339', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006341', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006346', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006348', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11006350', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11012013', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11012016', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11012115', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11012116', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11012117', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11012135', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101242', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101243', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101244', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101245', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101246', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101247', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101248', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101249', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101265', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101266', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014021', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014033', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014036', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014037', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014039', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014040', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014041', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014060', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014061', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014062', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11014086', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101468', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101706', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101719', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101730', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101731', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101734', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101735', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1101739', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018001', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018002', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018028', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018047', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018048', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018049', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018050', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018051', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018052', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018053', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018054', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018055', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018056', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018057', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018058', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018059', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018060', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018061', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018062', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018064', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018065', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018066', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018070', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018072', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018088', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018093', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018095', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018096', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018097', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018099', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018112', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018123', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018124', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018125', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018131', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018132', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018140', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018141', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'11018144', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'1182364', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'12000000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'13000000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'14000000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'15000000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'15100000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'15200000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'15300000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'17200000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'17300000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100102', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100103', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100104', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100105', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100106', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20100201', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20110100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20130000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20131000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20132100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20132101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'2013500', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20136000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'2013900', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20149000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20159000', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'203000100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500102', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500500', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500503', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20500504', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20600101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20600102', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20600103', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20600200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700102', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700103', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700104', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700105', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700106', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700107', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700108', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700117', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700120', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700121', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700123', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700124', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700125', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700126', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700151', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20700202', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20800100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20900100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'20900110', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'30100100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'30400100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'30600100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'30900100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40100500', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40200100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40300100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40300101', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40300104', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'4030015', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'4030016', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40300200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40300201', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'40300202', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'4030026', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'50400100', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'50400200', N'<18       ', N'')
GO
INSERT [dbo].[PressGaneySurveyMap] ([PressGaneyClientID], [SurveyDesignator], [Service], [DepartmentEpicId], [AgeQualifier], [Description]) VALUES (49529, N'MD0102', N'Ambul. Medical Practice - Peds', N'50400202', N'<18       ', N'')
GO
