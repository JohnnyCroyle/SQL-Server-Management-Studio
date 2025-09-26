



--SELECT  top 1000 PATIENT.PAT_MRN_ID, PAT_ENC.[PAT_ID], PAT_ENC.[PAT_ENC_CSN_ID], 
--  PATIENT_FYI_FLAGS.NOTE_ID, PATIENT_FYI_FLAGS.PAT_FLAG_TYPE_C, 
--  --PATIENT_FYI_FLAGS.PAT_FLAG_EXP_DATE,
--   PATIENT_FYI_FLAGS.ACTIVE_C, ZC_ACTIVE.Name as ActiveFlag,
--  ZC_BPA_TRIGGER_FYI.NAME as TriggerName 
--       ,[ACCT_NOTE_INSTANT]
--      ,[LAST_UPDATE_INST]

--Select  TOP 1 pat.PAT_MRN_ID, flags.PAT_FLAG_TYPE_C, flags.ACCT_NOTE_INSTANT as FlagDate 
--FROM	[CLARITY].[dbo].[PATIENT] as pat with (nolock) 
--		INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS] as flags with (nolock) ON PAT_ID =  pat.PAT_ID
--WHERE  pat.PAT_MRN_ID = 'E954136'
--AND flags.PAT_FLAG_TYPE_C IN (2012,2027,2028) 
--AND ACTIVE_C = 1
--order by ROW_NUMBER() over (partition by PAT_ID order by flags.ACCT_NOTE_INSTANT desc) 


                Select  pat.PAT_ID, flags.PAT_FLAG_TYPE_C, flags.ACCT_NOTE_INSTANT as FlagDate 
                FROM	[CLARITY].[dbo].[PATIENT] as pat with (nolock) 
                        INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS] as flags with (nolock) ON PAT_ID =  pat.PAT_ID
                WHERE  flags.PAT_FLAG_TYPE_C IN (2012,2027,2028) 
                AND flags.ACTIVE_C = 1
				and PAT_ID = 'Z1001633'


                Select TOP 1   PAT_FLAG_TYPE_C, ACCT_NOTE_INSTANT as FlagDate, 'Retail' as test 
                FROM	[CLARITY].[dbo].[PATIENT] as pat with (nolock) 
                        INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS]  with (nolock) ON pat.PAT_ID = PAT_ID
                WHERE  PAT_FLAG_TYPE_C IN (2012,2027,2028) 
                AND ACTIVE_C = 1
                AND ACCT_NOTE_INSTANT IS NOT NULL
                ORDER BY ROW_NUMBER() over (partition by pat.PAT_ID order by ACCT_NOTE_INSTANT desc) 





SELECT 
    PAT_ID, 
    PAT_FLAG_TYPE_C, 
    ACCT_NOTE_INSTANT AS FlagDate,
    CASE 
        WHEN PAT_FLAG_TYPE_C = 2028 THEN 'Retail Pharmacy'
        WHEN PAT_FLAG_TYPE_C IN (2012, 2025) THEN 'Specialty Pharmacy'
        ELSE NULL
    END AS test
FROM (
    SELECT 
        PAT_ID,
        PAT_FLAG_TYPE_C,
        ACCT_NOTE_INSTANT,
        ROW_NUMBER() OVER (PARTITION BY pat.PAT_ID ORDER BY ACCT_NOTE_INSTANT DESC) AS rn
    FROM [CLARITY].[dbo].[PATIENT] AS pat WITH (NOLOCK)
    INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS] as flags with (nolock) ON PAT_ID =  pat.PAT_ID
	INNER JOIN [CLARITY].[dbo].[ZC_ACTIVE] ZC_ACTIVE with (nolock)  on flags.ACTIVE_C =  ZC_ACTIVE.ACTIVE_C
    WHERE PAT_FLAG_TYPE_C IN (2012,2027,2028) 
    AND ZC_ACTIVE.ACTIVE_C = 1
) t
WHERE rn = 1

and  PAT_ID in('Z1149140','Z4317434','Z425772','Z170584','Z396481','Z3572415','Z529245','Z756187','Z4220250')



--Select   PAT_MRN_ID, PAT_FLAG_TYPE_C, MAX(ACCT_NOTE_INSTANT) as FlagDate

--  FROM [CLARITY].[dbo].[PATIENT_FYI_FLAGS] with (nolock)
--  INNER JOIN [CLARITY].[dbo].[PATIENT] PATIENT with (nolock) ON PAT_ID =  PATIENT.PAT_ID

--  --INNER JOIN [CLARITY].[dbo].[PATIENT_FYI_FLAGS] PATIENT_FYI_FLAGS with (nolock)  On PAT_ENC.PAT_ID = PATIENT_FYI_FLAGS.PATIENT_ID AND PAT_ENC.PAT_ENC_CSN_ID = PATIENT_FYI_FLAGS.PAT_ENC_CSN_ID
--  --INNER JOIN [CLARITY].[dbo].[ZC_ACTIVE] ZC_ACTIVE with (nolock)   on PATIENT_FYI_FLAGS.ACTIVE_C =  ZC_ACTIVE.ACTIVE_C
--AND PAT_FLAG_TYPE_C IN (2012,2027,2028) and PAT_MRN_ID = 'E954136'
--AND ACTIVE_C = 1
--GROUP BY PAT_MRN_ID, PAT_FLAG_TYPE_C, ACCT_NOTE_INSTANT


  --Where ZC_BPA_TRIGGER_FYI.INTERNAL_ID IN (Select INTERNAL_ID from [CLARITY].[dbo].[ZC_BPA_TRIGGER_FYI] Where Name like '%Pharm%')

--PatientEpicId

--Select * from [CLARITY].[dbo].[ZC_BPA_TRIGGER_FYI] Where Name like '%Pharm%'

--Select * from [CLARITY].[dbo].[PATIENT_FYI_FLAGS] Where PAT_FLAG_TYPE_C IN (2012,2025,2026,2027)

--2026 = retail
--2012,2025,2027 = special
