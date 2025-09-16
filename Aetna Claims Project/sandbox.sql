

--7 monthes of data
--Start 6:23
--End   

--TRUNCATE TABLE [AetnaClaims_DEV].[staging].[MemberClaims] 
--TRUNCATE TABLE [AetnaClaims_DEV].[fact].[MemberClaims] 
--TRUNCATE TABLE [AetnaClaims_DEV].[staging].[MemberEligibility] 
--TRUNCATE TABLE [AetnaClaims_DEV].[fact].[MemberEligibility] 
TRUNCATE TABLE [AetnaClaims_DEV].[staging].[MemberRetailPharmacyClaims] 
TRUNCATE TABLE [AetnaClaims_DEV].[fact].[MemberRetailPharmacyClaims]


SELECT DISTINCT Created_By FROM [AetnaClaims_DEV].[staging].[MemberClaims] 


SELECT count(*)  FROM [AetnaClaims_DEV].[fact].[MemberClaims]  Where Created_By = 'MAINEH_EE_AETACLAIM_202502_20250314'


--1270618
SELECT count(*)  FROM [AetnaClaims_DEV].[fact].[MemberClaims]  Where LoadFileName = 'MAINEH_EE_AETACLAIM_202507_20250814'

SELECT DISTINCT count(*)  FROM [AetnaClaims_DEV].[fact].[MemberClaims]

--SELECT *  FROM [AetnaClaims_DEV].[staging].[MemberClaims]

INSERT INTO [AetnaClaims_DEV].[fact].[MemberClaims]
Select  count(*)   from AetnaClaims_DEV.staging.MemberClaims Where Created_By = 'MAINEH_EE_AETACLAIM_202507_20250814'
Select  count(*)   from AetnaClaims_DEV.fact.MemberClaims Where LoadFileName = 'MAINEH_EE_AETACLAIM_202507_20250814'


SELECT *  FROM [AetnaClaims_DEV].[fact].[MemberClaims] 



SELECT*  FROM [AetnaClaims_DEV].[staging].[MemberClaims] 


SELECT count(*) as staging  FROM [AetnaClaims_DEV].[staging].[MemberClaims]
SELECT count(*) as fact FROM [AetnaClaims_DEV].[fact].[MemberClaims] --786556


SELECT count(*) as staging_Eligibility  FROM [AetnaClaims_DEV].[staging].[MemberEligibility]
SELECT count(*) as fact_Eligibility  FROM [AetnaClaims_DEV].[fact].[MemberEligibility]


SELECT count(*) as staging_Drug  FROM [AetnaClaims_DEV].[staging].[MemberRetailPharmacyClaims]
SELECT count(*) as fact_Drug  FROM [AetnaClaims_DEV].[fact].[MemberRetailPharmacyClaims]


EXEC [dbo].[sp_PopulateMedClaimsFactTable] @filename = 'test' 




SELECT 
    r.session_id,
    r.status,
    r.command,
    t.text AS sql_text,
	r.*
FROM 
    sys.dm_exec_requests r
CROSS APPLY 
    sys.dm_exec_sql_text(r.sql_handle) t
WHERE 
    t.text LIKE '%sp_PopulateMedClaimsFactTable%';

	

	exec sp_who2 

	kill 190  

	Declare @killstatement as varchar(5)
	SET @killstatement = 'KILL 190;'  
EXEC (@killstatement)

	EXEC msdb.dbo.sp_stop_job @job_name = 'sp_PopulateMedClaimsFactTable';



	SELECT session_id, status, command, blocking_session_id, wait_time, wait_type 
FROM sys.dm_exec_requests
WHERE database_id = DB_ID('AetnaClaims_DEV');