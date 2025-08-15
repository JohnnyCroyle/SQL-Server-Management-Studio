USE [JCROYLE]
GO

/****** Object:  Table [Aetna].[MemberEligibility]    Script Date: 8/15/2025 12:46:05 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Aetna].[MemberEligibility]') AND type in (N'U'))
DROP TABLE [Aetna].[MemberEligibility]
GO

/****** Object:  Table [Aetna].[MemberEligibility]    Script Date: 8/15/2025 12:46:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Aetna].[MemberEligibility](
	[member_id] [float] NOT NULL,
	[eff_mm] [int] NOT NULL,
	[msk_prefix_nm] [nvarchar](50) NULL,
	[last_nm] [nvarchar](50) NULL,
	[first_nm] [nvarchar](50) NULL,
	[suffix_nm] [nvarchar](50) NULL,
	[mbr_gender_cd] [nvarchar](50) NULL,
	[birth_dt] [datetime2](7) NULL,
	[address_line_1_txt] [nvarchar](50) NULL,
	[address_line_2_txt] [nvarchar](50) NULL,
	[city_nm] [nvarchar](50) NULL,
	[state_postal_cd] [nvarchar](50) NULL,
	[county_cd] [nvarchar](50) NULL,
	[zip_cd] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
	[src_member_id] [int] NULL,
	[mbr_rtp_type_cd] [nvarchar](50) NULL,
	[ssn_nbr] [nvarchar](50) NULL,
	[ps_unique_id] [int] NULL,
	[customer_nbr] [int] NULL,
	[group_nbr] [int] NULL,
	[subgroup_nbr] [int] NULL,
	[account_nbr] [int] NULL,
	[last_nm2] [nvarchar](50) NULL,
	[first_nm2] [nvarchar](50) NULL,
	[gender_cd] [nvarchar](50) NULL,
	[subscriber_brth_dt] [datetime2](7) NULL,
	[subs_zip_cd] [nvarchar](50) NULL,
	[subs_st_postal_cd] [nvarchar](50) NULL,
	[county_cd2] [nvarchar](50) NULL,
	[SSN_NBR2] [nvarchar](50) NULL,
	[file_id] [int] NULL,
	[plsp_prod_cd] [nvarchar](50) NULL,
	[product_ln_cd] [nvarchar](50) NULL,
	[fund_ctg_cd] [nvarchar](50) NULL,
	[coverage_type_cd] [nvarchar](50) NULL,
	[ntwk_srv_area_id] [nvarchar](50) NULL,
	[cust_subseg_cd] [nvarchar](50) NULL,
	[medical_ind] [nvarchar](50) NULL,
	[drug_ind] [nvarchar](50) NULL,
	[sbstnc_abuse_ind] [nvarchar](50) NULL,
	[mental_health_ind] [nvarchar](50) NULL,
	[orig_covg_eff_dt] [datetime2](7) NULL,
	[tax_id_nbr] [nvarchar](50) NULL,
	[pcp_prvdr_id] [nvarchar](50) NULL,
	[print_nm] [nvarchar](50) NULL,
	[address_line_1_txt2] [nvarchar](50) NULL,
	[address_line_2_txt2] [nvarchar](50) NULL,
	[city_nm2] [nvarchar](50) NULL,
	[state_postal_cd2] [nvarchar](50) NULL,
	[zip_cd2] [nvarchar](50) NULL,
	[npi_nbr] [nvarchar](50) NULL,
	[SPECIALTY_CTG_CD] [nvarchar](50) NULL,
	[org_id] [nvarchar](50) NULL,
	[first_vst_dt] [datetime2](7) NULL,
	[last_vst_dt] [datetime2](7) NULL,
	[visit_nbr] [nvarchar](50) NULL,
	[tax_id_nbr2] [nvarchar](50) NULL,
	[attr_prvdr_id] [int] NULL,
	[print_nm2] [nvarchar](50) NULL,
	[address_line_1_txt3] [nvarchar](50) NULL,
	[address_line_2_txt3] [nvarchar](50) NULL,
	[city_nm3] [nvarchar](50) NULL,
	[state_postal_cd3] [nvarchar](50) NULL,
	[zip_cd3] [nvarchar](50) NULL,
	[npi_nbr2] [nvarchar](50) NULL,
	[SPECIALTY_CTG_CD2] [nvarchar](50) NULL,
	[STATUS_IND] [nvarchar](50) NULL,
	[eff_dt] [datetime2](7) NULL,
	[cncl_dt] [datetime2](7) NULL,
	[SRC_CUMB_ID] [int] NULL,
	[SRC_CUMB_ID2] [int] NULL,
	[middle_nm] [nvarchar](50) NULL,
	[individual_id] [float] NULL,
	[pulse_fsi_score] [float] NULL,
	[ERG_Prospective_Score] [float] NULL,
	[ERG_Retro_Score] [float] NULL,
	[product_ln_cd2] [nvarchar](50) NULL,
	[aetna_card_number] [nvarchar](50) NULL,
	[grp_cntl_name] [nvarchar](50) NULL,
	[currect_record_indicator] [nvarchar](50) NULL,
	[cumb_id_seq_no] [nvarchar](50) NULL,
	[filler] [nvarchar](50) NULL,
	[derived] [nvarchar](50) NULL,
	[attprv_USE_SOURCE] [nvarchar](50) NULL,
	[ia_fncl_risk_cd] [nvarchar](50) NULL,
	[ORG_ID2] [nvarchar](50) NULL,
	[PLAN_ID] [nvarchar](50) NULL,
	[EOF] [nvarchar](50) NULL,
 CONSTRAINT [PK_MemberEligibility] PRIMARY KEY CLUSTERED 
(
	[member_id] ASC,
	[eff_mm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


