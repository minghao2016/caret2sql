-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_cforest_pca
-- Dataset : freidman3
-- Database : mssql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH [ADS_sca_1_OUT] AS 
(SELECT [ADS].[KEY] AS [KEY], (CAST([ADS].[Feature_0] AS FLOAT(53)) - 43.791281222074) / 26.1998878150635 AS [Feature_0], (CAST([ADS].[Feature_1] AS FLOAT(53)) - 945.96728330844) / 464.3666952541536 AS [Feature_1], (CAST([ADS].[Feature_2] AS FLOAT(53)) - 0.5310009099975209) / 0.2920171749459157 AS [Feature_2], (CAST([ADS].[Feature_3] AS FLOAT(53)) - 6.139967152050498) / 3.0923049253819994 AS [Feature_3] 
FROM freidman3 AS [ADS]), 
[ADS_pre_1_OUT] AS 
(SELECT [ADS_sca_1_OUT].[KEY] AS [KEY], [ADS_sca_1_OUT].[Feature_0] * -0.6121650749100701 + [ADS_sca_1_OUT].[Feature_1] * 0.5464782903329433 + [ADS_sca_1_OUT].[Feature_2] * -0.5708677485644764 + [ADS_sca_1_OUT].[Feature_3] * -0.02693349038014348 AS [PC1], [ADS_sca_1_OUT].[Feature_0] * 0.4888813380420076 + [ADS_sca_1_OUT].[Feature_1] * 0.2745192584561386 + [ADS_sca_1_OUT].[Feature_2] * -0.2238449995359107 + [ADS_sca_1_OUT].[Feature_3] * -0.7971998684355868 AS [PC2], [ADS_sca_1_OUT].[Feature_0] * -0.024686176636208892 + [ADS_sca_1_OUT].[Feature_1] * 0.7091918576518509 + [ADS_sca_1_OUT].[Feature_2] * 0.7038817472089458 + [ADS_sca_1_OUT].[Feature_3] * 0.03143227114740615 AS [PC3], [ADS_sca_1_OUT].[Feature_0] * -0.6209988333786876 + [ADS_sca_1_OUT].[Feature_1] * -0.3507813620644518 + [ADS_sca_1_OUT].[Feature_2] * 0.358544161544677 + [ADS_sca_1_OUT].[Feature_3] * -0.6022947527521242 AS [PC4] 
FROM [ADS_sca_1_OUT]), 
[DT_node_lookup] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.04914527307154967) THEN 4 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.6966888425460029) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 1.2118079473155148) THEN 8 ELSE 9 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 0.850166109080956 AS [E] UNION ALL SELECT 4 AS nid, 1.3071387691864098 AS [E] UNION ALL SELECT 6 AS nid, 1.4819156875798898 AS [E] UNION ALL SELECT 8 AS nid, 1.5396796939481598 AS [E] UNION ALL SELECT 9 AS nid, 1.4997803032739698 AS [E]) AS [Values]), 
[DT_Output] AS 
(SELECT [DT_node_lookup].[KEY] AS [KEY], [DT_node_lookup].node_id_2 AS node_id_2, [DT_node_data].nid AS nid, [DT_node_data].[E] AS [E] 
FROM [DT_node_lookup] LEFT OUTER JOIN [DT_node_data] ON [DT_node_lookup].node_id_2 = [DT_node_data].nid), 
[RF_Model_0] AS 
(SELECT [DT_Output].[KEY] AS [KEY], [DT_Output].[E] AS [Estimator] 
FROM [DT_Output]), 
[DT_node_lookup_1] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.3179982762840941) THEN 3 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.8759767311956839) THEN 5 ELSE 6 END END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.7496001067378723) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.8878041367227291) THEN CASE WHEN ([ADS_pre_1_OUT].[PC1] <= 0.6258005673894007) THEN 11 ELSE 12 END ELSE 13 END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_1] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 1.2347604140056 AS [E] UNION ALL SELECT 5 AS nid, 0.8896860196326801 AS [E] UNION ALL SELECT 6 AS nid, 1.07137370205113 AS [E] UNION ALL SELECT 8 AS nid, 1.4655354262992701 AS [E] UNION ALL SELECT 11 AS nid, 1.530728777959 AS [E] UNION ALL SELECT 12 AS nid, 1.5527499386210701 AS [E] UNION ALL SELECT 13 AS nid, 1.50502450100122 AS [E]) AS [Values]), 
[DT_Output_1] AS 
(SELECT [DT_node_lookup_1].[KEY] AS [KEY], [DT_node_lookup_1].node_id_2 AS node_id_2, [DT_node_data_1].nid AS nid, [DT_node_data_1].[E] AS [E] 
FROM [DT_node_lookup_1] LEFT OUTER JOIN [DT_node_data_1] ON [DT_node_lookup_1].node_id_2 = [DT_node_data_1].nid), 
[RF_Model_1] AS 
(SELECT [DT_Output_1].[KEY] AS [KEY], [DT_Output_1].[E] AS [Estimator] 
FROM [DT_Output_1]), 
[DT_node_lookup_2] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN CASE WHEN ([ADS_pre_1_OUT].[PC4] <= 0.6214167578081402) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9835030503934242) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.6966888425460029) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -0.5916102825604064) THEN 10 ELSE 11 END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_2] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 4 AS nid, 1.052372116843 AS [E] UNION ALL SELECT 5 AS nid, 1.2335284494900902 AS [E] UNION ALL SELECT 6 AS nid, 1.48977650805845 AS [E] UNION ALL SELECT 8 AS nid, 1.4863175647351299 AS [E] UNION ALL SELECT 10 AS nid, 1.55378969398487 AS [E] UNION ALL SELECT 11 AS nid, 1.51651441826911 AS [E]) AS [Values]), 
[DT_Output_2] AS 
(SELECT [DT_node_lookup_2].[KEY] AS [KEY], [DT_node_lookup_2].node_id_2 AS node_id_2, [DT_node_data_2].nid AS nid, [DT_node_data_2].[E] AS [E] 
FROM [DT_node_lookup_2] LEFT OUTER JOIN [DT_node_data_2] ON [DT_node_lookup_2].node_id_2 = [DT_node_data_2].nid), 
[RF_Model_2] AS 
(SELECT [DT_Output_2].[KEY] AS [KEY], [DT_Output_2].[E] AS [Estimator] 
FROM [DT_Output_2]), 
[DT_node_lookup_3] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.5349749183719671) THEN 4 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.6983592526662658) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.141645726468392) THEN CASE WHEN ([ADS_pre_1_OUT].[PC4] <= 0.5774332864075866) THEN CASE WHEN ([ADS_pre_1_OUT].[PC1] <= 0.139952131658049) THEN 10 ELSE 11 END ELSE 12 END ELSE 13 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_3] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 1.0407199840424899 AS [E] UNION ALL SELECT 4 AS nid, 1.3508500503646101 AS [E] UNION ALL SELECT 6 AS nid, 1.48005969277365 AS [E] UNION ALL SELECT 10 AS nid, 1.51029632122892 AS [E] UNION ALL SELECT 11 AS nid, 1.5454290492154499 AS [E] UNION ALL SELECT 12 AS nid, 1.56757937712192 AS [E] UNION ALL SELECT 13 AS nid, 1.4992444219678602 AS [E]) AS [Values]), 
[DT_Output_3] AS 
(SELECT [DT_node_lookup_3].[KEY] AS [KEY], [DT_node_lookup_3].node_id_2 AS node_id_2, [DT_node_data_3].nid AS nid, [DT_node_data_3].[E] AS [E] 
FROM [DT_node_lookup_3] LEFT OUTER JOIN [DT_node_data_3] ON [DT_node_lookup_3].node_id_2 = [DT_node_data_3].nid), 
[RF_Model_3] AS 
(SELECT [DT_Output_3].[KEY] AS [KEY], [DT_Output_3].[E] AS [Estimator] 
FROM [DT_Output_3]), 
[DT_node_lookup_4] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.3875850946987654) THEN 4 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.1187852408008718) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.7056575385634075) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -0.2924213701734156) THEN 10 ELSE 11 END END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_4] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 0.9437254950244058 AS [E] UNION ALL SELECT 4 AS nid, 1.3008107542123701 AS [E] UNION ALL SELECT 6 AS nid, 1.43512100463431 AS [E] UNION ALL SELECT 8 AS nid, 1.4864218653888202 AS [E] UNION ALL SELECT 10 AS nid, 1.5568419105615 AS [E] UNION ALL SELECT 11 AS nid, 1.5251879733640599 AS [E]) AS [Values]), 
[DT_Output_4] AS 
(SELECT [DT_node_lookup_4].[KEY] AS [KEY], [DT_node_lookup_4].node_id_2 AS node_id_2, [DT_node_data_4].nid AS nid, [DT_node_data_4].[E] AS [E] 
FROM [DT_node_lookup_4] LEFT OUTER JOIN [DT_node_data_4] ON [DT_node_lookup_4].node_id_2 = [DT_node_data_4].nid), 
[RF_Model_4] AS 
(SELECT [DT_Output_4].[KEY] AS [KEY], [DT_Output_4].[E] AS [Estimator] 
FROM [DT_Output_4]), 
[DT_node_lookup_5] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.8096647858339127) THEN 3 ELSE 4 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.04914527307154967) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.1445487949292941) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -1.206893386167902) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_5] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 0.622995443020569 AS [E] UNION ALL SELECT 4 AS nid, 0.998282945744585 AS [E] UNION ALL SELECT 6 AS nid, 1.2940808360720801 AS [E] UNION ALL SELECT 8 AS nid, 1.49405013767988 AS [E] UNION ALL SELECT 10 AS nid, 1.56109860789068 AS [E] UNION ALL SELECT 11 AS nid, 1.5236497041266999 AS [E]) AS [Values]), 
[DT_Output_5] AS 
(SELECT [DT_node_lookup_5].[KEY] AS [KEY], [DT_node_lookup_5].node_id_2 AS node_id_2, [DT_node_data_5].nid AS nid, [DT_node_data_5].[E] AS [E] 
FROM [DT_node_lookup_5] LEFT OUTER JOIN [DT_node_data_5] ON [DT_node_lookup_5].node_id_2 = [DT_node_data_5].nid), 
[RF_Model_5] AS 
(SELECT [DT_Output_5].[KEY] AS [KEY], [DT_Output_5].[E] AS [Estimator] 
FROM [DT_Output_5]), 
[DT_node_lookup_6] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.3179982762840941) THEN CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.3356075229970326) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.8032774933467393) THEN CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.7496001067378723) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_6] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 4 AS nid, 1.2421662434171499 AS [E] UNION ALL SELECT 5 AS nid, 1.42109751620964 AS [E] UNION ALL SELECT 6 AS nid, 1.1211456358852099 AS [E] UNION ALL SELECT 9 AS nid, 1.45913094786802 AS [E] UNION ALL SELECT 10 AS nid, 1.51456034713751 AS [E] UNION ALL SELECT 11 AS nid, 1.53775221154246 AS [E]) AS [Values]), 
[DT_Output_6] AS 
(SELECT [DT_node_lookup_6].[KEY] AS [KEY], [DT_node_lookup_6].node_id_2 AS node_id_2, [DT_node_data_6].nid AS nid, [DT_node_data_6].[E] AS [E] 
FROM [DT_node_lookup_6] LEFT OUTER JOIN [DT_node_data_6] ON [DT_node_lookup_6].node_id_2 = [DT_node_data_6].nid), 
[RF_Model_6] AS 
(SELECT [DT_Output_6].[KEY] AS [KEY], [DT_Output_6].[E] AS [Estimator] 
FROM [DT_Output_6]), 
[DT_node_lookup_7] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.5694634837464194) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN 3 ELSE 4 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= 1.2832915849738291) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.3124321723756805) THEN 7 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.3085121074380821) THEN 9 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.8878041367227291) THEN 11 ELSE 12 END END END ELSE 13 END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_7] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 0.9660243292847979 AS [E] UNION ALL SELECT 4 AS nid, 1.2247087944238702 AS [E] UNION ALL SELECT 7 AS nid, 1.36507580987132 AS [E] UNION ALL SELECT 9 AS nid, 1.4905050320369597 AS [E] UNION ALL SELECT 11 AS nid, 1.53836914545851 AS [E] UNION ALL SELECT 12 AS nid, 1.5013820559612099 AS [E] UNION ALL SELECT 13 AS nid, 1.26281154215337 AS [E]) AS [Values]), 
[DT_Output_7] AS 
(SELECT [DT_node_lookup_7].[KEY] AS [KEY], [DT_node_lookup_7].node_id_2 AS node_id_2, [DT_node_data_7].nid AS nid, [DT_node_data_7].[E] AS [E] 
FROM [DT_node_lookup_7] LEFT OUTER JOIN [DT_node_data_7] ON [DT_node_lookup_7].node_id_2 = [DT_node_data_7].nid), 
[RF_Model_7] AS 
(SELECT [DT_Output_7].[KEY] AS [KEY], [DT_Output_7].[E] AS [Estimator] 
FROM [DT_Output_7]), 
[DT_node_lookup_8] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.5694634837464194) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.634790259536411) THEN 4 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= 0.5339432996782075) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.1948235952537968) THEN 7 ELSE 8 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= 0.5100245665152647) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_8] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 1.15396261007607 AS [E] UNION ALL SELECT 4 AS nid, 1.45723451437731 AS [E] UNION ALL SELECT 7 AS nid, 1.4717754357850599 AS [E] UNION ALL SELECT 8 AS nid, 1.52025582416881 AS [E] UNION ALL SELECT 10 AS nid, 1.53314253625976 AS [E] UNION ALL SELECT 11 AS nid, 1.55242933531158 AS [E]) AS [Values]), 
[DT_Output_8] AS 
(SELECT [DT_node_lookup_8].[KEY] AS [KEY], [DT_node_lookup_8].node_id_2 AS node_id_2, [DT_node_data_8].nid AS nid, [DT_node_data_8].[E] AS [E] 
FROM [DT_node_lookup_8] LEFT OUTER JOIN [DT_node_data_8] ON [DT_node_lookup_8].node_id_2 = [DT_node_data_8].nid), 
[RF_Model_8] AS 
(SELECT [DT_Output_8].[KEY] AS [KEY], [DT_Output_8].[E] AS [Estimator] 
FROM [DT_Output_8]), 
[DT_node_lookup_9] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.2176155927053723) THEN 3 ELSE 4 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.8032774933467393) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.06496908262822981) THEN 8 ELSE 9 END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_9] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 1.3986792325867399 AS [E] UNION ALL SELECT 4 AS nid, 1.04582739407638 AS [E] UNION ALL SELECT 6 AS nid, 1.48663138413419 AS [E] UNION ALL SELECT 8 AS nid, 1.5160253192012398 AS [E] UNION ALL SELECT 9 AS nid, 1.54569546176202 AS [E]) AS [Values]), 
[DT_Output_9] AS 
(SELECT [DT_node_lookup_9].[KEY] AS [KEY], [DT_node_lookup_9].node_id_2 AS node_id_2, [DT_node_data_9].nid AS nid, [DT_node_data_9].[E] AS [E] 
FROM [DT_node_lookup_9] LEFT OUTER JOIN [DT_node_data_9] ON [DT_node_lookup_9].node_id_2 = [DT_node_data_9].nid), 
[RF_Model_9] AS 
(SELECT [DT_Output_9].[KEY] AS [KEY], [DT_Output_9].[E] AS [Estimator] 
FROM [DT_Output_9]), 
[RF_0] AS 
(SELECT [RF_esu_0].[KEY] AS [KEY], [RF_esu_0].[Estimator] AS [Estimator] 
FROM (SELECT [RF_Model_0].[KEY] AS [KEY], CAST([RF_Model_0].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_0] UNION ALL SELECT [RF_Model_1].[KEY] AS [KEY], CAST([RF_Model_1].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_1] UNION ALL SELECT [RF_Model_2].[KEY] AS [KEY], CAST([RF_Model_2].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_2] UNION ALL SELECT [RF_Model_3].[KEY] AS [KEY], CAST([RF_Model_3].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_3] UNION ALL SELECT [RF_Model_4].[KEY] AS [KEY], CAST([RF_Model_4].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_4] UNION ALL SELECT [RF_Model_5].[KEY] AS [KEY], CAST([RF_Model_5].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_5] UNION ALL SELECT [RF_Model_6].[KEY] AS [KEY], CAST([RF_Model_6].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_6] UNION ALL SELECT [RF_Model_7].[KEY] AS [KEY], CAST([RF_Model_7].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_7] UNION ALL SELECT [RF_Model_8].[KEY] AS [KEY], CAST([RF_Model_8].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_8] UNION ALL SELECT [RF_Model_9].[KEY] AS [KEY], CAST([RF_Model_9].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_9]) AS [RF_esu_0]), 
[DT_node_lookup_10] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.3875850946987654) THEN CASE WHEN ([ADS_pre_1_OUT].[PC4] <= 0.3879745593393281) THEN 3 ELSE 4 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.01287835304044174) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.5123003045559037) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -1.168990901235069) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_10] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 1.0488831547492399 AS [E] UNION ALL SELECT 4 AS nid, 1.4381187605066899 AS [E] UNION ALL SELECT 6 AS nid, 1.43993632442871 AS [E] UNION ALL SELECT 8 AS nid, 1.4899800162889498 AS [E] UNION ALL SELECT 10 AS nid, 1.54969679072153 AS [E] UNION ALL SELECT 11 AS nid, 1.52643886891923 AS [E]) AS [Values]), 
[DT_Output_10] AS 
(SELECT [DT_node_lookup_10].[KEY] AS [KEY], [DT_node_lookup_10].node_id_2 AS node_id_2, [DT_node_data_10].nid AS nid, [DT_node_data_10].[E] AS [E] 
FROM [DT_node_lookup_10] LEFT OUTER JOIN [DT_node_data_10] ON [DT_node_lookup_10].node_id_2 = [DT_node_data_10].nid), 
[RF_Model_10] AS 
(SELECT [DT_Output_10].[KEY] AS [KEY], [DT_Output_10].[E] AS [Estimator] 
FROM [DT_Output_10]), 
[DT_node_lookup_11] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -1.2731433424330159) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.04914527307154967) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -0.7880664033078996) THEN 5 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.2036318869812162) THEN 7 ELSE 8 END END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.7056575385634075) THEN 10 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.5916239302123774) THEN CASE WHEN ([ADS_pre_1_OUT].[PC1] <= 0.6258005673894007) THEN 13 ELSE 14 END ELSE 15 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_11] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 0.7767134795910491 AS [E] UNION ALL SELECT 5 AS nid, 1.4843042704510803 AS [E] UNION ALL SELECT 7 AS nid, 1.30830194271694 AS [E] UNION ALL SELECT 8 AS nid, 1.27452117694746 AS [E] UNION ALL SELECT 10 AS nid, 1.48861114955589 AS [E] UNION ALL SELECT 13 AS nid, 1.53324320150621 AS [E] UNION ALL SELECT 14 AS nid, 1.5561439621468702 AS [E] UNION ALL SELECT 15 AS nid, 1.5071609476623502 AS [E]) AS [Values]), 
[DT_Output_11] AS 
(SELECT [DT_node_lookup_11].[KEY] AS [KEY], [DT_node_lookup_11].node_id_2 AS node_id_2, [DT_node_data_11].nid AS nid, [DT_node_data_11].[E] AS [E] 
FROM [DT_node_lookup_11] LEFT OUTER JOIN [DT_node_data_11] ON [DT_node_lookup_11].node_id_2 = [DT_node_data_11].nid), 
[RF_Model_11] AS 
(SELECT [DT_Output_11].[KEY] AS [KEY], [DT_Output_11].[E] AS [Estimator] 
FROM [DT_Output_11]), 
[DT_node_lookup_12] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -1.305409774630164) THEN 5 ELSE 6 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.6966888425460029) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -1.206893386167902) THEN 10 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= 0.042590349195509865) THEN 12 ELSE 13 END END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_12] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 0.9508253597935971 AS [E] UNION ALL SELECT 5 AS nid, 1.4824944751473799 AS [E] UNION ALL SELECT 6 AS nid, 1.20416997834126 AS [E] UNION ALL SELECT 8 AS nid, 1.48444035521038 AS [E] UNION ALL SELECT 10 AS nid, 1.5555477524004497 AS [E] UNION ALL SELECT 12 AS nid, 1.5088426671457902 AS [E] UNION ALL SELECT 13 AS nid, 1.5352513889431298 AS [E]) AS [Values]), 
[DT_Output_12] AS 
(SELECT [DT_node_lookup_12].[KEY] AS [KEY], [DT_node_lookup_12].node_id_2 AS node_id_2, [DT_node_data_12].nid AS nid, [DT_node_data_12].[E] AS [E] 
FROM [DT_node_lookup_12] LEFT OUTER JOIN [DT_node_data_12] ON [DT_node_lookup_12].node_id_2 = [DT_node_data_12].nid), 
[RF_Model_12] AS 
(SELECT [DT_Output_12].[KEY] AS [KEY], [DT_Output_12].[E] AS [Estimator] 
FROM [DT_Output_12]), 
[DT_node_lookup_13] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.3875850946987654) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -1.60354027583579) THEN 3 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.4546740492053614) THEN 5 ELSE 6 END END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.04914527307154967) THEN 8 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.634790259536411) THEN 10 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -0.5780709278113754) THEN 12 ELSE 13 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_13] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 0.9158601456022081 AS [E] UNION ALL SELECT 5 AS nid, 1.1644724574573102 AS [E] UNION ALL SELECT 6 AS nid, 1.3693119615119902 AS [E] UNION ALL SELECT 8 AS nid, 1.38784761316951 AS [E] UNION ALL SELECT 10 AS nid, 1.4891672841084498 AS [E] UNION ALL SELECT 12 AS nid, 1.5537051389188998 AS [E] UNION ALL SELECT 13 AS nid, 1.52025673670347 AS [E]) AS [Values]), 
[DT_Output_13] AS 
(SELECT [DT_node_lookup_13].[KEY] AS [KEY], [DT_node_lookup_13].node_id_2 AS node_id_2, [DT_node_data_13].nid AS nid, [DT_node_data_13].[E] AS [E] 
FROM [DT_node_lookup_13] LEFT OUTER JOIN [DT_node_data_13] ON [DT_node_lookup_13].node_id_2 = [DT_node_data_13].nid), 
[RF_Model_13] AS 
(SELECT [DT_Output_13].[KEY] AS [KEY], [DT_Output_13].[E] AS [Estimator] 
FROM [DT_Output_13]), 
[DT_node_lookup_14] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.3875850946987654) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -0.3718529754002737) THEN 3 ELSE 4 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN 6 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= 0.1976315938317973) THEN CASE WHEN ([ADS_pre_1_OUT].[PC3] <= 0.8032774933467393) THEN 9 ELSE 10 END ELSE 11 END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_14] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 3 AS nid, 1.45735713544152 AS [E] UNION ALL SELECT 4 AS nid, 1.04710322002294 AS [E] UNION ALL SELECT 6 AS nid, 1.3510780863551501 AS [E] UNION ALL SELECT 9 AS nid, 1.48378227830778 AS [E] UNION ALL SELECT 10 AS nid, 1.5222400568377 AS [E] UNION ALL SELECT 11 AS nid, 1.5436408465426499 AS [E]) AS [Values]), 
[DT_Output_14] AS 
(SELECT [DT_node_lookup_14].[KEY] AS [KEY], [DT_node_lookup_14].node_id_2 AS node_id_2, [DT_node_data_14].nid AS nid, [DT_node_data_14].[E] AS [E] 
FROM [DT_node_lookup_14] LEFT OUTER JOIN [DT_node_data_14] ON [DT_node_lookup_14].node_id_2 = [DT_node_data_14].nid), 
[RF_Model_14] AS 
(SELECT [DT_Output_14].[KEY] AS [KEY], [DT_Output_14].[E] AS [Estimator] 
FROM [DT_Output_14]), 
[DT_node_lookup_15] AS 
(SELECT [ADS_pre_1_OUT].[KEY] AS [KEY], CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.9050943131641498) THEN 2 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC3] <= -0.07113443775739135) THEN CASE WHEN ([ADS_pre_1_OUT].[PC2] <= 0.6171268738572349) THEN CASE WHEN ([ADS_pre_1_OUT].[PC1] <= -0.3461272993532923) THEN 6 ELSE 7 END ELSE 8 END ELSE CASE WHEN ([ADS_pre_1_OUT].[PC4] <= -0.634790259536411) THEN 10 ELSE CASE WHEN ([ADS_pre_1_OUT].[PC2] <= -0.2924213701734156) THEN 12 ELSE 13 END END END END AS node_id_2 
FROM [ADS_pre_1_OUT]), 
[DT_node_data_15] AS 
(SELECT [Values].nid AS nid, [Values].[E] AS [E] 
FROM (SELECT 2 AS nid, 0.971325069199188 AS [E] UNION ALL SELECT 6 AS nid, 1.31790483386524 AS [E] UNION ALL SELECT 7 AS nid, 1.45639569256423 AS [E] UNION ALL SELECT 8 AS nid, 1.2074781600214 AS [E] UNION ALL SELECT 10 AS nid, 1.48251116298168 AS [E] UNION ALL SELECT 12 AS nid, 1.5438115791882399 AS [E] UNION ALL SELECT 13 AS nid, 1.51048046132656 AS [E]) AS [Values]), 
[DT_Output_15] AS 
(SELECT [DT_node_lookup_15].[KEY] AS [KEY], [DT_node_lookup_15].node_id_2 AS node_id_2, [DT_node_data_15].nid AS nid, [DT_node_data_15].[E] AS [E] 
FROM [DT_node_lookup_15] LEFT OUTER JOIN [DT_node_data_15] ON [DT_node_lookup_15].node_id_2 = [DT_node_data_15].nid), 
[RF_Model_15] AS 
(SELECT [DT_Output_15].[KEY] AS [KEY], [DT_Output_15].[E] AS [Estimator] 
FROM [DT_Output_15]), 
[RF_1] AS 
(SELECT [RF_esu_1].[KEY] AS [KEY], [RF_esu_1].[Estimator] AS [Estimator] 
FROM (SELECT [RF_Model_10].[KEY] AS [KEY], CAST([RF_Model_10].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_10] UNION ALL SELECT [RF_Model_11].[KEY] AS [KEY], CAST([RF_Model_11].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_11] UNION ALL SELECT [RF_Model_12].[KEY] AS [KEY], CAST([RF_Model_12].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_12] UNION ALL SELECT [RF_Model_13].[KEY] AS [KEY], CAST([RF_Model_13].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_13] UNION ALL SELECT [RF_Model_14].[KEY] AS [KEY], CAST([RF_Model_14].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_14] UNION ALL SELECT [RF_Model_15].[KEY] AS [KEY], CAST([RF_Model_15].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_Model_15]) AS [RF_esu_1]), 
[RF] AS 
(SELECT [RFbig_esu].[KEY] AS [KEY], [RFbig_esu].[Estimator] AS [Estimator] 
FROM (SELECT [RF_0].[KEY] AS [KEY], CAST([RF_0].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_0] UNION ALL SELECT [RF_1].[KEY] AS [KEY], CAST([RF_1].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM [RF_1]) AS [RFbig_esu]), 
[RF_avg] AS 
(SELECT [T].[KEY] AS [KEY], CAST([T].[Estimator] AS FLOAT(53)) AS [Estimator] 
FROM (SELECT [RF].[KEY] AS [KEY], avg(CAST([RF].[Estimator] AS FLOAT(53))) AS [Estimator] 
FROM [RF] GROUP BY [RF].[KEY]) AS [T])
 SELECT [RF_avg].[KEY] AS [KEY], [RF_avg].[Estimator] AS [Estimator] 
FROM [RF_avg]