SELECT  *
FROM [AetnaClaims_DEV].[fact].[MemberClaims] 

--where member_id = '00000029675964105825'

where print_nm_PCP = 'Catherine E. Cavanaugh'




SELECT src_subscriber_id, srv_prvdr_id, srv_prvdr_npi,  print_nm_SERVICE, address_line_1_txt, address_line_2_txt, city_nm, zip_cd, state_postal_cd, provider_type_cd, specialty_cd
FROM [AetnaClaims_DEV].[staging].[MemberClaims] 



                        