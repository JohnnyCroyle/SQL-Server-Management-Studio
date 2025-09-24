USE [AetnaClaims]
GO
/****** Object:  StoredProcedure [dbo].[sp_PopulateMedRetailPharmacyFactTable]    Script Date: 9/10/2025 9:42:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 9/16/2025
------ Description:	This SP will transform and load staging data into fact table

------ =============================================*/


ALTER PROCEDURE [dbo].[sp_PopulateMedRetailPharmacyTable] @filename varchar(255)


AS

DECLARE @dbName varchar(100) = 'dbName: ' +  DB_Name()



BEGIN TRY
	SET NOCOUNT ON;


INSERT INTO AetnaClaims.fact.MemberRetailPharmacyClaims 
SELECT 
    CAST(TRIM(ps_unique_id) AS VARCHAR(255)) AS ps_unique_id,
    CAST(TRIM(customer_nbr) AS VARCHAR(255)) AS customer_nbr,
    CAST(TRIM(group_nbr) AS VARCHAR(255)) AS group_nbr,
    CAST(TRIM(file_source) AS VARCHAR(255)) AS file_source,
    CAST(TRIM(subgroup_nbr) AS VARCHAR(255)) AS subgroup_nbr,
    CAST(TRIM(account_nbr) AS VARCHAR(255)) AS account_nbr,
    CAST(TRIM(lob) AS VARCHAR(255)) AS lob,
    CAST(TRIM(rx_product_cd) AS VARCHAR(255)) AS rx_product_cd,
    CAST(TRIM(plan_id) AS VARCHAR(255)) AS plan_id,
    CAST(TRIM(fund_ctg_cd) AS VARCHAR(255)) AS fund_ctg_cd,
    CAST(TRIM(benefit_tier) AS VARCHAR(255)) AS benefit_tier,
    CAST(TRIM(rx_intgrtn_opt_cd) AS VARCHAR(255)) AS rx_intgrtn_opt_cd,
    CAST(TRIM(ee_id) AS VARCHAR(255)) AS ee_id,
    CAST(TRIM(ee_last_name) AS VARCHAR(255)) AS ee_last_name,
    CAST(TRIM(ee_first_name) AS VARCHAR(255)) AS ee_first_name,
    CAST(TRIM(subs_zip_cd) AS VARCHAR(255)) AS subs_zip_cd,
    CAST(TRIM(ssn_nbr) AS VARCHAR(255)) AS ssn_nbr,
    CAST(TRIM(member_id) AS VARCHAR(255)) AS member_id,
    CAST(TRIM(src_rx_member_id) AS VARCHAR(255)) AS src_rx_member_id,
    CAST(TRIM(src_last_name) AS VARCHAR(255)) AS src_last_name,
    CAST(TRIM(src_first_name) AS VARCHAR(255)) AS src_first_name,
    CAST(TRIM(src_mbr_gender_cd) AS VARCHAR(255)) AS src_mbr_gender_cd,
    CAST(TRIM(mbr_rtp_type_cd) AS VARCHAR(255)) AS mbr_rtp_type_cd,
    CAST(TRIM(src_mbr_birth_dt) AS VARCHAR(255)) AS src_mbr_birth_dt,
    CAST(TRIM(filler1) AS VARCHAR(255)) AS filler1,
    CAST(TRIM(filler2) AS VARCHAR(255)) AS filler2,
    CAST(TRIM(clm_status) AS VARCHAR(255)) AS clm_status,
    CAST(TRIM(dir_mbr_reim_ind) AS VARCHAR(255)) AS dir_mbr_reim_ind,
    CAST(TRIM(ee_ntwk_srv_area_id) AS VARCHAR(255)) AS ee_ntwk_srv_area_id,
    CAST(TRIM(office_id) AS VARCHAR(255)) AS office_id,
    CAST(TRIM(sort_name) AS VARCHAR(255)) AS sort_name,
    CAST(TRIM(prescriber_id) AS VARCHAR(255)) AS prescriber_id,
    CAST(TRIM(spclty_ctg_cd) AS VARCHAR(255)) AS spclty_ctg_cd,
    CAST(TRIM(address_line_1) AS VARCHAR(255)) AS address_line_1,
    CAST(TRIM(address_line_2) AS VARCHAR(255)) AS address_line_2,
    CAST(TRIM(nabp_nbr) AS VARCHAR(255)) AS nabp_nbr,
    CAST(TRIM(phm_zip_cd) AS VARCHAR(255)) AS phm_zip_cd,
    CAST(TRIM(process_dt) AS VARCHAR(255)) AS process_dt,
    CAST(TRIM(disp_dt) AS VARCHAR(255)) AS disp_dt,
    CAST(TRIM(ndc_cd) AS VARCHAR(255)) AS ndc_cd,
    CAST(TRIM(label_nm) AS VARCHAR(255)) AS label_nm,
    CAST(TRIM(formulary_cd) AS VARCHAR(255)) AS formulary_cd,
    CAST(TRIM(generic_cd) AS VARCHAR(255)) AS generic_cd,
    CAST(TRIM(source_type_cd) AS VARCHAR(255)) AS source_type_cd,
    CAST(TRIM(retail_mod_cd) AS VARCHAR(255)) AS retail_mod_cd,
    CAST(TRIM(new_refill_cnt) AS VARCHAR(255)) AS new_refill_cnt,
    CAST(TRIM(daw_cd) AS VARCHAR(255)) AS daw_cd,
    CAST(TRIM(unts_dispensed_qty) AS VARCHAR(255)) AS unts_dispensed_qty,
    CAST(TRIM(days_supply_cnt) AS VARCHAR(255)) AS days_supply_cnt,
    CAST(TRIM(sub_ing_cost_amt) AS DECIMAL(18,4)) AS sub_ing_cost_amt,
    CAST(TRIM(prof_fee_amt) AS DECIMAL(18,4)) AS prof_fee_amt,
    CAST(TRIM(awp_amt) AS DECIMAL(18,4)) AS awp_amt,
    CAST(TRIM(sales_tax_amt) AS DECIMAL(18,4)) AS sales_tax_amt,
    CAST(TRIM(app_to_per_ded_amt) AS DECIMAL(18,4)) AS app_to_per_ded_amt,
    CAST(TRIM(srv_copay_amt) AS DECIMAL(18,4)) AS srv_copay_amt,
    CAST(TRIM(paid_amt) AS DECIMAL(18,4)) AS paid_amt,
    CAST(TRIM(ahf_paid_amt) AS DECIMAL(18,4)) AS ahf_paid_amt,
    CAST(TRIM(ahf_bfd_amt) AS DECIMAL(18,4)) AS ahf_bfd_amt,
    CAST(TRIM(GPI) AS VARCHAR(255)) AS GPI,
    CAST(TRIM(phi_acas_bypass_cd) AS VARCHAR(255)) AS phi_acas_bypass_cd,
    CAST(TRIM(price_type_cd) AS VARCHAR(255)) AS price_type_cd,
    CAST(TRIM(calc_ing_cost_amt) AS DECIMAL(18,4)) AS calc_ing_cost_amt,
    CAST(TRIM(new_refill_cnt) AS INT) AS new_refill_cnt_int,
    CAST(TRIM(days_supply_cnt) AS INT) AS days_supply_cnt_int,
    CAST(TRIM(prescbr_id_qlfy_cd) AS VARCHAR(255)) AS prescbr_id_qlfy_cd,
    CAST(TRIM(prod_distnctn_cd) AS VARCHAR(255)) AS prod_distnctn_cd,
    CAST(TRIM(rx_claim_id) AS VARCHAR(255)) AS rx_claim_id,
    CAST(TRIM(compound_cd) AS VARCHAR(255)) AS compound_cd,
    CAST(TRIM(maint_drug_cd) AS VARCHAR(255)) AS maint_drug_cd,
    CAST(TRIM(prescription_nbr) AS VARCHAR(255)) AS prescription_nbr,
    CAST(TRIM(NABP_Provider_Name) AS VARCHAR(255)) AS NABP_Provider_Name,
    CAST(TRIM(prescribing_prov_name) AS VARCHAR(255)) AS prescribing_prov_name,
    CAST(TRIM(record_status) AS VARCHAR(255)) AS record_status,
    CAST(TRIM(ORG_CD) AS VARCHAR(255)) AS ORG_CD,
    CAST(TRIM(EOF) AS VARCHAR(255)) AS EOF,
    CAST('AETNA' AS varchar(255)) AS carrier_ind,
    @filename AS LoadFile,
	GETDATE() Created_Date,
	'sp_PopulateMedEligibilityFactTable' CreatedBy,
	GETDATE() Updated_Date,
	'sp_PopulateMedEligibilityFactTable' Updated_By
--INTO AetnaClaims.fact.MemberRetailPharmacyClaims 

FROM AetnaClaims.staging.MemberRetailPharmacyClaims AS s
WHERE NOT EXISTS (
	SELECT 1 
	FROM [AetnaClaims].[fact].[MemberRetailPharmacyClaims] AS f
	WHERE f.member_id = s.member_id
	  AND f.rx_claim_id = s.rx_claim_id )



--Delete records from staging table NOT Sure if we need to remove from staging after
--TRUNCATE TABLE AetnaClaims.staging.MemberRetailPharmacyClaims



END TRY
BEGIN CATCH
	EXEC ETLlog.dbo.sp_logErrorInfo @dbName;
	THROW
END CATCH



