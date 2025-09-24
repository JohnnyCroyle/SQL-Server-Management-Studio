USE [AetnaClaims]
GO
/****** Object:  StoredProcedure [dbo].[sp_PopulateCurrentClaims]    Script Date: 9/10/2025 9:42:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*-- =============================================
------ Author:		Johnny Croyle
------ Create date: 9/23/2025
------ Description:	This SP will transform and load staging data into datamart table

------ =============================================*/


CREATE PROCEDURE [dbo].[sp_PopulateCurrentClaims]


AS

DECLARE @dbName varchar(100) = 'dbName: ' +  DB_Name()



BEGIN TRY
	SET NOCOUNT ON;

	INSERT INTO  [AetnaClaims].[datamart].[MemberClaims] 

	SELECT  [member_id],
		[idn_ind],
		[emp_first_nm],
		[emp_last_nm],
		[emp_gender],
		[subscriber_brth_dt],
		[mem_first_nm],
		[mem_last_nm],
		[mem_gender],
		[clm_ln_type_cd],
		[non_prfrrd_srv_cd],
		[product_ln_cd],
		[plan_id],
		[non_prfrrd_srv_cd_BEN_TIER],
		[src_clm_id],
		[src_claim_line_id],
		[srv_prvdr_id],
		[srv_prvdr_npi],
		[print_nm_SERVICE],
		[address_line_1_txt],
		[address_line_2_txt],
		[city_nm],
		[zip_cd],
		[state_postal_cd],
		-- provider_type_cd: drop, add CODE_DESC as prov_group_type
		(SELECT CODE_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'PROVIDER_TYPE_CD' AND code_value = s.[provider_type_cd]
		 ) AS prov_group_type,
		-- specialty_cd: replace with CODE_DESC 'practice specialty'
		(SELECT CODE_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'SPECIALTY_CD' AND code_value = s.[specialty_cd]
		 ) AS practice_specialty,
		[prev_clm_seg_id],
		[derived_tcn_nbr],
		[src_claim_line_id_PAY],
		[claim_line_id],
		-- srv_capacity_cd: add CODES Desc 'PCP_assoc_service'
		(SELECT CODE_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'SRV_CAPACITY_CD' AND code_value = s.[srv_capacity_cd]
		 ) AS PCP_assoc_service,
		[tax_id_format_cd_PCP],
		[tax_id_nbr_PCP],
		[print_nm_PCP],
		[tax_id_format_cd_SERVICE],
		[tax_id_nbr_SERVICE],
		[payee_cd],
		[paid_prvdr_par_cd],
		[received_dt],
		[adjn_dt],
		[srv_start_dt],
		[srv_stop_dt],
		[paid_dt],
		-- mdc_cd: add CODES Desc 'mdc_descr'
		(SELECT CODE_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'MDC_CD' AND code_value = s.[mdc_cd]
		 ) AS mdc_descr,
		[drg_cd],
		(SELECT CODE_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'DRG_CD' AND code_value = s.[drg_cd]
		 ) AS drg_cd_description,
		[prcdr_cd],
		[prcdr_modifier_cd_1],
		[prcdr_type_cd_2],
		-- MED_COST_SUBCTG_CD: drop, add CODE_DESC and LKUP_DESC
		(SELECT CODE_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'MED_COST_SUBCTG_CD' AND code_value = s.[MED_COST_SUBCTG_CD]
		 ) AS med_cost_category_detail,
		(SELECT LKUP_DESC 
			FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'MED_COST_SUBCTG_CD' AND code_value = s.[MED_COST_SUBCTG_CD]
		 ) AS med_cost_category,
		-- prcdr_group_nbr: replace with CODE DESC 'procedure group'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'PRCDR_GROUP_NBR' AND code_value = s.[prcdr_group_nbr]
		 ) AS procedure_group,
		-- type_srv_cd: replace with CODE DESC 'type_service_descr'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'TYPE_SRV_CD' AND code_value = s.[type_srv_cd]
		 ) AS type_service_descr,
		-- plc_srv_cd: replace with CODE DESC 'POS'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'PLC_SRV_CD' AND code_value = s.[plc_srv_cd]
		 ) AS POS,
		-- dschrg_status_cd: replace with CODE DESC 'discharge_status'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'DSCHRG_STATUS_CD' AND code_value = s.[dschrg_status_cd]
		 ) AS discharge_status,
		-- revenue_cd: keep code value and add CODE DESC 'revenue_code_descr'
		[revenue_cd],
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'REVENUE_CD' AND code_value = s.[revenue_cd]
		 ) AS revenue_code_descr,
		-- clm_ln_msg_cd_1: add CODE DESC 'clm_msg_1'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'CLM_LN_MSG_CD_1' AND code_value = s.[clm_ln_msg_cd_1]
		 ) AS clm_msg_1,
		-- clm_ln_msg_cd_2: add CODE DESC 'clm_msg_2'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'CLM_LN_MSG_CD_2' AND code_value = s.[clm_ln_msg_cd_2]
		 ) AS clm_msg_2,
		-- clm_ln_msg_cd_3: add CODE DESC 'clm_msg_3'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'CLM_LN_MSG_CD_3' AND code_value = s.[clm_ln_msg_cd_3]
		 ) AS clm_msg_3,
		[type_srv_cd],
		[srv_benefit_cd],
		[tooth_1_nbr],
		[plc_srv_cd],
		[dschrg_status_cd],
		[hcfa_bill_type_cd],
		[unit_cnt],
		[src_unit_cnt],
		[billed_amt],
		[not_covered_amt_1],
		[not_covered_amt_2],
		[not_covered_amt_3],
		[clm_ln_msg_cd_1],
		[clm_ln_msg_cd_2],
		[clm_ln_msg_cd_3],
		[covered_amt],
		[allowed_amt],
		[column93],
		[srv_copay_amt],
		[src_srv_copay_amt],
		[deductible_amt],
		[coinsurance_amt],
		[src_coins_amt],
		[bnft_payable_amt],
		[paid_amt],
		[pri_payer_cvg_cd],
		[cob_type_cd],
		[cob_cd],
		[prcdr_cd_ndc],
		[member_cumbID],
		[clm_ln_status_cd],
		[src_member_id],
		[reversal_cd],
		[admit_cnt],
		[prod_distnctn_cd],
		[billed_eligible_amt],
		-- SPCLTY_CTG_CLS_CD: drop, add CODE_DESC as spclty_ctg_cls_cd
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'SPCLTY_CTG_CLS_CD' AND code_value = s.[SPCLTY_CTG_CLS_CD]
		  ) AS spclty_ctg_cls_cd,
		[column128],
		[column129],
		[column130],
		[pricing_mthd_cd],
		[type_class_cd],
		-- specialty_ctg_cd: replace with CODE_DESC 'provider_specialty'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'SPECIALTY_CTG_CD' AND code_value = s.[specialty_ctg_cd]
		  ) AS provider_specialty,
		[SRV_SPCLTY_CTG_CD],
		-- HCFA_PLC_SRV_CD: drop, add CODE_DESC as HCFA_POS
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			WHERE code = 'HCFA_PLC_SRV_CD' AND code_value = s.[HCFA_PLC_SRV_CD]
		  ) AS HCFA_POS,
		[HCFA_ADMIT_SRC_CD],
		[SRC_ADMIT_DT],
		[SRC_DISCHARGE_DT],
		[prcdr_modifier_cd_2],
		[prcdr_modifier_cd_3],
		[sensitivity_ind],
		-- HCFA_ADMIT_TYPE_CD: replace with CODE_DESC 'hcfa_admit_type'
		(SELECT CODE_DESC 
			  FROM [AetnaClaims].[staging].[CodesLookup] 
			  WHERE code = 'HCFA_ADMIT_TYPE_CD' AND code_value = s.[HCFA_ADMIT_TYPE_CD]
		  ) AS hcfa_admit_type,
		[carrier_ind],
		[LoadFileName],
		[Created_Date],
		[Created_By],
		[Updated_Date],
		[Updated_By]

	FROM [AetnaClaims].[fact].[MemberClaims] s
	WHERE NOT EXISTS (
		SELECT 1 
		FROM [AetnaClaims].[datamart].[MemberClaims] as f
		WHERE f.member_id = s.member_id
		  AND f.claim_line_id = s.claim_line_id
	)




END TRY
BEGIN CATCH
	EXEC ETLlog.dbo.sp_logErrorInfo @dbName;
	THROW
END CATCH



