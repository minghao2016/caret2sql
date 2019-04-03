-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_cforest_pca
-- Dataset : freidman1
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "RF_0" AS 
(WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 0.5629846484809589) / 0.2600015884118536 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 0.4560644242337592) / 0.2896884193099619 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.4711381748147476) / 0.3128833495879441 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 0.5339680200945178) / 0.2844030958277151 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - 0.478093626237387) / 0.2879458120111227 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - 0.5682849224172328) / 0.2995521696075025 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.4791437471428049) / 0.2752572650336402 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.4594152477223208) / 0.2890235713417702 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - 0.4901106996809652) / 0.2808092486405501 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - 0.5378806933707535) / 0.297685615548656 AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.01078044206398687 + "ADS_sca_1_OUT"."Feature_1" * 0.20275672425035265 + "ADS_sca_1_OUT"."Feature_2" * -0.3032095959115069 + "ADS_sca_1_OUT"."Feature_3" * 0.28036946451509137 + "ADS_sca_1_OUT"."Feature_4" * -0.456472170133784 + "ADS_sca_1_OUT"."Feature_5" * 0.36405052299186 + "ADS_sca_1_OUT"."Feature_6" * -0.4779398415021841 + "ADS_sca_1_OUT"."Feature_7" * -0.2499537237134235 + "ADS_sca_1_OUT"."Feature_8" * -0.08553249751289721 + "ADS_sca_1_OUT"."Feature_9" * -0.38614972165398104 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * -0.2486501060343723 + "ADS_sca_1_OUT"."Feature_1" * 0.18538688464371286 + "ADS_sca_1_OUT"."Feature_2" * -0.2340911061275425 + "ADS_sca_1_OUT"."Feature_3" * -0.5312215967757172 + "ADS_sca_1_OUT"."Feature_4" * -0.034157117099708666 + "ADS_sca_1_OUT"."Feature_5" * -0.11403009160110295 + "ADS_sca_1_OUT"."Feature_6" * 0.03913846092020175 + "ADS_sca_1_OUT"."Feature_7" * -0.3193281863661248 + "ADS_sca_1_OUT"."Feature_8" * 0.6497321497824414 + "ADS_sca_1_OUT"."Feature_9" * -0.16427431415508242 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.529444486853135 + "ADS_sca_1_OUT"."Feature_1" * -0.042432305775754416 + "ADS_sca_1_OUT"."Feature_2" * -0.467456082445249 + "ADS_sca_1_OUT"."Feature_3" * -0.12113349070226218 + "ADS_sca_1_OUT"."Feature_4" * 0.3516615435966041 + "ADS_sca_1_OUT"."Feature_5" * 0.05456396920784263 + "ADS_sca_1_OUT"."Feature_6" * -0.0169721401066592 + "ADS_sca_1_OUT"."Feature_7" * 0.44796273797836184 + "ADS_sca_1_OUT"."Feature_8" * 0.09951231655089274 + "ADS_sca_1_OUT"."Feature_9" * -0.3836601176822301 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.18967062357660877 + "ADS_sca_1_OUT"."Feature_1" * -0.6739997429415825 + "ADS_sca_1_OUT"."Feature_2" * -0.05142756480300252 + "ADS_sca_1_OUT"."Feature_3" * -0.4240887569157897 + "ADS_sca_1_OUT"."Feature_4" * -0.1753617554170441 + "ADS_sca_1_OUT"."Feature_5" * -0.23730999119190946 + "ADS_sca_1_OUT"."Feature_6" * -0.3492917073303225 + "ADS_sca_1_OUT"."Feature_7" * -0.24015917199949824 + "ADS_sca_1_OUT"."Feature_8" * -0.24578721855897134 + "ADS_sca_1_OUT"."Feature_9" * 0.009647497508173676 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * 0.22360120393586685 + "ADS_sca_1_OUT"."Feature_1" * -0.27882706563202 + "ADS_sca_1_OUT"."Feature_2" * 0.3325159145316829 + "ADS_sca_1_OUT"."Feature_3" * 0.03231293124673378 + "ADS_sca_1_OUT"."Feature_4" * 0.31176328828301664 + "ADS_sca_1_OUT"."Feature_5" * 0.5846343873278481 + "ADS_sca_1_OUT"."Feature_6" * 0.2256344434749018 + "ADS_sca_1_OUT"."Feature_7" * -0.4544239404125063 + "ADS_sca_1_OUT"."Feature_8" * 0.13999262235747426 + "ADS_sca_1_OUT"."Feature_9" * -0.21128970950531886 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.3346351973554642 + "ADS_sca_1_OUT"."Feature_1" * 0.0673786411182812 + "ADS_sca_1_OUT"."Feature_2" * 0.2578168786971707 + "ADS_sca_1_OUT"."Feature_3" * 0.1264276445937259 + "ADS_sca_1_OUT"."Feature_4" * -0.40729831882959366 + "ADS_sca_1_OUT"."Feature_5" * -0.455689833219327 + "ADS_sca_1_OUT"."Feature_6" * 0.4311593109248494 + "ADS_sca_1_OUT"."Feature_7" * -0.10623939522740035 + "ADS_sca_1_OUT"."Feature_8" * 0.004192902519120928 + "ADS_sca_1_OUT"."Feature_9" * -0.4798729265184412 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.5345631681819778 + "ADS_sca_1_OUT"."Feature_1" * 0.2916209104051029 + "ADS_sca_1_OUT"."Feature_2" * 0.4273963159452305 + "ADS_sca_1_OUT"."Feature_3" * -0.2195301363042834 + "ADS_sca_1_OUT"."Feature_4" * -0.235065733216965 + "ADS_sca_1_OUT"."Feature_5" * 0.1295961010443568 + "ADS_sca_1_OUT"."Feature_6" * -0.3373404838354823 + "ADS_sca_1_OUT"."Feature_7" * 0.1550843553371763 + "ADS_sca_1_OUT"."Feature_8" * 0.2854751024551945 + "ADS_sca_1_OUT"."Feature_9" * 0.3270191591377724 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6214055026513039) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 0.6690503423579931) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 1.088549864217907) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.01380642472895866) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.1083127299108219) THEN 8 ELSE 9 END ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 19.504720790708102 AS "E" UNION ALL SELECT 4 AS nid, 22.662780816279 AS "E" UNION ALL SELECT 8 AS nid, 15.412236300288699 AS "E" UNION ALL SELECT 9 AS nid, 12.073968114960499 AS "E" UNION ALL SELECT 10 AS nid, 16.4270219926218 AS "E" UNION ALL SELECT 11 AS nid, 9.79868046768724 AS "E") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"RF_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6214055026513039) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.4993352834154655) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.7455192943022133) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.5826151517615283) THEN 7 ELSE 8 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.3288538389484016) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 18.7665559466849 AS "E" UNION ALL SELECT 4 AS nid, 22.3107617983661 AS "E" UNION ALL SELECT 7 AS nid, 12.9949502369678 AS "E" UNION ALL SELECT 8 AS nid, 8.350043480346411 AS "E" UNION ALL SELECT 10 AS nid, 16.9776413915331 AS "E" UNION ALL SELECT 11 AS nid, 12.8135541742246 AS "E") AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."E" AS "E" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"RF_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."E" AS "Estimator" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.8282422893166251) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -1.277124634890113) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.9006292674492278) THEN CASE WHEN ("ADS_pre_1_OUT"."PC7" <= -0.6525819263567906) THEN 7 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.1997755029549574) THEN CASE WHEN ("ADS_pre_1_OUT"."PC7" <= 0.1421452530696256) THEN 10 ELSE 11 END ELSE 12 END END ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 16.9751045507357 AS "E" UNION ALL SELECT 4 AS nid, 21.0217153483056 AS "E" UNION ALL SELECT 7 AS nid, 10.2942572378851 AS "E" UNION ALL SELECT 10 AS nid, 15.9033607767934 AS "E" UNION ALL SELECT 11 AS nid, 18.2243835476427 AS "E" UNION ALL SELECT 12 AS nid, 13.925954259453 AS "E" UNION ALL SELECT 13 AS nid, 9.47023330583278 AS "E") AS "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."E" AS "E" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"RF_Model_2" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", "DT_Output_2"."E" AS "Estimator" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.03663210944344049) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.8282422893166251) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC6" <= 0.2534204460512341) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 1.467874574619662) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1494830066207472) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 21.0707181031551 AS "E" UNION ALL SELECT 5 AS nid, 14.1427301110429 AS "E" UNION ALL SELECT 6 AS nid, 18.8773536422818 AS "E" UNION ALL SELECT 9 AS nid, 9.88833958237558 AS "E" UNION ALL SELECT 10 AS nid, 14.7511046253413 AS "E" UNION ALL SELECT 11 AS nid, 7.56680040998904 AS "E") AS "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."E" AS "E" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"RF_Model_3" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", "DT_Output_3"."E" AS "Estimator" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.3288538389484016) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6238630584336843) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -1.542057509285025) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC6" <= 0.2534204460512341) THEN 7 ELSE 8 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.8610667768277259) THEN 10 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.9156684310721452) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 21.653103437115696 AS "E" UNION ALL SELECT 5 AS nid, 18.727123906704897 AS "E" UNION ALL SELECT 7 AS nid, 14.4020250010883 AS "E" UNION ALL SELECT 8 AS nid, 19.5214883325197 AS "E" UNION ALL SELECT 10 AS nid, 13.3812632574864 AS "E" UNION ALL SELECT 12 AS nid, 10.385228037262 AS "E" UNION ALL SELECT 13 AS nid, 7.551433533069849 AS "E") AS "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."E" AS "E" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"RF_Model_4" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", "DT_Output_4"."E" AS "Estimator" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.3288538389484016) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -1.146561869458772) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC6" <= -0.1078284077801382) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.9006292674492278) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9444086925604888) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 20.434523385964198 AS "E" UNION ALL SELECT 5 AS nid, 14.3971639504971 AS "E" UNION ALL SELECT 6 AS nid, 18.0595256352343 AS "E" UNION ALL SELECT 9 AS nid, 10.5502770267107 AS "E" UNION ALL SELECT 10 AS nid, 16.0929187403779 AS "E" UNION ALL SELECT 11 AS nid, 10.49831516758 AS "E") AS "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."E" AS "E" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"RF_Model_5" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", "DT_Output_5"."E" AS "Estimator" 
FROM "DT_Output_5"), 
"DT_node_lookup_6" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.9253640784726516) THEN CASE WHEN ("ADS_pre_1_OUT"."PC6" <= 0.3040088150938559) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 0.2853378388375246) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.4395827967113186) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.8304260601783426) THEN 8 ELSE 9 END ELSE 10 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.3700114881749957) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_6" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 18.1849695955122 AS "E" UNION ALL SELECT 4 AS nid, 21.344672325119397 AS "E" UNION ALL SELECT 8 AS nid, 9.614750886336278 AS "E" UNION ALL SELECT 9 AS nid, 7.930159058248741 AS "E" UNION ALL SELECT 10 AS nid, 14.734785514153302 AS "E" UNION ALL SELECT 12 AS nid, 17.3017663822536 AS "E" UNION ALL SELECT 13 AS nid, 14.196612618276598 AS "E") AS "Values"), 
"DT_Output_6" AS 
(SELECT "DT_node_lookup_6"."KEY" AS "KEY", "DT_node_lookup_6".node_id_2 AS node_id_2, "DT_node_data_6".nid AS nid, "DT_node_data_6"."E" AS "E" 
FROM "DT_node_lookup_6" LEFT OUTER JOIN "DT_node_data_6" ON "DT_node_lookup_6".node_id_2 = "DT_node_data_6".nid), 
"RF_Model_6" AS 
(SELECT "DT_Output_6"."KEY" AS "KEY", "DT_Output_6"."E" AS "Estimator" 
FROM "DT_Output_6"), 
"DT_node_lookup_7" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.3288538389484016) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -1.2809637125225979) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -1.2284947142954872) THEN 5 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -1.141936694282718) THEN 7 ELSE 8 END END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.9006292674492278) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.5830143290106726) THEN 11 ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_7" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 21.4076138390031 AS "E" UNION ALL SELECT 5 AS nid, 13.294788431126499 AS "E" UNION ALL SELECT 7 AS nid, 21.2622710741168 AS "E" UNION ALL SELECT 8 AS nid, 16.6301075968004 AS "E" UNION ALL SELECT 11 AS nid, 12.0672234523811 AS "E" UNION ALL SELECT 12 AS nid, 16.934466035797698 AS "E" UNION ALL SELECT 13 AS nid, 10.167088598531699 AS "E") AS "Values"), 
"DT_Output_7" AS 
(SELECT "DT_node_lookup_7"."KEY" AS "KEY", "DT_node_lookup_7".node_id_2 AS node_id_2, "DT_node_data_7".nid AS nid, "DT_node_data_7"."E" AS "E" 
FROM "DT_node_lookup_7" LEFT OUTER JOIN "DT_node_data_7" ON "DT_node_lookup_7".node_id_2 = "DT_node_data_7".nid), 
"RF_Model_7" AS 
(SELECT "DT_Output_7"."KEY" AS "KEY", "DT_Output_7"."E" AS "Estimator" 
FROM "DT_Output_7"), 
"DT_node_lookup_8" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.3288538389484016) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.41255411109913) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.7518348737173992) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 0.5927306047679013) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.9006292674492278) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_8" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 20.8583961378902 AS "E" UNION ALL SELECT 5 AS nid, 18.5410530800638 AS "E" UNION ALL SELECT 6 AS nid, 15.1991762697583 AS "E" UNION ALL SELECT 9 AS nid, 13.887722210092699 AS "E" UNION ALL SELECT 10 AS nid, 9.86019846871143 AS "E" UNION ALL SELECT 11 AS nid, 15.9489837128847 AS "E") AS "Values"), 
"DT_Output_8" AS 
(SELECT "DT_node_lookup_8"."KEY" AS "KEY", "DT_node_lookup_8".node_id_2 AS node_id_2, "DT_node_data_8".nid AS nid, "DT_node_data_8"."E" AS "E" 
FROM "DT_node_lookup_8" LEFT OUTER JOIN "DT_node_data_8" ON "DT_node_lookup_8".node_id_2 = "DT_node_data_8".nid), 
"RF_Model_8" AS 
(SELECT "DT_Output_8"."KEY" AS "KEY", "DT_Output_8"."E" AS "Estimator" 
FROM "DT_Output_8"), 
"DT_node_lookup_9" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.4721946992915487) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -1.542057509285025) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.041638279495164736) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.9156684310721452) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 1.088966403606969) THEN CASE WHEN ("ADS_pre_1_OUT"."PC7" <= 0.2329545693075366) THEN 10 ELSE 11 END ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_9" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 21.879178434931998 AS "E" UNION ALL SELECT 5 AS nid, 18.156905049641303 AS "E" UNION ALL SELECT 6 AS nid, 20.156215259768697 AS "E" UNION ALL SELECT 10 AS nid, 13.758863852293198 AS "E" UNION ALL SELECT 11 AS nid, 18.283070395983 AS "E" UNION ALL SELECT 12 AS nid, 9.54103095178361 AS "E" UNION ALL SELECT 13 AS nid, 7.748333598045571 AS "E") AS "Values"), 
"DT_Output_9" AS 
(SELECT "DT_node_lookup_9"."KEY" AS "KEY", "DT_node_lookup_9".node_id_2 AS node_id_2, "DT_node_data_9".nid AS nid, "DT_node_data_9"."E" AS "E" 
FROM "DT_node_lookup_9" LEFT OUTER JOIN "DT_node_data_9" ON "DT_node_lookup_9".node_id_2 = "DT_node_data_9".nid), 
"RF_Model_9" AS 
(SELECT "DT_Output_9"."KEY" AS "KEY", "DT_Output_9"."E" AS "Estimator" 
FROM "DT_Output_9")
 SELECT "RF_esu_0"."KEY", "RF_esu_0"."Estimator" 
FROM (SELECT "RF_Model_0"."KEY" AS "KEY", CAST("RF_Model_0"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_0" UNION ALL SELECT "RF_Model_1"."KEY" AS "KEY", CAST("RF_Model_1"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_1" UNION ALL SELECT "RF_Model_2"."KEY" AS "KEY", CAST("RF_Model_2"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_2" UNION ALL SELECT "RF_Model_3"."KEY" AS "KEY", CAST("RF_Model_3"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_3" UNION ALL SELECT "RF_Model_4"."KEY" AS "KEY", CAST("RF_Model_4"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_4" UNION ALL SELECT "RF_Model_5"."KEY" AS "KEY", CAST("RF_Model_5"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_5" UNION ALL SELECT "RF_Model_6"."KEY" AS "KEY", CAST("RF_Model_6"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_6" UNION ALL SELECT "RF_Model_7"."KEY" AS "KEY", CAST("RF_Model_7"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_7" UNION ALL SELECT "RF_Model_8"."KEY" AS "KEY", CAST("RF_Model_8"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_8" UNION ALL SELECT "RF_Model_9"."KEY" AS "KEY", CAST("RF_Model_9"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_9") AS "RF_esu_0"), 
"RF_1" AS 
(WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 0.5629846484809589) / 0.2600015884118536 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 0.4560644242337592) / 0.2896884193099619 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.4711381748147476) / 0.3128833495879441 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 0.5339680200945178) / 0.2844030958277151 AS "Feature_3", (CAST("ADS"."Feature_4" AS FLOAT) - 0.478093626237387) / 0.2879458120111227 AS "Feature_4", (CAST("ADS"."Feature_5" AS FLOAT) - 0.5682849224172328) / 0.2995521696075025 AS "Feature_5", (CAST("ADS"."Feature_6" AS FLOAT) - 0.4791437471428049) / 0.2752572650336402 AS "Feature_6", (CAST("ADS"."Feature_7" AS FLOAT) - 0.4594152477223208) / 0.2890235713417702 AS "Feature_7", (CAST("ADS"."Feature_8" AS FLOAT) - 0.4901106996809652) / 0.2808092486405501 AS "Feature_8", (CAST("ADS"."Feature_9" AS FLOAT) - 0.5378806933707535) / 0.297685615548656 AS "Feature_9" 
FROM freidman1 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * 0.01078044206398687 + "ADS_sca_1_OUT"."Feature_1" * 0.20275672425035265 + "ADS_sca_1_OUT"."Feature_2" * -0.3032095959115069 + "ADS_sca_1_OUT"."Feature_3" * 0.28036946451509137 + "ADS_sca_1_OUT"."Feature_4" * -0.456472170133784 + "ADS_sca_1_OUT"."Feature_5" * 0.36405052299186 + "ADS_sca_1_OUT"."Feature_6" * -0.4779398415021841 + "ADS_sca_1_OUT"."Feature_7" * -0.2499537237134235 + "ADS_sca_1_OUT"."Feature_8" * -0.08553249751289721 + "ADS_sca_1_OUT"."Feature_9" * -0.38614972165398104 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * -0.2486501060343723 + "ADS_sca_1_OUT"."Feature_1" * 0.18538688464371286 + "ADS_sca_1_OUT"."Feature_2" * -0.2340911061275425 + "ADS_sca_1_OUT"."Feature_3" * -0.5312215967757172 + "ADS_sca_1_OUT"."Feature_4" * -0.034157117099708666 + "ADS_sca_1_OUT"."Feature_5" * -0.11403009160110295 + "ADS_sca_1_OUT"."Feature_6" * 0.03913846092020175 + "ADS_sca_1_OUT"."Feature_7" * -0.3193281863661248 + "ADS_sca_1_OUT"."Feature_8" * 0.6497321497824414 + "ADS_sca_1_OUT"."Feature_9" * -0.16427431415508242 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * 0.529444486853135 + "ADS_sca_1_OUT"."Feature_1" * -0.042432305775754416 + "ADS_sca_1_OUT"."Feature_2" * -0.467456082445249 + "ADS_sca_1_OUT"."Feature_3" * -0.12113349070226218 + "ADS_sca_1_OUT"."Feature_4" * 0.3516615435966041 + "ADS_sca_1_OUT"."Feature_5" * 0.05456396920784263 + "ADS_sca_1_OUT"."Feature_6" * -0.0169721401066592 + "ADS_sca_1_OUT"."Feature_7" * 0.44796273797836184 + "ADS_sca_1_OUT"."Feature_8" * 0.09951231655089274 + "ADS_sca_1_OUT"."Feature_9" * -0.3836601176822301 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * 0.18967062357660877 + "ADS_sca_1_OUT"."Feature_1" * -0.6739997429415825 + "ADS_sca_1_OUT"."Feature_2" * -0.05142756480300252 + "ADS_sca_1_OUT"."Feature_3" * -0.4240887569157897 + "ADS_sca_1_OUT"."Feature_4" * -0.1753617554170441 + "ADS_sca_1_OUT"."Feature_5" * -0.23730999119190946 + "ADS_sca_1_OUT"."Feature_6" * -0.3492917073303225 + "ADS_sca_1_OUT"."Feature_7" * -0.24015917199949824 + "ADS_sca_1_OUT"."Feature_8" * -0.24578721855897134 + "ADS_sca_1_OUT"."Feature_9" * 0.009647497508173676 AS "PC4", "ADS_sca_1_OUT"."Feature_0" * 0.22360120393586685 + "ADS_sca_1_OUT"."Feature_1" * -0.27882706563202 + "ADS_sca_1_OUT"."Feature_2" * 0.3325159145316829 + "ADS_sca_1_OUT"."Feature_3" * 0.03231293124673378 + "ADS_sca_1_OUT"."Feature_4" * 0.31176328828301664 + "ADS_sca_1_OUT"."Feature_5" * 0.5846343873278481 + "ADS_sca_1_OUT"."Feature_6" * 0.2256344434749018 + "ADS_sca_1_OUT"."Feature_7" * -0.4544239404125063 + "ADS_sca_1_OUT"."Feature_8" * 0.13999262235747426 + "ADS_sca_1_OUT"."Feature_9" * -0.21128970950531886 AS "PC5", "ADS_sca_1_OUT"."Feature_0" * 0.3346351973554642 + "ADS_sca_1_OUT"."Feature_1" * 0.0673786411182812 + "ADS_sca_1_OUT"."Feature_2" * 0.2578168786971707 + "ADS_sca_1_OUT"."Feature_3" * 0.1264276445937259 + "ADS_sca_1_OUT"."Feature_4" * -0.40729831882959366 + "ADS_sca_1_OUT"."Feature_5" * -0.455689833219327 + "ADS_sca_1_OUT"."Feature_6" * 0.4311593109248494 + "ADS_sca_1_OUT"."Feature_7" * -0.10623939522740035 + "ADS_sca_1_OUT"."Feature_8" * 0.004192902519120928 + "ADS_sca_1_OUT"."Feature_9" * -0.4798729265184412 AS "PC6", "ADS_sca_1_OUT"."Feature_0" * 0.5345631681819778 + "ADS_sca_1_OUT"."Feature_1" * 0.2916209104051029 + "ADS_sca_1_OUT"."Feature_2" * 0.4273963159452305 + "ADS_sca_1_OUT"."Feature_3" * -0.2195301363042834 + "ADS_sca_1_OUT"."Feature_4" * -0.235065733216965 + "ADS_sca_1_OUT"."Feature_5" * 0.1295961010443568 + "ADS_sca_1_OUT"."Feature_6" * -0.3373404838354823 + "ADS_sca_1_OUT"."Feature_7" * 0.1550843553371763 + "ADS_sca_1_OUT"."Feature_8" * 0.2854751024551945 + "ADS_sca_1_OUT"."Feature_9" * 0.3270191591377724 AS "PC7" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup_10" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.395711634015883) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6214055026513039) THEN CASE WHEN ("ADS_pre_1_OUT"."PC5" <= 0.1595752603242316) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.01380642472895866) THEN 7 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.1982563363979112) THEN 9 ELSE 10 END END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.6934898359420043) THEN 12 ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_10" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 19.7791163709934 AS "E" UNION ALL SELECT 5 AS nid, 17.828498553027803 AS "E" UNION ALL SELECT 7 AS nid, 12.4414418716425 AS "E" UNION ALL SELECT 9 AS nid, 18.4460282732785 AS "E" UNION ALL SELECT 10 AS nid, 16.3299823154651 AS "E" UNION ALL SELECT 12 AS nid, 12.8050303436957 AS "E" UNION ALL SELECT 13 AS nid, 8.81692914993715 AS "E") AS "Values"), 
"DT_Output_10" AS 
(SELECT "DT_node_lookup_10"."KEY" AS "KEY", "DT_node_lookup_10".node_id_2 AS node_id_2, "DT_node_data_10".nid AS nid, "DT_node_data_10"."E" AS "E" 
FROM "DT_node_lookup_10" LEFT OUTER JOIN "DT_node_data_10" ON "DT_node_lookup_10".node_id_2 = "DT_node_data_10".nid), 
"RF_Model_10" AS 
(SELECT "DT_Output_10"."KEY" AS "KEY", "DT_Output_10"."E" AS "Estimator" 
FROM "DT_Output_10"), 
"DT_node_lookup_11" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.7518348737173992) THEN 2 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 1.088966403606969) THEN CASE WHEN ("ADS_pre_1_OUT"."PC7" <= 0.1041642583730904) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.3663093414578848) THEN 6 ELSE 7 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.5036409823529873) THEN 9 ELSE 10 END END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_11" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 19.7972897049688 AS "E" UNION ALL SELECT 6 AS nid, 8.07922400589965 AS "E" UNION ALL SELECT 7 AS nid, 13.8403990739741 AS "E" UNION ALL SELECT 9 AS nid, 17.8161805719757 AS "E" UNION ALL SELECT 10 AS nid, 14.5758459777926 AS "E" UNION ALL SELECT 11 AS nid, 10.546612938467 AS "E") AS "Values"), 
"DT_Output_11" AS 
(SELECT "DT_node_lookup_11"."KEY" AS "KEY", "DT_node_lookup_11".node_id_2 AS node_id_2, "DT_node_data_11".nid AS nid, "DT_node_data_11"."E" AS "E" 
FROM "DT_node_lookup_11" LEFT OUTER JOIN "DT_node_data_11" ON "DT_node_lookup_11".node_id_2 = "DT_node_data_11".nid), 
"RF_Model_11" AS 
(SELECT "DT_Output_11"."KEY" AS "KEY", "DT_Output_11"."E" AS "Estimator" 
FROM "DT_Output_11"), 
"DT_node_lookup_12" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6214055026513039) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.041638279495164736) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 0.470147017989433) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.6711050509724) THEN CASE WHEN ("ADS_pre_1_OUT"."PC7" <= -0.4055274160807825) THEN 8 ELSE 9 END ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_12" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 17.281204709054197 AS "E" UNION ALL SELECT 4 AS nid, 21.5185154698042 AS "E" UNION ALL SELECT 8 AS nid, 12.962922308022803 AS "E" UNION ALL SELECT 9 AS nid, 15.718515332291801 AS "E" UNION ALL SELECT 10 AS nid, 8.63368746994289 AS "E" UNION ALL SELECT 11 AS nid, 17.1130430622415 AS "E") AS "Values"), 
"DT_Output_12" AS 
(SELECT "DT_node_lookup_12"."KEY" AS "KEY", "DT_node_lookup_12".node_id_2 AS node_id_2, "DT_node_data_12".nid AS nid, "DT_node_data_12"."E" AS "E" 
FROM "DT_node_lookup_12" LEFT OUTER JOIN "DT_node_data_12" ON "DT_node_lookup_12".node_id_2 = "DT_node_data_12".nid), 
"RF_Model_12" AS 
(SELECT "DT_Output_12"."KEY" AS "KEY", "DT_Output_12"."E" AS "Estimator" 
FROM "DT_Output_12"), 
"DT_node_lookup_13" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.4395827967113186) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6214055026513039) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 1.0719170033493322) THEN CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.7295482895706361) THEN 6 ELSE 7 END ELSE 8 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.3860424488250303) THEN 10 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC5" <= 0.03810885260664632) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_13" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 19.4307308075019 AS "E" UNION ALL SELECT 6 AS nid, 14.142894891568599 AS "E" UNION ALL SELECT 7 AS nid, 10.492495703145599 AS "E" UNION ALL SELECT 8 AS nid, 7.72256504208856 AS "E" UNION ALL SELECT 10 AS nid, 20.2257173940391 AS "E" UNION ALL SELECT 12 AS nid, 16.6475984871026 AS "E" UNION ALL SELECT 13 AS nid, 13.6787968391034 AS "E") AS "Values"), 
"DT_Output_13" AS 
(SELECT "DT_node_lookup_13"."KEY" AS "KEY", "DT_node_lookup_13".node_id_2 AS node_id_2, "DT_node_data_13".nid AS nid, "DT_node_data_13"."E" AS "E" 
FROM "DT_node_lookup_13" LEFT OUTER JOIN "DT_node_data_13" ON "DT_node_lookup_13".node_id_2 = "DT_node_data_13".nid), 
"RF_Model_13" AS 
(SELECT "DT_Output_13"."KEY" AS "KEY", "DT_Output_13"."E" AS "Estimator" 
FROM "DT_Output_13"), 
"DT_node_lookup_14" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.395711634015883) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -1.309896063434326) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.6214055026513039) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.7887735978179715) THEN 6 ELSE 7 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.5317756723192693) THEN 9 ELSE 10 END END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 1.5498794874566069) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.5261972102550742) THEN 13 ELSE 14 END ELSE 15 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_14" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 21.5630235005675 AS "E" UNION ALL SELECT 6 AS nid, 16.4425861388876 AS "E" UNION ALL SELECT 7 AS nid, 20.1798224476645 AS "E" UNION ALL SELECT 9 AS nid, 14.4210266311695 AS "E" UNION ALL SELECT 10 AS nid, 16.8320968611952 AS "E" UNION ALL SELECT 13 AS nid, 10.2584571105934 AS "E" UNION ALL SELECT 14 AS nid, 13.2255225256127 AS "E" UNION ALL SELECT 15 AS nid, 7.5349960677397 AS "E") AS "Values"), 
"DT_Output_14" AS 
(SELECT "DT_node_lookup_14"."KEY" AS "KEY", "DT_node_lookup_14".node_id_2 AS node_id_2, "DT_node_data_14".nid AS nid, "DT_node_data_14"."E" AS "E" 
FROM "DT_node_lookup_14" LEFT OUTER JOIN "DT_node_data_14" ON "DT_node_lookup_14".node_id_2 = "DT_node_data_14".nid), 
"RF_Model_14" AS 
(SELECT "DT_Output_14"."KEY" AS "KEY", "DT_Output_14"."E" AS "Estimator" 
FROM "DT_Output_14"), 
"DT_node_lookup_15" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.4721946992915487) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -1.2809637125225979) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.7691092763440981) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.4395827967113186) THEN CASE WHEN ("ADS_pre_1_OUT"."PC5" <= -1.012697275103266) THEN 9 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.6497158442525607) THEN 11 ELSE 12 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC7" <= -0.028815932455779486) THEN 14 ELSE 15 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_15" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 23.3144997932343 AS "E" UNION ALL SELECT 5 AS nid, 15.361905429710902 AS "E" UNION ALL SELECT 6 AS nid, 19.7677940487932 AS "E" UNION ALL SELECT 9 AS nid, 13.1586543448899 AS "E" UNION ALL SELECT 11 AS nid, 10.3306149160833 AS "E" UNION ALL SELECT 12 AS nid, 8.440805008554719 AS "E" UNION ALL SELECT 14 AS nid, 11.947467881382 AS "E" UNION ALL SELECT 15 AS nid, 16.229248604597 AS "E") AS "Values"), 
"DT_Output_15" AS 
(SELECT "DT_node_lookup_15"."KEY" AS "KEY", "DT_node_lookup_15".node_id_2 AS node_id_2, "DT_node_data_15".nid AS nid, "DT_node_data_15"."E" AS "E" 
FROM "DT_node_lookup_15" LEFT OUTER JOIN "DT_node_data_15" ON "DT_node_lookup_15".node_id_2 = "DT_node_data_15".nid), 
"RF_Model_15" AS 
(SELECT "DT_Output_15"."KEY" AS "KEY", "DT_Output_15"."E" AS "Estimator" 
FROM "DT_Output_15")
 SELECT "RF_esu_1"."KEY", "RF_esu_1"."Estimator" 
FROM (SELECT "RF_Model_10"."KEY" AS "KEY", CAST("RF_Model_10"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_10" UNION ALL SELECT "RF_Model_11"."KEY" AS "KEY", CAST("RF_Model_11"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_11" UNION ALL SELECT "RF_Model_12"."KEY" AS "KEY", CAST("RF_Model_12"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_12" UNION ALL SELECT "RF_Model_13"."KEY" AS "KEY", CAST("RF_Model_13"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_13" UNION ALL SELECT "RF_Model_14"."KEY" AS "KEY", CAST("RF_Model_14"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_14" UNION ALL SELECT "RF_Model_15"."KEY" AS "KEY", CAST("RF_Model_15"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_Model_15") AS "RF_esu_1"), 
"RF" AS 
(SELECT "RFbig_esu"."KEY" AS "KEY", "RFbig_esu"."Estimator" AS "Estimator" 
FROM (SELECT "RF_0"."KEY" AS "KEY", CAST("RF_0"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_0" UNION ALL SELECT "RF_1"."KEY" AS "KEY", CAST("RF_1"."Estimator" AS FLOAT) AS "Estimator" 
FROM "RF_1") AS "RFbig_esu"), 
"RF_avg" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Estimator" AS FLOAT) AS "Estimator" 
FROM (SELECT "RF"."KEY" AS "KEY", avg(CAST("RF"."Estimator" AS FLOAT)) AS "Estimator" 
FROM "RF" GROUP BY "RF"."KEY") AS "T")
 SELECT "RF_avg"."KEY" AS "KEY", "RF_avg"."Estimator" AS "Estimator" 
FROM "RF_avg"