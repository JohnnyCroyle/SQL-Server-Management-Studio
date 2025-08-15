USE [JCROYLE]
GO

/****** Object:  Table [Aetna].[MemberRetailPharmacyClaims]    Script Date: 8/15/2025 2:59:15 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Aetna].[MemberRetailPharmacyClaims]') AND type in (N'U'))
DROP TABLE [Aetna].[MemberRetailPharmacyClaims]
GO

/****** Object:  Table [Aetna].[MemberRetailPharmacyClaims]    Script Date: 8/15/2025 2:59:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Aetna].[MemberRetailPharmacyClaims](
	[ps_unique_id] [int] NULL,
	[customer_nbr] [int] NULL,
	[group_nbr] [int] NULL,
	[file_source] [nvarchar](50) NULL,
	[subgroup_nbr] [int] NULL,
	[account_nbr] [nvarchar](50) NULL,
	[lob] [nvarchar](50) NULL,
	[rx_product_cd] [nvarchar](50) NULL,
	[plan_id] [nvarchar](50) NULL,
	[fund_ctg_cd] [nvarchar](50) NULL,
	[benefit_tier] [nvarchar](50) NULL,
	[rx_intgrtn_opt_cd] [nvarchar](50) NULL,
	[ee_id] [nvarchar](50) NULL,
	[ee_last_name] [nvarchar](50) NULL,
	[ee_first_name] [nvarchar](50) NULL,
	[subs_zip_cd] [int] NULL,
	[ssn_nbr] [nvarchar](50) NULL,
	[member_id] [float] NOT NULL,
	[src_rx_member_id] [int] NULL,
	[src_last_name] [nvarchar](50) NULL,
	[src_first_name] [nvarchar](50) NULL,
	[src_mbr_gender_cd] [nvarchar](50) NULL,
	[mbr_rtp_type_cd] [nvarchar](50) NULL,
	[src_mbr_birth_dt] [datetime2](7) NULL,
	[filler1] [nvarchar](50) NULL,
	[filler2] [nvarchar](50) NULL,
	[clm_status] [nvarchar](50) NULL,
	[dir_mbr_reim_ind] [nvarchar](50) NULL,
	[ee_ntwk_srv_area_id] [int] NULL,
	[office_id] [int] NULL,
	[sort_name] [nvarchar](50) NULL,
	[prescriber_id] [nvarchar](50) NULL,
	[spclty_ctg_cd] [nvarchar](50) NULL,
	[address_line_1] [nvarchar](50) NULL,
	[address_line_2] [nvarchar](50) NULL,
	[nabp_nbr] [int] NULL,
	[phm_zip_cd] [int] NULL,
	[process_dt] [datetime2](7) NULL,
	[disp_dt] [datetime2](7) NULL,
	[ndc_cd] [float] NULL,
	[label_nm] [nvarchar](50) NULL,
	[formulary_cd] [nvarchar](50) NULL,
	[generic_cd] [nvarchar](50) NULL,
	[source_type_cd] [nvarchar](50) NULL,
	[retail_mod_cd] [nvarchar](50) NULL,
	[new_refill_cnt] [nvarchar](50) NULL,
	[daw_cd] [nvarchar](50) NULL,
	[unts_dispensed_qty] [float] NULL,
	[days_supply_cnt] [nvarchar](50) NULL,
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
	[phi_acas_bypass_cd] [nvarchar](50) NULL,
	[price_type_cd] [nvarchar](50) NULL,
	[calc_ing_cost_amt] [float] NULL,
	[prescbr_id_qlfy_cd] [nvarchar](50) NULL,
	[prod_distnctn_cd] [nvarchar](50) NULL,
	[rx_claim_id] [float] NOT NULL,
	[compound_cd] [nvarchar](50) NULL,
	[maint_drug_cd] [nvarchar](50) NULL,
	[prescription_nbr] [float] NULL,
	[NABP_Provider_Name] [nvarchar](50) NULL,
	[prescribing_prov_name] [nvarchar](50) NULL,
	[record_status] [nvarchar](50) NULL,
	[ORG_CD] [nvarchar](200) NULL,
	[EOF] [nvarchar](50) NULL,
 CONSTRAINT [PK_RetailPharmacyClaims] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC,
	[rx_claim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


