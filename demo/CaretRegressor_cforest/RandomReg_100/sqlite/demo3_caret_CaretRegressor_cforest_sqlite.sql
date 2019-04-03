-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_cforest
-- Dataset : RandomReg_100
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "RF_0" AS 
(WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.7236700723654759) THEN CASE WHEN ("ADS"."Feature_41" <= -0.06565698651262593) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_41" <= -0.2286103223603902) THEN CASE WHEN ("ADS"."Feature_63" <= 0.1486590814302626) THEN 7 ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_10" <= 0.1729158484675054) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -274.588070826692 AS "E" UNION ALL SELECT 4 AS nid, -2.19270605131937 AS "E" UNION ALL SELECT 7 AS nid, -41.9644733061477 AS "E" UNION ALL SELECT 8 AS nid, 64.523087527843 AS "E" UNION ALL SELECT 10 AS nid, 240.13172397605598 AS "E" UNION ALL SELECT 11 AS nid, 109.368608802544 AS "E") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"RF_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_63" <= 0.6273308951547046) THEN CASE WHEN ("ADS"."Feature_41" <= -0.5405962142392532) THEN CASE WHEN ("ADS"."Feature_80" <= -0.7236700723654759) THEN CASE WHEN ("ADS"."Feature_54" <= 0.2021119545416647) THEN 5 ELSE 6 END ELSE 7 END ELSE CASE WHEN ("ADS"."Feature_7" <= 0.5837024639062935) THEN 9 ELSE 10 END END ELSE CASE WHEN ("ADS"."Feature_31" <= 0.1253164382516367) THEN 12 ELSE 13 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 5 AS nid, -351.493814127678 AS "E" UNION ALL SELECT 6 AS nid, -239.246155308095 AS "E" UNION ALL SELECT 7 AS nid, -135.17471219568301 AS "E" UNION ALL SELECT 9 AS nid, 86.77722870254009 AS "E" UNION ALL SELECT 10 AS nid, -129.133466764835 AS "E" UNION ALL SELECT 12 AS nid, 60.7090176377139 AS "E" UNION ALL SELECT 13 AS nid, 270.393835734 AS "E") AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."E" AS "E" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"RF_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."E" AS "Estimator" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.5613799834209606) THEN CASE WHEN ("ADS"."Feature_41" <= -0.1743026347191926) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_46" <= 0.2444396321311302) THEN CASE WHEN ("ADS"."Feature_16" <= -0.9230735063733628) THEN 7 ELSE CASE WHEN ("ADS"."Feature_13" <= -0.2608559483231799) THEN 9 ELSE 10 END END ELSE CASE WHEN ("ADS"."Feature_94" <= -1.6490220387553383) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -263.967262371391 AS "E" UNION ALL SELECT 4 AS nid, -82.0090001076142 AS "E" UNION ALL SELECT 7 AS nid, 38.1346738151717 AS "E" UNION ALL SELECT 9 AS nid, 243.49513292540001 AS "E" UNION ALL SELECT 10 AS nid, 168.53579927187 AS "E" UNION ALL SELECT 12 AS nid, 82.7541534540484 AS "E" UNION ALL SELECT 13 AS nid, -98.875585262372 AS "E") AS "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."E" AS "E" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"RF_Model_2" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", "DT_Output_2"."E" AS "Estimator" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_63" <= -0.4117912136199903) THEN CASE WHEN ("ADS"."Feature_80" <= -0.4414044125407976) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_39" <= 0.4945799105524901) THEN CASE WHEN ("ADS"."Feature_94" <= -0.7551090598342964) THEN 7 ELSE 8 END ELSE 9 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -242.085311894304 AS "E" UNION ALL SELECT 4 AS nid, -6.29416969462061 AS "E" UNION ALL SELECT 7 AS nid, 164.151058282591 AS "E" UNION ALL SELECT 8 AS nid, -55.5243078068851 AS "E" UNION ALL SELECT 9 AS nid, 211.261713730636 AS "E") AS "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."E" AS "E" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"RF_Model_3" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", "DT_Output_3"."E" AS "Estimator" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_63" <= 0.6296270048824404) THEN CASE WHEN ("ADS"."Feature_80" <= -0.7236700723654759) THEN CASE WHEN ("ADS"."Feature_58" <= -0.02297950596767749) THEN CASE WHEN ("ADS"."Feature_52" <= -0.4601067653828892) THEN 5 ELSE 6 END ELSE 7 END ELSE CASE WHEN ("ADS"."Feature_55" <= -1.177728066235484) THEN 9 ELSE CASE WHEN ("ADS"."Feature_66" <= 0.1871979475761245) THEN 11 ELSE 12 END END END ELSE 13 END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 5 AS nid, -215.920492824465 AS "E" UNION ALL SELECT 6 AS nid, -369.665348971348 AS "E" UNION ALL SELECT 7 AS nid, -76.6537589900302 AS "E" UNION ALL SELECT 9 AS nid, 223.40040680266603 AS "E" UNION ALL SELECT 11 AS nid, -94.18209174970809 AS "E" UNION ALL SELECT 12 AS nid, 112.859181964937 AS "E" UNION ALL SELECT 13 AS nid, 175.14786528457802 AS "E") AS "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."E" AS "E" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"RF_Model_4" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", "DT_Output_4"."E" AS "Estimator" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.2496712469392681) THEN CASE WHEN ("ADS"."Feature_63" <= -0.09485030443617087) THEN CASE WHEN ("ADS"."Feature_41" <= -0.3580895049481383) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ("ADS"."Feature_54" <= 0.774293140763859) THEN CASE WHEN ("ADS"."Feature_89" <= 0.0060876655391172456) THEN 9 ELSE CASE WHEN ("ADS"."Feature_46" <= -0.3759502375043379) THEN 11 ELSE 12 END END ELSE 13 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, -329.44064930517897 AS "E" UNION ALL SELECT 5 AS nid, -167.570498824389 AS "E" UNION ALL SELECT 6 AS nid, 70.9193448215881 AS "E" UNION ALL SELECT 9 AS nid, 57.2681681266605 AS "E" UNION ALL SELECT 11 AS nid, 201.465050831598 AS "E" UNION ALL SELECT 12 AS nid, 100.81463247027399 AS "E" UNION ALL SELECT 13 AS nid, 236.30620923165 AS "E") AS "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."E" AS "E" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"RF_Model_5" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", "DT_Output_5"."E" AS "Estimator" 
FROM "DT_Output_5"), 
"DT_node_lookup_6" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.2496712469392681) THEN CASE WHEN ("ADS"."Feature_95" <= -0.3063204166786526) THEN CASE WHEN ("ADS"."Feature_41" <= -0.3580895049481383) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ("ADS"."Feature_39" <= -0.5291411245147772) THEN 8 ELSE CASE WHEN ("ADS"."Feature_56" <= -0.8203776766217897) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_6" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, -340.318800238203 AS "E" UNION ALL SELECT 5 AS nid, -187.718046985911 AS "E" UNION ALL SELECT 6 AS nid, 1.25775561710629 AS "E" UNION ALL SELECT 8 AS nid, -32.9792575327429 AS "E" UNION ALL SELECT 10 AS nid, 223.404567790606 AS "E" UNION ALL SELECT 11 AS nid, 79.59139942654458 AS "E") AS "Values"), 
"DT_Output_6" AS 
(SELECT "DT_node_lookup_6"."KEY" AS "KEY", "DT_node_lookup_6".node_id_2 AS node_id_2, "DT_node_data_6".nid AS nid, "DT_node_data_6"."E" AS "E" 
FROM "DT_node_lookup_6" LEFT OUTER JOIN "DT_node_data_6" ON "DT_node_lookup_6".node_id_2 = "DT_node_data_6".nid), 
"RF_Model_6" AS 
(SELECT "DT_Output_6"."KEY" AS "KEY", "DT_Output_6"."E" AS "Estimator" 
FROM "DT_Output_6"), 
"DT_node_lookup_7" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.8089640402909711) THEN CASE WHEN ("ADS"."Feature_41" <= -0.5533292299123506) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_63" <= -0.953226088104576) THEN 6 ELSE CASE WHEN ("ADS"."Feature_54" <= -1.2428662773075678) THEN 8 ELSE CASE WHEN ("ADS"."Feature_31" <= 0.4352204885891366) THEN CASE WHEN ("ADS"."Feature_95" <= 0.06483853027523015) THEN 11 ELSE 12 END ELSE 13 END END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_7" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -297.05709739406 AS "E" UNION ALL SELECT 4 AS nid, -111.31746649108 AS "E" UNION ALL SELECT 6 AS nid, -80.1791726695684 AS "E" UNION ALL SELECT 8 AS nid, -54.9252468891893 AS "E" UNION ALL SELECT 11 AS nid, 97.59030050231578 AS "E" UNION ALL SELECT 12 AS nid, 184.88812540967098 AS "E" UNION ALL SELECT 13 AS nid, 250.99654758694803 AS "E") AS "Values"), 
"DT_Output_7" AS 
(SELECT "DT_node_lookup_7"."KEY" AS "KEY", "DT_node_lookup_7".node_id_2 AS node_id_2, "DT_node_data_7".nid AS nid, "DT_node_data_7"."E" AS "E" 
FROM "DT_node_lookup_7" LEFT OUTER JOIN "DT_node_data_7" ON "DT_node_lookup_7".node_id_2 = "DT_node_data_7".nid), 
"RF_Model_7" AS 
(SELECT "DT_Output_7"."KEY" AS "KEY", "DT_Output_7"."E" AS "Estimator" 
FROM "DT_Output_7"), 
"DT_node_lookup_8" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.7512346614965767) THEN CASE WHEN ("ADS"."Feature_16" <= 0.2819002019195001) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_80" <= 1.217484890053481) THEN CASE WHEN ("ADS"."Feature_8" <= 0.004201245140549573) THEN CASE WHEN ("ADS"."Feature_67" <= -0.3302592120054872) THEN 8 ELSE 9 END ELSE CASE WHEN ("ADS"."Feature_48" <= -0.09095425967484287) THEN 11 ELSE 12 END END ELSE 13 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_8" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -291.577105522853 AS "E" UNION ALL SELECT 4 AS nid, -61.7587973985166 AS "E" UNION ALL SELECT 8 AS nid, -123.22336639435801 AS "E" UNION ALL SELECT 9 AS nid, -8.98697952888466 AS "E" UNION ALL SELECT 11 AS nid, 46.148914695920894 AS "E" UNION ALL SELECT 12 AS nid, 173.459169126973 AS "E" UNION ALL SELECT 13 AS nid, 247.451502065039 AS "E") AS "Values"), 
"DT_Output_8" AS 
(SELECT "DT_node_lookup_8"."KEY" AS "KEY", "DT_node_lookup_8".node_id_2 AS node_id_2, "DT_node_data_8".nid AS nid, "DT_node_data_8"."E" AS "E" 
FROM "DT_node_lookup_8" LEFT OUTER JOIN "DT_node_data_8" ON "DT_node_lookup_8".node_id_2 = "DT_node_data_8".nid), 
"RF_Model_8" AS 
(SELECT "DT_Output_8"."KEY" AS "KEY", "DT_Output_8"."E" AS "Estimator" 
FROM "DT_Output_8"), 
"DT_node_lookup_9" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.7236700723654759) THEN CASE WHEN ("ADS"."Feature_16" <= -0.5303271526476072) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_39" <= 0.4552017167099577) THEN CASE WHEN ("ADS"."Feature_80" <= 1.056583893445835) THEN CASE WHEN ("ADS"."Feature_32" <= -0.21934933106002902) THEN 8 ELSE 9 END ELSE 10 END ELSE CASE WHEN ("ADS"."Feature_31" <= -0.1112568385970751) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_9" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -376.004991701512 AS "E" UNION ALL SELECT 4 AS nid, -129.786104112245 AS "E" UNION ALL SELECT 8 AS nid, -83.93995001055309 AS "E" UNION ALL SELECT 9 AS nid, 60.7378955756777 AS "E" UNION ALL SELECT 10 AS nid, 151.374760259002 AS "E" UNION ALL SELECT 12 AS nid, 99.6421585813951 AS "E" UNION ALL SELECT 13 AS nid, 258.262393020419 AS "E") AS "Values"), 
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
(WITH "DT_node_lookup_10" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_41" <= -0.7861078661911578) THEN 2 ELSE CASE WHEN ("ADS"."Feature_22" <= 0.7895918067562282) THEN CASE WHEN ("ADS"."Feature_67" <= 0.4918269285611587) THEN CASE WHEN ("ADS"."Feature_35" <= 0.5487605827582843) THEN CASE WHEN ("ADS"."Feature_10" <= 0.8368529362198859) THEN CASE WHEN ("ADS"."Feature_13" <= -0.4895206659880189) THEN 8 ELSE 9 END ELSE 10 END ELSE 11 END ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_10" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, -275.095045481026 AS "E" UNION ALL SELECT 8 AS nid, 83.30286087174021 AS "E" UNION ALL SELECT 9 AS nid, 182.611439120769 AS "E" UNION ALL SELECT 10 AS nid, 53.732813566627904 AS "E" UNION ALL SELECT 11 AS nid, 307.57838334237704 AS "E" UNION ALL SELECT 12 AS nid, -3.5213680077477205 AS "E" UNION ALL SELECT 13 AS nid, -64.2186423861385 AS "E") AS "Values"), 
"DT_Output_10" AS 
(SELECT "DT_node_lookup_10"."KEY" AS "KEY", "DT_node_lookup_10".node_id_2 AS node_id_2, "DT_node_data_10".nid AS nid, "DT_node_data_10"."E" AS "E" 
FROM "DT_node_lookup_10" LEFT OUTER JOIN "DT_node_data_10" ON "DT_node_lookup_10".node_id_2 = "DT_node_data_10".nid), 
"RF_Model_10" AS 
(SELECT "DT_Output_10"."KEY" AS "KEY", "DT_Output_10"."E" AS "Estimator" 
FROM "DT_Output_10"), 
"DT_node_lookup_11" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= 0.1888259544453264) THEN CASE WHEN ("ADS"."Feature_77" <= 1.293294272756347) THEN CASE WHEN ("ADS"."Feature_63" <= -0.2760186748052066) THEN CASE WHEN ("ADS"."Feature_40" <= -0.8005908645215533) THEN 5 ELSE 6 END ELSE 7 END ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_41" <= -0.1389420469340595) THEN 10 ELSE CASE WHEN ("ADS"."Feature_33" <= 0.3850992572108831) THEN 12 ELSE 13 END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_11" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 5 AS nid, -81.16527203572859 AS "E" UNION ALL SELECT 6 AS nid, -213.95883648161998 AS "E" UNION ALL SELECT 7 AS nid, 13.263051524691802 AS "E" UNION ALL SELECT 8 AS nid, -321.499666089053 AS "E" UNION ALL SELECT 10 AS nid, 79.50914771831529 AS "E" UNION ALL SELECT 12 AS nid, 158.248671417401 AS "E" UNION ALL SELECT 13 AS nid, 215.47588962089802 AS "E") AS "Values"), 
"DT_Output_11" AS 
(SELECT "DT_node_lookup_11"."KEY" AS "KEY", "DT_node_lookup_11".node_id_2 AS node_id_2, "DT_node_data_11".nid AS nid, "DT_node_data_11"."E" AS "E" 
FROM "DT_node_lookup_11" LEFT OUTER JOIN "DT_node_data_11" ON "DT_node_lookup_11".node_id_2 = "DT_node_data_11".nid), 
"RF_Model_11" AS 
(SELECT "DT_Output_11"."KEY" AS "KEY", "DT_Output_11"."E" AS "Estimator" 
FROM "DT_Output_11"), 
"DT_node_lookup_12" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.1014809494727687) THEN CASE WHEN ("ADS"."Feature_63" <= -0.09485030443617087) THEN CASE WHEN ("ADS"."Feature_8" <= -0.8056523931979609) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS"."Feature_41" <= -0.7861078661911578) THEN 7 ELSE 8 END END ELSE CASE WHEN ("ADS"."Feature_31" <= -0.5163806863696991) THEN 10 ELSE CASE WHEN ("ADS"."Feature_40" <= -1.6696344123144051) THEN 12 ELSE CASE WHEN ("ADS"."Feature_33" <= -0.2912274847884899) THEN 14 ELSE 15 END END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_12" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, -146.415207550759 AS "E" UNION ALL SELECT 5 AS nid, -323.179013712359 AS "E" UNION ALL SELECT 7 AS nid, -193.477110268946 AS "E" UNION ALL SELECT 8 AS nid, 47.97851536459721 AS "E" UNION ALL SELECT 10 AS nid, 41.354265752438394 AS "E" UNION ALL SELECT 12 AS nid, 314.712421833746 AS "E" UNION ALL SELECT 14 AS nid, 116.850905578984 AS "E" UNION ALL SELECT 15 AS nid, 174.74071132668598 AS "E") AS "Values"), 
"DT_Output_12" AS 
(SELECT "DT_node_lookup_12"."KEY" AS "KEY", "DT_node_lookup_12".node_id_2 AS node_id_2, "DT_node_data_12".nid AS nid, "DT_node_data_12"."E" AS "E" 
FROM "DT_node_lookup_12" LEFT OUTER JOIN "DT_node_data_12" ON "DT_node_lookup_12".node_id_2 = "DT_node_data_12".nid), 
"RF_Model_12" AS 
(SELECT "DT_Output_12"."KEY" AS "KEY", "DT_Output_12"."E" AS "Estimator" 
FROM "DT_Output_12"), 
"DT_node_lookup_13" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.133177660415912) THEN CASE WHEN ("ADS"."Feature_95" <= -0.3063204166786526) THEN CASE WHEN ("ADS"."Feature_49" <= -0.8389344049233628) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS"."Feature_12" <= -1.057056178421659) THEN 7 ELSE 8 END END ELSE CASE WHEN ("ADS"."Feature_49" <= 0.1111567605482791) THEN CASE WHEN ("ADS"."Feature_80" <= 0.8640360861416734) THEN 11 ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_13" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, -232.029348430425 AS "E" UNION ALL SELECT 5 AS nid, -361.13992564434096 AS "E" UNION ALL SELECT 7 AS nid, -218.736055247608 AS "E" UNION ALL SELECT 8 AS nid, 35.3737371410609 AS "E" UNION ALL SELECT 11 AS nid, 22.0584497420081 AS "E" UNION ALL SELECT 12 AS nid, 230.779001140239 AS "E" UNION ALL SELECT 13 AS nid, 242.92851965621202 AS "E") AS "Values"), 
"DT_Output_13" AS 
(SELECT "DT_node_lookup_13"."KEY" AS "KEY", "DT_node_lookup_13".node_id_2 AS node_id_2, "DT_node_data_13".nid AS nid, "DT_node_data_13"."E" AS "E" 
FROM "DT_node_lookup_13" LEFT OUTER JOIN "DT_node_data_13" ON "DT_node_lookup_13".node_id_2 = "DT_node_data_13".nid), 
"RF_Model_13" AS 
(SELECT "DT_Output_13"."KEY" AS "KEY", "DT_Output_13"."E" AS "Estimator" 
FROM "DT_Output_13"), 
"DT_node_lookup_14" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.8094992179351388) THEN CASE WHEN ("ADS"."Feature_41" <= -0.3580895049481383) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_39" <= 0.4119667468392197) THEN CASE WHEN ("ADS"."Feature_89" <= 0.3410345452514555) THEN 7 ELSE 8 END ELSE CASE WHEN ("ADS"."Feature_35" <= 0.5814778573839984) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_14" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -314.486086412914 AS "E" UNION ALL SELECT 4 AS nid, -65.6149754416612 AS "E" UNION ALL SELECT 7 AS nid, -91.46377336261541 AS "E" UNION ALL SELECT 8 AS nid, 75.95410515520709 AS "E" UNION ALL SELECT 10 AS nid, 131.15721771996098 AS "E" UNION ALL SELECT 11 AS nid, 300.40377980767397 AS "E") AS "Values"), 
"DT_Output_14" AS 
(SELECT "DT_node_lookup_14"."KEY" AS "KEY", "DT_node_lookup_14".node_id_2 AS node_id_2, "DT_node_data_14".nid AS nid, "DT_node_data_14"."E" AS "E" 
FROM "DT_node_lookup_14" LEFT OUTER JOIN "DT_node_data_14" ON "DT_node_lookup_14".node_id_2 = "DT_node_data_14".nid), 
"RF_Model_14" AS 
(SELECT "DT_Output_14"."KEY" AS "KEY", "DT_Output_14"."E" AS "Estimator" 
FROM "DT_Output_14"), 
"DT_node_lookup_15" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_80" <= -0.7236700723654759) THEN CASE WHEN ("ADS"."Feature_41" <= -0.5533292299123506) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_46" <= 0.48828125906256) THEN CASE WHEN ("ADS"."Feature_31" <= -0.6781979843700254) THEN 7 ELSE CASE WHEN ("ADS"."Feature_88" <= 0.2016069777244476) THEN 9 ELSE 10 END END ELSE 11 END END AS node_id_2 
FROM "RandomReg_100" AS "ADS"), 
"DT_node_data_15" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, -285.300720717682 AS "E" UNION ALL SELECT 4 AS nid, -32.9511619604154 AS "E" UNION ALL SELECT 7 AS nid, 28.3291727727242 AS "E" UNION ALL SELECT 9 AS nid, 233.909594103072 AS "E" UNION ALL SELECT 10 AS nid, 142.79335995856502 AS "E" UNION ALL SELECT 11 AS nid, -26.577186218547002 AS "E") AS "Values"), 
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