USE [AetnaClaims_DEV]
GO

/****** Object:  Table [fact].[MemberRetailPharmacyClaims]    Script Date: 9/16/2025 5:50:13 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[fact].[MemberRetailPharmacyClaims]') AND type in (N'U'))
DROP TABLE [fact].[MemberRetailPharmacyClaims]
GO

/****** Object:  Table [fact].[MemberRetailPharmacyClaims]    Script Date: 9/16/2025 5:50:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [fact].[MemberRetailPharmacyClaims](
	[ps_unique_id] [varchar](255) NULL,
	[customer_nbr] [varchar](255) NULL,
	[group_nbr] [varchar](255) NULL,
	[file_source] [varchar](255) NULL,
	[subgroup_nbr] [varchar](255) NULL,
	[account_nbr] [varchar](255) NULL,
	[lob] [varchar](255) NULL,
	[rx_product_cd] [varchar](255) NULL,
	[plan_id] [varchar](255) NULL,
	[fund_ctg_cd] [varchar](255) NULL,
	[benefit_tier] [varchar](255) NULL,
	[rx_intgrtn_opt_cd] [varchar](255) NULL,
	[ee_id] [varchar](255) NULL,
	[ee_last_name] [varchar](255) NULL,
	[ee_first_name] [varchar](255) NULL,
	[subs_zip_cd] [varchar](255) NULL,
	[ssn_nbr] [varchar](255) NULL,
	[member_id] [varchar](255) NULL,
	[src_rx_member_id] [varchar](255) NULL,
	[src_last_name] [varchar](255) NULL,
	[src_first_name] [varchar](255) NULL,
	[src_mbr_gender_cd] [varchar](255) NULL,
	[mbr_rtp_type_cd] [varchar](255) NULL,
	[src_mbr_birth_dt] [varchar](255) NULL,
	[filler1] [varchar](255) NULL,
	[filler2] [varchar](255) NULL,
	[clm_status] [varchar](255) NULL,
	[dir_mbr_reim_ind] [varchar](255) NULL,
	[ee_ntwk_srv_area_id] [varchar](255) NULL,
	[office_id] [varchar](255) NULL,
	[sort_name] [varchar](255) NULL,
	[prescriber_id] [varchar](255) NULL,
	[spclty_ctg_cd] [varchar](255) NULL,
	[address_line_1] [varchar](255) NULL,
	[address_line_2] [varchar](255) NULL,
	[nabp_nbr] [varchar](255) NULL,
	[phm_zip_cd] [varchar](255) NULL,
	[process_dt] [varchar](255) NULL,
	[disp_dt] [varchar](255) NULL,
	[ndc_cd] [varchar](255) NULL,
	[label_nm] [varchar](255) NULL,
	[formulary_cd] [varchar](255) NULL,
	[generic_cd] [varchar](255) NULL,
	[source_type_cd] [varchar](255) NULL,
	[retail_mod_cd] [varchar](255) NULL,
	[new_refill_cnt] [varchar](255) NULL,
	[daw_cd] [varchar](255) NULL,
	[unts_dispensed_qty] [varchar](255) NULL,
	[days_supply_cnt] [varchar](255) NULL,
	[sub_ing_cost_amt] [decimal](18, 4) NULL,
	[prof_fee_amt] [decimal](18, 4) NULL,
	[awp_amt] [decimal](18, 4) NULL,
	[sales_tax_amt] [decimal](18, 4) NULL,
	[app_to_per_ded_amt] [decimal](18, 4) NULL,
	[srv_copay_amt] [decimal](18, 4) NULL,
	[paid_amt] [decimal](18, 4) NULL,
	[ahf_paid_amt] [decimal](18, 4) NULL,
	[ahf_bfd_amt] [decimal](18, 4) NULL,
	[GPI] [varchar](255) NULL,
	[phi_acas_bypass_cd] [varchar](255) NULL,
	[price_type_cd] [varchar](255) NULL,
	[calc_ing_cost_amt] [decimal](18, 4) NULL,
	[new_refill_cnt_int] [int] NULL,
	[days_supply_cnt_int] [int] NULL,
	[prescbr_id_qlfy_cd] [varchar](255) NULL,
	[prod_distnctn_cd] [varchar](255) NULL,
	[rx_claim_id] [varchar](255) NULL,
	[compound_cd] [varchar](255) NULL,
	[maint_drug_cd] [varchar](255) NULL,
	[prescription_nbr] [varchar](255) NULL,
	[NABP_Provider_Name] [varchar](255) NULL,
	[prescribing_prov_name] [varchar](255) NULL,
	[record_status] [varchar](255) NULL,
	[ORG_CD] [varchar](255) NULL,
	[EOF] [varchar](255) NULL,
	[carrier_ind] [varchar](255) NULL,
	[LoadFile] [varchar](255) NOT NULL,
	[Created_Date] [datetime] NOT NULL,
	[CreatedBy] [varchar](255) NOT NULL,
	[Updated_Date] [datetime] NOT NULL,
	[Updated_By] [varchar](255) NOT NULL
) ON [PRIMARY]
GO


