

SELECT top 1 with ties
	pat.PAT_MRN_ID,
	flags.PAT_FLAG_TYPE_C,
	flags.ACCT_NOTE_INSTANT,
	CASE 
	WHEN PAT_FLAG_TYPE_C = 2028 THEN 'Home Delivery'
	WHEN PAT_FLAG_TYPE_C IN (2012, 2027) THEN 'Specialty Pharmacy'
ELSE NULL
END AS PharmacyType
FROM [CLARITY].[dbo].[PATIENT] AS pat WITH (NOLOCK)
INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS] as flags with (nolock) ON PATIENT_ID =  pat.PAT_ID 
WHERE PAT_FLAG_TYPE_C IN (2012,2027,2028)
	  AND ACTIVE_C = 1
         --       PAT_ID in('Z470067')
	  AND PAT_MRN_ID IN ('E1063283') --this will join to patient records CTE

order by  ROW_NUMBER() over (partition by pat.PAT_ID   order by ACCT_NOTE_INSTANT  desc)





--WHEN PATIENT_FYI_FLAGS.PAT_FLAG_TYPE_C = 2028 THEN 'Home Delivery'
--WHEN PATIENT_FYI_FLAGS.PAT_FLAG_TYPE_C IN (2012, 2027) THEN 'Specialty Pharmacy' else 'Retail Pharmacy'





--ACTIVE_FROM_DT	
--HNO
--900
--DATETIME	No	No	No	No	Exported	
--The date on which the note becomes active.
--84	ACTIVE_TO_DT




--Select top (1000) * from  [CLARITY].[dbo].[PATIENT_FYI_FLAGS] where PATIENT_ID = 'Z3571402' and ACTIVE_C = 1

----E187699
----E2181699


--Select * FROM [CLARITY].[dbo].[PATIENT] where PAT_MRN_ID = 'E3570720'