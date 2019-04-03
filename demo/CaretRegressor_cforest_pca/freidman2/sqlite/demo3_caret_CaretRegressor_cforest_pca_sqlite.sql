-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_cforest_pca
-- Dataset : freidman2
-- Database : sqlite


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "RF_0" AS 
(WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.6121650749100701 + "ADS_sca_1_OUT"."Feature_1" * 0.5464782903329433 + "ADS_sca_1_OUT"."Feature_2" * -0.5708677485644764 + "ADS_sca_1_OUT"."Feature_3" * -0.02693349038014348 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4888813380420076 + "ADS_sca_1_OUT"."Feature_1" * 0.2745192584561386 + "ADS_sca_1_OUT"."Feature_2" * -0.2238449995359107 + "ADS_sca_1_OUT"."Feature_3" * -0.7971998684355868 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.024686176636208892 + "ADS_sca_1_OUT"."Feature_1" * 0.7091918576518509 + "ADS_sca_1_OUT"."Feature_2" * 0.7038817472089458 + "ADS_sca_1_OUT"."Feature_3" * 0.03143227114740615 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.6209988333786876 + "ADS_sca_1_OUT"."Feature_1" * -0.3507813620644518 + "ADS_sca_1_OUT"."Feature_2" * 0.358544161544677 + "ADS_sca_1_OUT"."Feature_3" * -0.6022947527521242 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= -0.6966888425460029) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9050943131641498) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.037115344874985) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.4743681088731724) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 296.25163737949697 AS "E" UNION ALL SELECT 5 AS nid, 108.797183937346 AS "E" UNION ALL SELECT 6 AS nid, 249.99411678925702 AS "E" UNION ALL SELECT 9 AS nid, 631.983468801585 AS "E" UNION ALL SELECT 10 AS nid, 778.788158199196 AS "E" UNION ALL SELECT 11 AS nid, 1069.5674520123 AS "E") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"RF_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.5941410036998058) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.7880664033078996) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= 0.4412206154056673) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= -0.3461272993532923) THEN 6 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -0.3356075229970326) THEN 8 ELSE 9 END END ELSE 10 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.27074489697104) THEN 12 ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 434.759584346539 AS "E" UNION ALL SELECT 6 AS nid, 227.69684347684398 AS "E" UNION ALL SELECT 8 AS nid, 148.36647751390498 AS "E" UNION ALL SELECT 9 AS nid, 50.2753382567536 AS "E" UNION ALL SELECT 10 AS nid, 412.756424881604 AS "E" UNION ALL SELECT 12 AS nid, 901.180388102428 AS "E" UNION ALL SELECT 13 AS nid, 1320.4487150438001 AS "E") AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."E" AS "E" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"RF_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", "DT_Output_1"."E" AS "Estimator" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.5941410036998058) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.04914527307154967) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9050943131641498) THEN 4 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.6996940116879669) THEN 6 ELSE 7 END END ELSE 8 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.1179396506359658) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.8407155547641444) THEN 11 ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 121.18878455807699 AS "E" UNION ALL SELECT 6 AS nid, 307.18318397731497 AS "E" UNION ALL SELECT 7 AS nid, 172.00677954187302 AS "E" UNION ALL SELECT 8 AS nid, 533.805293275127 AS "E" UNION ALL SELECT 11 AS nid, 757.318955187363 AS "E" UNION ALL SELECT 12 AS nid, 940.4341333286051 AS "E" UNION ALL SELECT 13 AS nid, 1202.01029586914 AS "E") AS "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."E" AS "E" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"RF_Model_2" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", "DT_Output_2"."E" AS "Estimator" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 1.2832915849738291) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.08607813578354269) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.8894044439483949) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.8440483526982437) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.8314632070652119) THEN 8 ELSE 9 END ELSE 10 END END ELSE 11 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 114.643604636868 AS "E" UNION ALL SELECT 5 AS nid, 324.197801220755 AS "E" UNION ALL SELECT 8 AS nid, 625.11438988113 AS "E" UNION ALL SELECT 9 AS nid, 744.3585452960409 AS "E" UNION ALL SELECT 10 AS nid, 1079.93968141313 AS "E" UNION ALL SELECT 11 AS nid, 263.140281320194 AS "E") AS "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."E" AS "E" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"RF_Model_3" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", "DT_Output_3"."E" AS "Estimator" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", 1 AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 1 AS nid, 501.551921665258 AS "E") AS "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."E" AS "E" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"RF_Model_4" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", "DT_Output_4"."E" AS "Estimator" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1720611847611191) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.2995987337587276) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9050943131641498) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.1684629406141058) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.6811444062470954) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 121.010483188752 AS "E" UNION ALL SELECT 5 AS nid, 232.471129968341 AS "E" UNION ALL SELECT 6 AS nid, 375.22769588219904 AS "E" UNION ALL SELECT 9 AS nid, 654.914595359461 AS "E" UNION ALL SELECT 10 AS nid, 922.6706906730541 AS "E" UNION ALL SELECT 11 AS nid, 1234.84044188759 AS "E") AS "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."E" AS "E" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"RF_Model_5" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", "DT_Output_5"."E" AS "Estimator" 
FROM "DT_Output_5"), 
"DT_node_lookup_6" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" <= -0.3085121074380821) THEN CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.320647039075269) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.05461609806515443) THEN 6 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.8440483526982437) THEN 8 ELSE 9 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_6" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 536.753943920462 AS "E" UNION ALL SELECT 4 AS nid, 319.442790055065 AS "E" UNION ALL SELECT 6 AS nid, 165.257442326524 AS "E" UNION ALL SELECT 8 AS nid, 678.523206692242 AS "E" UNION ALL SELECT 9 AS nid, 1077.5122261946199 AS "E") AS "Values"), 
"DT_Output_6" AS 
(SELECT "DT_node_lookup_6"."KEY" AS "KEY", "DT_node_lookup_6".node_id_2 AS node_id_2, "DT_node_data_6".nid AS nid, "DT_node_data_6"."E" AS "E" 
FROM "DT_node_lookup_6" LEFT OUTER JOIN "DT_node_data_6" ON "DT_node_lookup_6".node_id_2 = "DT_node_data_6".nid), 
"RF_Model_6" AS 
(SELECT "DT_Output_6"."KEY" AS "KEY", "DT_Output_6"."E" AS "Estimator" 
FROM "DT_Output_6"), 
"DT_node_lookup_7" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", 1 AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_7" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 1 AS nid, 536.993947531476 AS "E") AS "Values"), 
"DT_Output_7" AS 
(SELECT "DT_node_lookup_7"."KEY" AS "KEY", "DT_node_lookup_7".node_id_2 AS node_id_2, "DT_node_data_7".nid AS nid, "DT_node_data_7"."E" AS "E" 
FROM "DT_node_lookup_7" LEFT OUTER JOIN "DT_node_data_7" ON "DT_node_lookup_7".node_id_2 = "DT_node_data_7".nid), 
"RF_Model_7" AS 
(SELECT "DT_Output_7"."KEY" AS "KEY", "DT_Output_7"."E" AS "Estimator" 
FROM "DT_Output_7"), 
"DT_node_lookup_8" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.5694634837464194) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= -0.4546740492053614) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.037115344874985) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.5941410036998058) THEN 9 ELSE 10 END ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_8" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 187.132491710053 AS "E" UNION ALL SELECT 5 AS nid, 71.87721204394609 AS "E" UNION ALL SELECT 6 AS nid, 303.09916169328 AS "E" UNION ALL SELECT 9 AS nid, 606.750819326219 AS "E" UNION ALL SELECT 10 AS nid, 804.2318595595959 AS "E" UNION ALL SELECT 11 AS nid, 1135.26139233911 AS "E") AS "Values"), 
"DT_Output_8" AS 
(SELECT "DT_node_lookup_8"."KEY" AS "KEY", "DT_node_lookup_8".node_id_2 AS node_id_2, "DT_node_data_8".nid AS nid, "DT_node_data_8"."E" AS "E" 
FROM "DT_node_lookup_8" LEFT OUTER JOIN "DT_node_data_8" ON "DT_node_lookup_8".node_id_2 = "DT_node_data_8".nid), 
"RF_Model_8" AS 
(SELECT "DT_Output_8"."KEY" AS "KEY", "DT_Output_8"."E" AS "Estimator" 
FROM "DT_Output_8"), 
"DT_node_lookup_9" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC4" <= -1.5236351107422548) THEN 2 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.5694634837464194) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9903186495144072) THEN 6 ELSE 7 END ELSE 8 END ELSE 9 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_9" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, 760.092250656842 AS "E" UNION ALL SELECT 6 AS nid, 96.8771736181163 AS "E" UNION ALL SELECT 7 AS nid, 196.25745145953601 AS "E" UNION ALL SELECT 8 AS nid, 320.371853734997 AS "E" UNION ALL SELECT 9 AS nid, 824.3421933660809 AS "E") AS "Values"), 
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
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS FLOAT) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS FLOAT) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS FLOAT) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS FLOAT) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * -0.6121650749100701 + "ADS_sca_1_OUT"."Feature_1" * 0.5464782903329433 + "ADS_sca_1_OUT"."Feature_2" * -0.5708677485644764 + "ADS_sca_1_OUT"."Feature_3" * -0.02693349038014348 AS "PC1", "ADS_sca_1_OUT"."Feature_0" * 0.4888813380420076 + "ADS_sca_1_OUT"."Feature_1" * 0.2745192584561386 + "ADS_sca_1_OUT"."Feature_2" * -0.2238449995359107 + "ADS_sca_1_OUT"."Feature_3" * -0.7971998684355868 AS "PC2", "ADS_sca_1_OUT"."Feature_0" * -0.024686176636208892 + "ADS_sca_1_OUT"."Feature_1" * 0.7091918576518509 + "ADS_sca_1_OUT"."Feature_2" * 0.7038817472089458 + "ADS_sca_1_OUT"."Feature_3" * 0.03143227114740615 AS "PC3", "ADS_sca_1_OUT"."Feature_0" * -0.6209988333786876 + "ADS_sca_1_OUT"."Feature_1" * -0.3507813620644518 + "ADS_sca_1_OUT"."Feature_2" * 0.358544161544677 + "ADS_sca_1_OUT"."Feature_3" * -0.6022947527521242 AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup_10" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9050943131641498) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.2995987337587276) THEN 5 ELSE 6 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.8407155547641444) THEN 8 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.3794060182730281) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_10" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 82.376268644226 AS "E" UNION ALL SELECT 5 AS nid, 232.307712685131 AS "E" UNION ALL SELECT 6 AS nid, 347.77213074783305 AS "E" UNION ALL SELECT 8 AS nid, 658.35528365625 AS "E" UNION ALL SELECT 10 AS nid, 965.029047797824 AS "E" UNION ALL SELECT 11 AS nid, 1217.62539241217 AS "E") AS "Values"), 
"DT_Output_10" AS 
(SELECT "DT_node_lookup_10"."KEY" AS "KEY", "DT_node_lookup_10".node_id_2 AS node_id_2, "DT_node_data_10".nid AS nid, "DT_node_data_10"."E" AS "E" 
FROM "DT_node_lookup_10" LEFT OUTER JOIN "DT_node_data_10" ON "DT_node_lookup_10".node_id_2 = "DT_node_data_10".nid), 
"RF_Model_10" AS 
(SELECT "DT_Output_10"."KEY" AS "KEY", "DT_Output_10"."E" AS "Estimator" 
FROM "DT_Output_10"), 
"DT_node_lookup_11" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9050943131641498) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -1.60354027583579) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= -0.7880664033078996) THEN 7 ELSE 8 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.037115344874985) THEN 10 ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_11" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 54.44876405521 AS "E" UNION ALL SELECT 5 AS nid, 152.952595387312 AS "E" UNION ALL SELECT 7 AS nid, 403.30366612908404 AS "E" UNION ALL SELECT 8 AS nid, 247.232155654711 AS "E" UNION ALL SELECT 10 AS nid, 697.7779006241369 AS "E" UNION ALL SELECT 11 AS nid, 1088.46350762187 AS "E") AS "Values"), 
"DT_Output_11" AS 
(SELECT "DT_node_lookup_11"."KEY" AS "KEY", "DT_node_lookup_11".node_id_2 AS node_id_2, "DT_node_data_11".nid AS nid, "DT_node_data_11"."E" AS "E" 
FROM "DT_node_lookup_11" LEFT OUTER JOIN "DT_node_data_11" ON "DT_node_lookup_11".node_id_2 = "DT_node_data_11".nid), 
"RF_Model_11" AS 
(SELECT "DT_Output_11"."KEY" AS "KEY", "DT_Output_11"."E" AS "Estimator" 
FROM "DT_Output_11"), 
"DT_node_lookup_12" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9050943131641498) THEN 3 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC2" <= 0.6171268738572349) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.3456080555411821) THEN 6 ELSE 7 END ELSE 8 END END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.037115344874985) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.5941410036998058) THEN 11 ELSE 12 END ELSE 13 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_12" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 115.00437033598601 AS "E" UNION ALL SELECT 6 AS nid, 269.18542588919604 AS "E" UNION ALL SELECT 7 AS nid, 361.366638346407 AS "E" UNION ALL SELECT 8 AS nid, 148.89872192879199 AS "E" UNION ALL SELECT 11 AS nid, 620.820617988694 AS "E" UNION ALL SELECT 12 AS nid, 802.4703212115551 AS "E" UNION ALL SELECT 13 AS nid, 1109.65734232405 AS "E") AS "Values"), 
"DT_Output_12" AS 
(SELECT "DT_node_lookup_12"."KEY" AS "KEY", "DT_node_lookup_12".node_id_2 AS node_id_2, "DT_node_data_12".nid AS nid, "DT_node_data_12"."E" AS "E" 
FROM "DT_node_lookup_12" LEFT OUTER JOIN "DT_node_data_12" ON "DT_node_lookup_12".node_id_2 = "DT_node_data_12".nid), 
"RF_Model_12" AS 
(SELECT "DT_Output_12"."KEY" AS "KEY", "DT_Output_12"."E" AS "Estimator" 
FROM "DT_Output_12"), 
"DT_node_lookup_13" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1948235952537968) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.5694634837464194) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= -1.3929600097741788) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.8407155547641444) THEN 8 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.1684629406141058) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_13" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 233.1811434761 AS "E" UNION ALL SELECT 5 AS nid, 129.133501521909 AS "E" UNION ALL SELECT 6 AS nid, 374.181908302832 AS "E" UNION ALL SELECT 8 AS nid, 661.135318901994 AS "E" UNION ALL SELECT 10 AS nid, 932.0633594956329 AS "E" UNION ALL SELECT 11 AS nid, 1110.77171544369 AS "E") AS "Values"), 
"DT_Output_13" AS 
(SELECT "DT_node_lookup_13"."KEY" AS "KEY", "DT_node_lookup_13".node_id_2 AS node_id_2, "DT_node_data_13".nid AS nid, "DT_node_data_13"."E" AS "E" 
FROM "DT_node_lookup_13" LEFT OUTER JOIN "DT_node_data_13" ON "DT_node_lookup_13".node_id_2 = "DT_node_data_13".nid), 
"RF_Model_13" AS 
(SELECT "DT_Output_13"."KEY" AS "KEY", "DT_Output_13"."E" AS "Estimator" 
FROM "DT_Output_13"), 
"DT_node_lookup_14" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.2421068215595984) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= 0.5198913650277515) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.3124321723756805) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.9903186495144072) THEN 5 ELSE 6 END ELSE 7 END ELSE 8 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.113763098019989) THEN 10 ELSE 11 END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_14" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 5 AS nid, 138.32321682723 AS "E" UNION ALL SELECT 6 AS nid, 231.546978068241 AS "E" UNION ALL SELECT 7 AS nid, 480.44086681108 AS "E" UNION ALL SELECT 8 AS nid, 128.21186770393498 AS "E" UNION ALL SELECT 10 AS nid, 821.7928338482781 AS "E" UNION ALL SELECT 11 AS nid, 1228.01343831164 AS "E") AS "Values"), 
"DT_Output_14" AS 
(SELECT "DT_node_lookup_14"."KEY" AS "KEY", "DT_node_lookup_14".node_id_2 AS node_id_2, "DT_node_data_14".nid AS nid, "DT_node_data_14"."E" AS "E" 
FROM "DT_node_lookup_14" LEFT OUTER JOIN "DT_node_data_14" ON "DT_node_lookup_14".node_id_2 = "DT_node_data_14".nid), 
"RF_Model_14" AS 
(SELECT "DT_Output_14"."KEY" AS "KEY", "DT_Output_14"."E" AS "Estimator" 
FROM "DT_Output_14"), 
"DT_node_lookup_15" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.1720611847611191) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -0.5970193021180621) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= -1.3612994975134998) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 0.8407155547641444) THEN 8 ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= 1.1684629406141058) THEN 10 ELSE 11 END END END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
"DT_node_data_15" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 4 AS nid, 58.3456415886848 AS "E" UNION ALL SELECT 5 AS nid, 185.508252477947 AS "E" UNION ALL SELECT 6 AS nid, 339.442224691421 AS "E" UNION ALL SELECT 8 AS nid, 689.5616321236861 AS "E" UNION ALL SELECT 10 AS nid, 918.9834492721479 AS "E" UNION ALL SELECT 11 AS nid, 1154.8252445943401 AS "E") AS "Values"), 
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