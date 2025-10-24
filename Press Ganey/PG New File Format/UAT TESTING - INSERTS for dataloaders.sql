USE [ETLProcedureRepository]
GO
INSERT [dbo].[PressGaneySurveyDataLoadProcedures] ([proc_name], [is_active], [description]) VALUES (N'sp_PressGaney_NC0101_NICU', 1, NULL)
GO
INSERT [dbo].[PressGaneySurveyDataLoadProcedures] ([proc_name], [is_active], [description]) VALUES (N'sp_PressGaney_OR0101_Rehab', 1, NULL)
GO
INSERT [dbo].[PressGaneySurveyDataLoadProcedures] ([proc_name], [is_active], [description]) VALUES (N'sp_PressGaney_OU0101_Diagnostic_Imaging', 1, NULL)
GO
INSERT [dbo].[PressGaneySurveyDataLoadProcedures] ([proc_name], [is_active], [description]) VALUES (N'sp_PressGaney_SP0101_Pharmacy', 1, N'This will load SP0101 Pharmacy survey patient records')
GO
INSERT [dbo].[PressGaneySurveyDataLoadProcedures] ([proc_name], [is_active], [description]) VALUES (N'sp_PressGaney_SP0102HX_Palliative_Care', 1, NULL)
GO
INSERT [dbo].[PressGaneySurveyDataLoadProcedures] ([proc_name], [is_active], [description]) VALUES (N'sp_PressGaney_UC0103_UrgentCare', 1, NULL)
GO
