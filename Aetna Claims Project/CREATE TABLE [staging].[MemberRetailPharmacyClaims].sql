USE [AetnaClaims_DEV]
GO

/****** Object:  Table [staging].[MemberRetailPharmacyClaims]    Script Date: 8/15/2025 2:59:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[staging].[MemberRetailPharmacyClaims]') AND type in (N'U'))
DROP TABLE [staging].[MemberRetailPharmacyClaims]
GO

/****** Object:  Table [staging].[MemberRetailPharmacyClaims]    Script Date: 8/15/2025 2:59:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [staging].[MemberRetailPharmacyClaims](
	[ps_unique_id] [int] NULL,
	[customer_nbr] [int] NULL,
	[group_nbr] [int] NULL,
	[file_source] [nvarchar](MAX) NULL,
	[subgroup_nbr] [int] NULL,
	[account_nbr] [nvarchar](MAX) NULL,
	[lob] [nvarchar](MAX) NULL,
	[rx_product_cd] [nvarchar](MAX) NULL,
	[plan_id] [nvarchar](MAX) NULL,
	[fund_ctg_cd] [nvarchar](MAX) NULL,
	[benefit_tier] [nvarchar](MAX) NULL,
	[rx_intgrtn_opt_cd] [nvarchar](MAX) NULL,
	[ee_id] [nvarchar](MAX) NULL,
	[ee_last_name] [nvarchar](MAX) NULL,
	[ee_first_name] [nvarchar](MAX) NULL,
	[subs_zip_cd] [int] NULL,
	[ssn_nbr] [nvarchar](MAX) NULL,
	[member_id] [float] NOT NULL,
	[src_rx_member_id] [int] NULL,
	[src_last_name] [nvarchar](MAX) NULL,
	[src_first_name] [nvarchar](MAX) NULL,
	[src_mbr_gender_cd] [nvarchar](MAX) NULL,
	[mbr_rtp_type_cd] [nvarchar](MAX) NULL,
	[src_mbr_birth_dt] [datetime2](7) NULL,
	[filler1] [nvarchar](MAX) NULL,
	[filler2] [nvarchar](MAX) NULL,
	[clm_status] [nvarchar](MAX) NULL,
	[dir_mbr_reim_ind] [nvarchar](MAX) NULL,
	[ee_ntwk_srv_area_id] [int] NULL,
	[office_id] [int] NULL,
	[sort_name] [nvarchar](MAX) NULL,
	[prescriber_id] [nvarchar](MAX) NULL,
	[spclty_ctg_cd] [nvarchar](MAX) NULL,
	[address_line_1] [nvarchar](MAX) NULL,
	[address_line_2] [nvarchar](MAX) NULL,
	[nabp_nbr] [int] NULL,
	[phm_zip_cd] [int] NULL,
	[process_dt] [datetime2](7) NULL,
	[disp_dt] [datetime2](7) NULL,
	[ndc_cd] [float] NULL,
	[label_nm] [nvarchar](MAX) NULL,
	[formulary_cd] [nvarchar](MAX) NULL,
	[generic_cd] [nvarchar](MAX) NULL,
	[source_type_cd] [nvarchar](MAX) NULL,
	[retail_mod_cd] [nvarchar](MAX) NULL,
	[new_refill_cnt] [nvarchar](MAX) NULL,
	[daw_cd] [nvarchar](MAX) NULL,
	[unts_dispensed_qty] [float] NULL,
	[days_supply_cnt] [nvarchar](MAX) NULL,
	[sub_ing_cost_amt] [float] NULL,
	[prof_fee_amt] [float] NULL,
	[awp_amt] [float] NULL,
	[sales_tax_amt] [float] NULL,
	[app_to_per_ded_amt] [float] NULL,
	[srv_copay_amt] [float] NULL,
	[paid_amt] [float] NULL,
	[ahf_paid_amt] [float] NULL,
	[ahf_bfd_amt] [float] NULL,
	[GPI] [float] NULL,
	[phi_acas_bypass_cd] [nvarchar](MAX) NULL,
	[price_type_cd] [nvarchar](MAX) NULL,
	[calc_ing_cost_amt] [float] NULL,
	[prescbr_id_qlfy_cd] [nvarchar](MAX) NULL,
	[prod_distnctn_cd] [nvarchar](MAX) NULL,
	[rx_claim_id] [float] NOT NULL,
	[compound_cd] [nvarchar](MAX) NULL,
	[maint_drug_cd] [nvarchar](MAX) NULL,
	[prescription_nbr] [float] NULL,
	[NABP_Provider_Name] [nvarchar](MAX) NULL,
	[prescribing_prov_name] [nvarchar](MAX) NULL,
	[record_status] [nvarchar](MAX) NULL,
	[ORG_CD] [nvarchar](200) NULL,
	[EOF] [nvarchar](MAX) NULL,
) ON [PRIMARY]
GO


