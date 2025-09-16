USE [AetnaClaims_DEV]
GO
/****** Object:  StoredProcedure [dbo].[sp_PopulateMedEligibilityFactTable]    Script Date: 9/10/2025 9:42:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 9/16/2025
------ Description:	This SP will transform and load staging data into fact table

------ =============================================*/


CREATE PROCEDURE [dbo].[sp_PopulateMedEligibilityDrugTable] @filename varchar(255)


AS

DECLARE @dbName varchar(100) = 'dbName: ' +  DB_Name()



BEGIN TRY
	SET NOCOUNT ON;

INSERT INTO [AetnaClaims_DEV].[fact].[MemberEligibility]
SELECT
	TRIM(CAST(member_id AS varchar(255))) AS member_id,
	TRIM(CAST(eff_mm AS varchar(10))) AS eff_mm,
	TRIM(CAST(msk_prefix_nm AS varchar(255))) AS msk_prefix_nm,
	TRIM(CAST(last_nm AS varchar(255))) AS last_nm,
	TRIM(CAST(first_nm AS varchar(255))) AS first_nm,
	TRIM(CAST(suffix_nm AS varchar(255))) AS suffix_nm,
	TRIM(CAST(mbr_gender_cd AS varchar(255))) AS mbr_gender_cd,
	TRIM(CAST(birth_dt AS varchar(10))) AS birth_dt,
	TRIM(CAST(address_line_1_txt AS varchar(255))) AS address_line_1_txt,
	TRIM(CAST(address_line_2_txt AS varchar(255))) AS address_line_2_txt,
	TRIM(CAST(city_nm AS varchar(255))) AS city_nm,
	TRIM(CAST(state_postal_cd AS varchar(255))) AS state_postal_cd,
	TRIM(CAST(county_cd AS varchar(255))) AS county_cd,
	TRIM(CAST(zip_cd AS varchar(255))) AS zip_cd,
	TRIM(CAST(phone_number AS varchar(255))) AS phone_number,
	TRIM(CAST(src_member_id AS varchar(255))) AS src_member_id,
	TRIM(CAST(mbr_rtp_type_cd AS varchar(255))) AS mbr_rtp_type_cd,
	TRIM(CAST(ssn_nbr AS varchar(255))) AS ssn_nbr,
	TRIM(CAST(ps_unique_id AS varchar(255))) AS ps_unique_id,
	TRIM(CAST(customer_nbr AS varchar(255))) AS customer_nbr,
	TRIM(CAST(group_nbr AS varchar(255))) AS group_nbr,
	TRIM(CAST(subgroup_nbr AS varchar(255))) AS subgroup_nbr,
	TRIM(CAST(account_nbr AS varchar(255))) AS account_nbr,
	TRIM(CAST(last_nm2 AS varchar(255))) AS last_nm2,
	TRIM(CAST(first_nm2 AS varchar(255))) AS first_nm2,
	TRIM(CAST(gender_cd AS varchar(255))) AS gender_cd,
	TRIM(CAST(subscriber_brth_dt AS varchar(10))) AS subscriber_brth_dt,
	TRIM(CAST(subs_zip_cd AS varchar(255))) AS subs_zip_cd,
	TRIM(CAST(subs_st_postal_cd AS varchar(255))) AS subs_st_postal_cd,
	TRIM(CAST(county_cd2 AS varchar(255))) AS county_cd2,
	TRIM(CAST(SSN_NBR2 AS varchar(255))) AS SSN_NBR2,
	TRIM(CAST(file_id AS varchar(255))) AS file_id,
	TRIM(CAST(plsp_prod_cd AS varchar(255))) AS plsp_prod_cd,
	TRIM(CAST(product_ln_cd AS varchar(255))) AS product_ln_cd,
	TRIM(CAST(fund_ctg_cd AS varchar(255))) AS fund_ctg_cd,
	TRIM(CAST(coverage_type_cd AS varchar(255))) AS coverage_type_cd,
	TRIM(CAST(ntwk_srv_area_id AS varchar(255))) AS ntwk_srv_area_id,
	TRIM(CAST(cust_subseg_cd AS varchar(255))) AS cust_subseg_cd,
	TRIM(CAST(medical_ind AS varchar(255))) AS medical_ind,
	TRIM(CAST(drug_ind AS varchar(255))) AS drug_ind,
	TRIM(CAST(sbstnc_abuse_ind AS varchar(255))) AS sbstnc_abuse_ind,
	TRIM(CAST(mental_health_ind AS varchar(255))) AS mental_health_ind,
	TRIM(CAST(orig_covg_eff_dt AS varchar(10))) AS orig_covg_eff_dt,
	TRIM(CAST(tax_id_nbr AS varchar(255))) AS tax_id_nbr,
	TRIM(CAST(pcp_prvdr_id AS varchar(255))) AS pcp_prvdr_id,
	TRIM(CAST(print_nm AS varchar(255))) AS print_nm,
	TRIM(CAST(address_line_1_txt2 AS varchar(255))) AS address_line_1_txt2,
	TRIM(CAST(address_line_2_txt2 AS varchar(255))) AS address_line_2_txt2,
	TRIM(CAST(city_nm2 AS varchar(255))) AS city_nm2,
	TRIM(CAST(state_postal_cd2 AS varchar(255))) AS state_postal_cd2,
	TRIM(CAST(zip_cd2 AS varchar(255))) AS zip_cd2,
	TRIM(CAST(npi_nbr AS varchar(255))) AS npi_nbr,
	TRIM(CAST(SPECIALTY_CTG_CD AS varchar(255))) AS SPECIALTY_CTG_CD,
	TRIM(CAST(org_id AS varchar(255))) AS org_id,
	TRIM(CAST(first_vst_dt AS varchar(10))) AS first_vst_dt,
	TRIM(CAST(last_vst_dt AS varchar(10))) AS last_vst_dt,
	TRIM(CAST(visit_nbr AS varchar(255))) AS visit_nbr,
	TRIM(CAST(tax_id_nbr2 AS varchar(255))) AS tax_id_nbr2,
	TRIM(CAST(attr_prvdr_id AS varchar(255))) AS attr_prvdr_id,
	TRIM(CAST(print_nm2 AS varchar(255))) AS print_nm2,
	TRIM(CAST(address_line_1_txt3 AS varchar(255))) AS address_line_1_txt3,
	TRIM(CAST(address_line_2_txt3 AS varchar(255))) AS address_line_2_txt3,
	TRIM(CAST(city_nm3 AS varchar(255))) AS city_nm3,
	TRIM(CAST(state_postal_cd3 AS varchar(255))) AS state_postal_cd3,
	TRIM(CAST(zip_cd3 AS varchar(255))) AS zip_cd3,
	TRIM(CAST(npi_nbr2 AS varchar(255))) AS npi_nbr2,
	TRIM(CAST(SPECIALTY_CTG_CD2 AS varchar(255))) AS SPECIALTY_CTG_CD2,
	TRIM(CAST(STATUS_IND AS varchar(255))) AS STATUS_IND,
	TRIM(CAST(eff_dt AS varchar(10))) AS eff_dt,
	TRIM(CAST(cncl_dt AS varchar(10))) AS cncl_dt,
	TRIM(CAST(SRC_CUMB_ID AS varchar(255))) AS SRC_CUMB_ID,
	TRIM(CAST(SRC_CUMB_ID2 AS varchar(255))) AS SRC_CUMB_ID2,
	TRIM(CAST(middle_nm AS varchar(255))) AS middle_nm,
	TRIM(CAST(individual_id AS varchar(255))) AS individual_id,
	TRIM(CAST(pulse_fsi_score AS varchar(255))) AS pulse_fsi_score,
	TRIM(CAST(ERG_Prospective_Score AS varchar(255))) AS ERG_Prospective_Score,
	TRIM(CAST(ERG_Retro_Score AS varchar(255))) AS ERG_Retro_Score,
	TRIM(CAST(product_ln_cd2 AS varchar(255))) AS product_ln_cd2,
	TRIM(CAST(aetna_card_number AS varchar(255))) AS aetna_card_number,
	TRIM(CAST(grp_cntl_name AS varchar(255))) AS grp_cntl_name,
	TRIM(CAST(currect_record_indicator AS varchar(255))) AS currect_record_indicator,
	TRIM(CAST(cumb_id_seq_no AS varchar(255))) AS cumb_id_seq_no,
	TRIM(CAST(filler AS varchar(255))) AS filler,
	TRIM(CAST(derived AS varchar(255))) AS derived,
	TRIM(CAST(attprv_USE_SOURCE AS varchar(255))) AS attprv_USE_SOURCE,
	TRIM(CAST(ia_fncl_risk_cd AS varchar(255))) AS ia_fncl_risk_cd,
	TRIM(CAST(ORG_ID2 AS varchar(255))) AS ORG_ID2,
	TRIM(CAST(PLAN_ID AS varchar(255))) AS PLAN_ID,
	CAST('AETNA' AS varchar(255)) carrier_ind,
	@filename LoadFile,
	GETDATE() Created_Date,
	'sp_PopulateMedEligibilityFactTable' CreatedBy,
	GETDATE() Updated_Date,
	'sp_PopulateMedEligibilityFactTable' Updated_By
FROM [AetnaClaims_DEV].[staging].[MemberEligibility] AS s
WHERE NOT EXISTS (
	SELECT 1 
	FROM [AetnaClaims_DEV].[fact].[MemberEligibility] AS f
	WHERE f.member_id = s.member_id
	  AND f.eff_mm = s.eff_mm
)



--Delete records from staging table NOT Sure if we need to remove from staging after
--TRUNCATE TABLE AetnaClaims_DEV.staging.Eligibility



END TRY
BEGIN CATCH
	EXEC ETLlog.dbo.sp_logErrorInfo @dbName;
	THROW
END CATCH



