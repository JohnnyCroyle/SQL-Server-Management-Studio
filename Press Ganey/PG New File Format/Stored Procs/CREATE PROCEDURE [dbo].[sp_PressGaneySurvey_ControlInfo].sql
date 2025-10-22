USE [EDW_Work]
GO
/****** Object:  StoredProcedure [dbo].[sp_PressGaneySurvey_ControlInfo]    Script Date: 10/21/2025 1:33:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Johnny Croyle
-- Create date: 10/22/2025
-- Description:	Retrieve control information needed to run the SSIS package PressGaneySurveyEngine
-- =============================================
ALTER PROCEDURE [dbo].[sp_PressGaneySurvey_ControlInfo] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT CAST(FORMAT(getdate()-82 , 'MM/dd/yyyy') as varchar(10)) AS StartDate, 
	CAST(FORMAT(getdate() - 11, 'MM/dd/yyyy') as varchar(10)) as EndDate, FilePath,ErrorPath,ServerName  from PressGaneyControlTable


END
GO
