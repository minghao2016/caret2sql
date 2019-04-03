-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_cforest
-- Dataset : BinaryClass_10
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "RF_0" AS 
(WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", 1 AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 1 AS nid, 0.5 AS "P_0", 0.5 AS "P_1", 0 AS "D", 0.5 AS "DP") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_0" AS "P_0", "DT_node_data"."P_1" AS "P_1", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid), 
"RF_Model_0" AS 
(SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output"."P_0" AS "Proba_0", CASE WHEN ("DT_Output"."P_0" IS NULL OR "DT_Output"."P_0" > 0.0) THEN ln("DT_Output"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output"."P_1" AS "Proba_1", CASE WHEN ("DT_Output"."P_1" IS NULL OR "DT_Output"."P_1" > 0.0) THEN ln("DT_Output"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output"), 
"DT_node_lookup_1" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_7" <= 0.016378282006633733) THEN CASE WHEN ("ADS"."Feature_6" <= 1.053279620737388) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_5" <= -1.2056689228229829) THEN 6 ELSE 7 END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_1" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 4 AS nid, 0.571428571428571 AS "P_0", 0.428571428571429 AS "P_1", 0 AS "D", 0.571428571428571 AS "DP" UNION ALL SELECT 6 AS nid, 0.5 AS "P_0", 0.5 AS "P_1", 0 AS "D", 0.5 AS "DP" UNION ALL SELECT 7 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP") AS "Values"), 
"DT_Output_1" AS 
(SELECT "DT_node_lookup_1"."KEY" AS "KEY", "DT_node_lookup_1".node_id_2 AS node_id_2, "DT_node_data_1".nid AS nid, "DT_node_data_1"."P_0" AS "P_0", "DT_node_data_1"."P_1" AS "P_1", "DT_node_data_1"."D" AS "D", "DT_node_data_1"."DP" AS "DP" 
FROM "DT_node_lookup_1" LEFT OUTER JOIN "DT_node_data_1" ON "DT_node_lookup_1".node_id_2 = "DT_node_data_1".nid), 
"RF_Model_1" AS 
(SELECT "DT_Output_1"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_1"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_1"."P_0" IS NULL OR "DT_Output_1"."P_0" > 0.0) THEN ln("DT_Output_1"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_1"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_1"."P_1" IS NULL OR "DT_Output_1"."P_1" > 0.0) THEN ln("DT_Output_1"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_1"), 
"DT_node_lookup_2" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_9" <= -0.2746950836858671) THEN CASE WHEN ("ADS"."Feature_5" <= 1.4442721907375733) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_0" <= -0.9362057255475572) THEN 6 ELSE 7 END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_2" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 4 AS nid, 0.75 AS "P_0", 0.25 AS "P_1", 0 AS "D", 0.75 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 7 AS nid, 0.230769230769231 AS "P_0", 0.769230769230769 AS "P_1", 1 AS "D", 0.769230769230769 AS "DP") AS "Values"), 
"DT_Output_2" AS 
(SELECT "DT_node_lookup_2"."KEY" AS "KEY", "DT_node_lookup_2".node_id_2 AS node_id_2, "DT_node_data_2".nid AS nid, "DT_node_data_2"."P_0" AS "P_0", "DT_node_data_2"."P_1" AS "P_1", "DT_node_data_2"."D" AS "D", "DT_node_data_2"."DP" AS "DP" 
FROM "DT_node_lookup_2" LEFT OUTER JOIN "DT_node_data_2" ON "DT_node_lookup_2".node_id_2 = "DT_node_data_2".nid), 
"RF_Model_2" AS 
(SELECT "DT_Output_2"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_2"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_2"."P_0" IS NULL OR "DT_Output_2"."P_0" > 0.0) THEN ln("DT_Output_2"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_2"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_2"."P_1" IS NULL OR "DT_Output_2"."P_1" > 0.0) THEN ln("DT_Output_2"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_2"), 
"DT_node_lookup_3" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_0" <= -0.060448736905912626) THEN 2 ELSE CASE WHEN ("ADS"."Feature_0" <= 1.07137559315129) THEN CASE WHEN ("ADS"."Feature_4" <= -0.1520651439757029) THEN CASE WHEN ("ADS"."Feature_5" <= -1.2056689228229829) THEN 6 ELSE 7 END ELSE 8 END ELSE 9 END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_3" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.030303030303030293 AS "P_0", 0.9696969696969697 AS "P_1", 1 AS "D", 0.9696969696969697 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 7 AS nid, 0.833333333333333 AS "P_0", 0.166666666666667 AS "P_1", 0 AS "D", 0.833333333333333 AS "DP" UNION ALL SELECT 8 AS nid, 0.846153846153846 AS "P_0", 0.153846153846154 AS "P_1", 0 AS "D", 0.846153846153846 AS "DP" UNION ALL SELECT 9 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP") AS "Values"), 
"DT_Output_3" AS 
(SELECT "DT_node_lookup_3"."KEY" AS "KEY", "DT_node_lookup_3".node_id_2 AS node_id_2, "DT_node_data_3".nid AS nid, "DT_node_data_3"."P_0" AS "P_0", "DT_node_data_3"."P_1" AS "P_1", "DT_node_data_3"."D" AS "D", "DT_node_data_3"."DP" AS "DP" 
FROM "DT_node_lookup_3" LEFT OUTER JOIN "DT_node_data_3" ON "DT_node_lookup_3".node_id_2 = "DT_node_data_3".nid), 
"RF_Model_3" AS 
(SELECT "DT_Output_3"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_3"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_3"."P_0" IS NULL OR "DT_Output_3"."P_0" > 0.0) THEN ln("DT_Output_3"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_3"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_3"."P_1" IS NULL OR "DT_Output_3"."P_1" > 0.0) THEN ln("DT_Output_3"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_3"), 
"DT_node_lookup_4" AS 
(SELECT "ADS"."KEY" AS "KEY", 1 AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_4" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 1 AS nid, 0.4375 AS "P_0", 0.5625 AS "P_1", 1 AS "D", 0.5625 AS "DP") AS "Values"), 
"DT_Output_4" AS 
(SELECT "DT_node_lookup_4"."KEY" AS "KEY", "DT_node_lookup_4".node_id_2 AS node_id_2, "DT_node_data_4".nid AS nid, "DT_node_data_4"."P_0" AS "P_0", "DT_node_data_4"."P_1" AS "P_1", "DT_node_data_4"."D" AS "D", "DT_node_data_4"."DP" AS "DP" 
FROM "DT_node_lookup_4" LEFT OUTER JOIN "DT_node_data_4" ON "DT_node_lookup_4".node_id_2 = "DT_node_data_4".nid), 
"RF_Model_4" AS 
(SELECT "DT_Output_4"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_4"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_4"."P_0" IS NULL OR "DT_Output_4"."P_0" > 0.0) THEN ln("DT_Output_4"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_4"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_4"."P_1" IS NULL OR "DT_Output_4"."P_1" > 0.0) THEN ln("DT_Output_4"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_4"), 
"DT_node_lookup_5" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_9" <= 0.015023609022383418) THEN CASE WHEN ("ADS"."Feature_9" <= -1.0494568450298771) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_7" <= -0.2431182264780904) THEN 6 ELSE 7 END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_5" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 4 AS nid, 0.642857142857143 AS "P_0", 0.357142857142857 AS "P_1", 0 AS "D", 0.642857142857143 AS "DP" UNION ALL SELECT 6 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 7 AS nid, 0.3 AS "P_0", 0.7 AS "P_1", 1 AS "D", 0.7 AS "DP") AS "Values"), 
"DT_Output_5" AS 
(SELECT "DT_node_lookup_5"."KEY" AS "KEY", "DT_node_lookup_5".node_id_2 AS node_id_2, "DT_node_data_5".nid AS nid, "DT_node_data_5"."P_0" AS "P_0", "DT_node_data_5"."P_1" AS "P_1", "DT_node_data_5"."D" AS "D", "DT_node_data_5"."DP" AS "DP" 
FROM "DT_node_lookup_5" LEFT OUTER JOIN "DT_node_data_5" ON "DT_node_lookup_5".node_id_2 = "DT_node_data_5".nid), 
"RF_Model_5" AS 
(SELECT "DT_Output_5"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_5"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_5"."P_0" IS NULL OR "DT_Output_5"."P_0" > 0.0) THEN ln("DT_Output_5"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_5"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_5"."P_1" IS NULL OR "DT_Output_5"."P_1" > 0.0) THEN ln("DT_Output_5"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_5"), 
"DT_node_lookup_6" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_7" <= 0.016378282006633733) THEN CASE WHEN ("ADS"."Feature_6" <= 0.4520303768396993) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_8" <= -0.9675784633481912) THEN 6 ELSE CASE WHEN ("ADS"."Feature_6" <= 0.2660431915770708) THEN 8 ELSE 9 END END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_6" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 4 AS nid, 0.285714285714286 AS "P_0", 0.714285714285714 AS "P_1", 1 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 6 AS nid, 0.428571428571429 AS "P_0", 0.571428571428571 AS "P_1", 1 AS "D", 0.571428571428571 AS "DP" UNION ALL SELECT 8 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 9 AS nid, 0.6 AS "P_0", 0.4 AS "P_1", 0 AS "D", 0.6 AS "DP") AS "Values"), 
"DT_Output_6" AS 
(SELECT "DT_node_lookup_6"."KEY" AS "KEY", "DT_node_lookup_6".node_id_2 AS node_id_2, "DT_node_data_6".nid AS nid, "DT_node_data_6"."P_0" AS "P_0", "DT_node_data_6"."P_1" AS "P_1", "DT_node_data_6"."D" AS "D", "DT_node_data_6"."DP" AS "DP" 
FROM "DT_node_lookup_6" LEFT OUTER JOIN "DT_node_data_6" ON "DT_node_lookup_6".node_id_2 = "DT_node_data_6".nid), 
"RF_Model_6" AS 
(SELECT "DT_Output_6"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_6"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_6"."P_0" IS NULL OR "DT_Output_6"."P_0" > 0.0) THEN ln("DT_Output_6"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_6"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_6"."P_1" IS NULL OR "DT_Output_6"."P_1" > 0.0) THEN ln("DT_Output_6"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_6"), 
"DT_node_lookup_7" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_6" <= 1.053279620737388) THEN CASE WHEN ("ADS"."Feature_9" <= -0.2746950836858671) THEN 3 ELSE 4 END ELSE 5 END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_7" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.9487179487179488 AS "P_0", 0.05128205128205129 AS "P_1", 0 AS "D", 0.9487179487179488 AS "DP" UNION ALL SELECT 4 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 5 AS nid, 0.9230769230769231 AS "P_0", 0.07692307692307691 AS "P_1", 0 AS "D", 0.9230769230769231 AS "DP") AS "Values"), 
"DT_Output_7" AS 
(SELECT "DT_node_lookup_7"."KEY" AS "KEY", "DT_node_lookup_7".node_id_2 AS node_id_2, "DT_node_data_7".nid AS nid, "DT_node_data_7"."P_0" AS "P_0", "DT_node_data_7"."P_1" AS "P_1", "DT_node_data_7"."D" AS "D", "DT_node_data_7"."DP" AS "DP" 
FROM "DT_node_lookup_7" LEFT OUTER JOIN "DT_node_data_7" ON "DT_node_lookup_7".node_id_2 = "DT_node_data_7".nid), 
"RF_Model_7" AS 
(SELECT "DT_Output_7"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_7"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_7"."P_0" IS NULL OR "DT_Output_7"."P_0" > 0.0) THEN ln("DT_Output_7"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_7"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_7"."P_1" IS NULL OR "DT_Output_7"."P_1" > 0.0) THEN ln("DT_Output_7"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_7"), 
"DT_node_lookup_8" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_9" <= -0.2746950836858671) THEN CASE WHEN ("ADS"."Feature_2" <= -0.8608076793809787) THEN 3 ELSE CASE WHEN ("ADS"."Feature_3" <= 1.227621399920398) THEN 5 ELSE 6 END END ELSE 7 END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_8" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.5 AS "P_0", 0.5 AS "P_1", 0 AS "D", 0.5 AS "DP" UNION ALL SELECT 5 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 6 AS nid, 0.75 AS "P_0", 0.25 AS "P_1", 0 AS "D", 0.75 AS "DP" UNION ALL SELECT 7 AS nid, 0.029411764705882387 AS "P_0", 0.9705882352941175 AS "P_1", 1 AS "D", 0.9705882352941175 AS "DP") AS "Values"), 
"DT_Output_8" AS 
(SELECT "DT_node_lookup_8"."KEY" AS "KEY", "DT_node_lookup_8".node_id_2 AS node_id_2, "DT_node_data_8".nid AS nid, "DT_node_data_8"."P_0" AS "P_0", "DT_node_data_8"."P_1" AS "P_1", "DT_node_data_8"."D" AS "D", "DT_node_data_8"."DP" AS "DP" 
FROM "DT_node_lookup_8" LEFT OUTER JOIN "DT_node_data_8" ON "DT_node_lookup_8".node_id_2 = "DT_node_data_8".nid), 
"RF_Model_8" AS 
(SELECT "DT_Output_8"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_8"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_8"."P_0" IS NULL OR "DT_Output_8"."P_0" > 0.0) THEN ln("DT_Output_8"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_8"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_8"."P_1" IS NULL OR "DT_Output_8"."P_1" > 0.0) THEN ln("DT_Output_8"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_8"), 
"DT_node_lookup_9" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_7" <= -0.04188234680584454) THEN CASE WHEN ("ADS"."Feature_9" <= 0.4282507734309758) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_9" <= -1.0494568450298771) THEN 6 ELSE 7 END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_9" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.285714285714286 AS "P_0", 0.714285714285714 AS "P_1", 1 AS "D", 0.714285714285714 AS "DP" UNION ALL SELECT 4 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 6 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 7 AS nid, 0.62962962962963 AS "P_0", 0.37037037037037 AS "P_1", 0 AS "D", 0.62962962962963 AS "DP") AS "Values"), 
"DT_Output_9" AS 
(SELECT "DT_node_lookup_9"."KEY" AS "KEY", "DT_node_lookup_9".node_id_2 AS node_id_2, "DT_node_data_9".nid AS nid, "DT_node_data_9"."P_0" AS "P_0", "DT_node_data_9"."P_1" AS "P_1", "DT_node_data_9"."D" AS "D", "DT_node_data_9"."DP" AS "DP" 
FROM "DT_node_lookup_9" LEFT OUTER JOIN "DT_node_data_9" ON "DT_node_lookup_9".node_id_2 = "DT_node_data_9".nid), 
"RF_Model_9" AS 
(SELECT "DT_Output_9"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_9"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_9"."P_0" IS NULL OR "DT_Output_9"."P_0" > 0.0) THEN ln("DT_Output_9"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_9"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_9"."P_1" IS NULL OR "DT_Output_9"."P_1" > 0.0) THEN ln("DT_Output_9"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_9")
 SELECT "RF_esu_0"."KEY", "RF_esu_0"."Score_0", "RF_esu_0"."Proba_0", "RF_esu_0"."LogProba_0", "RF_esu_0"."Score_1", "RF_esu_0"."Proba_1", "RF_esu_0"."LogProba_1" 
FROM (SELECT "RF_Model_0"."KEY" AS "KEY", CAST("RF_Model_0"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_0"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_0"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_0"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_0"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_0"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_0" UNION ALL SELECT "RF_Model_1"."KEY" AS "KEY", CAST("RF_Model_1"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_1"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_1"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_1"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_1"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_1"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_1" UNION ALL SELECT "RF_Model_2"."KEY" AS "KEY", CAST("RF_Model_2"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_2"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_2"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_2"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_2"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_2"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_2" UNION ALL SELECT "RF_Model_3"."KEY" AS "KEY", CAST("RF_Model_3"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_3"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_3"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_3"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_3"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_3"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_3" UNION ALL SELECT "RF_Model_4"."KEY" AS "KEY", CAST("RF_Model_4"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_4"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_4"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_4"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_4"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_4"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_4" UNION ALL SELECT "RF_Model_5"."KEY" AS "KEY", CAST("RF_Model_5"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_5"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_5"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_5"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_5"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_5"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_5" UNION ALL SELECT "RF_Model_6"."KEY" AS "KEY", CAST("RF_Model_6"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_6"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_6"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_6"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_6"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_6"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_6" UNION ALL SELECT "RF_Model_7"."KEY" AS "KEY", CAST("RF_Model_7"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_7"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_7"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_7"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_7"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_7"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_7" UNION ALL SELECT "RF_Model_8"."KEY" AS "KEY", CAST("RF_Model_8"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_8"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_8"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_8"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_8"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_8"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_8" UNION ALL SELECT "RF_Model_9"."KEY" AS "KEY", CAST("RF_Model_9"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_9"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_9"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_9"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_9"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_9"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_9") AS "RF_esu_0"), 
"RF_1" AS 
(WITH "DT_node_lookup_10" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_6" <= -1.286187674886164) THEN 2 ELSE 3 END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_10" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 3 AS nid, 0.534246575342466 AS "P_0", 0.465753424657534 AS "P_1", 0 AS "D", 0.534246575342466 AS "DP") AS "Values"), 
"DT_Output_10" AS 
(SELECT "DT_node_lookup_10"."KEY" AS "KEY", "DT_node_lookup_10".node_id_2 AS node_id_2, "DT_node_data_10".nid AS nid, "DT_node_data_10"."P_0" AS "P_0", "DT_node_data_10"."P_1" AS "P_1", "DT_node_data_10"."D" AS "D", "DT_node_data_10"."DP" AS "DP" 
FROM "DT_node_lookup_10" LEFT OUTER JOIN "DT_node_data_10" ON "DT_node_lookup_10".node_id_2 = "DT_node_data_10".nid), 
"RF_Model_10" AS 
(SELECT "DT_Output_10"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_10"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_10"."P_0" IS NULL OR "DT_Output_10"."P_0" > 0.0) THEN ln("DT_Output_10"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_10"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_10"."P_1" IS NULL OR "DT_Output_10"."P_1" > 0.0) THEN ln("DT_Output_10"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_10"), 
"DT_node_lookup_11" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_9" <= 0.015023609022383418) THEN 2 ELSE 3 END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_11" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.78 AS "P_0", 0.22 AS "P_1", 0 AS "D", 0.78 AS "DP" UNION ALL SELECT 3 AS nid, 0.03333333333333329 AS "P_0", 0.9666666666666668 AS "P_1", 1 AS "D", 0.9666666666666668 AS "DP") AS "Values"), 
"DT_Output_11" AS 
(SELECT "DT_node_lookup_11"."KEY" AS "KEY", "DT_node_lookup_11".node_id_2 AS node_id_2, "DT_node_data_11".nid AS nid, "DT_node_data_11"."P_0" AS "P_0", "DT_node_data_11"."P_1" AS "P_1", "DT_node_data_11"."D" AS "D", "DT_node_data_11"."DP" AS "DP" 
FROM "DT_node_lookup_11" LEFT OUTER JOIN "DT_node_data_11" ON "DT_node_lookup_11".node_id_2 = "DT_node_data_11".nid), 
"RF_Model_11" AS 
(SELECT "DT_Output_11"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_11"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_11"."P_0" IS NULL OR "DT_Output_11"."P_0" > 0.0) THEN ln("DT_Output_11"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_11"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_11"."P_1" IS NULL OR "DT_Output_11"."P_1" > 0.0) THEN ln("DT_Output_11"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_11"), 
"DT_node_lookup_12" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_6" <= 0.6098850048713202) THEN CASE WHEN ("ADS"."Feature_0" <= -0.4799051245976523) THEN 3 ELSE 4 END ELSE CASE WHEN ("ADS"."Feature_3" <= 0.8116567839201924) THEN 6 ELSE 7 END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_12" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 4 AS nid, 0.5 AS "P_0", 0.5 AS "P_1", 0 AS "D", 0.5 AS "DP" UNION ALL SELECT 6 AS nid, 0.9473684210526315 AS "P_0", 0.052631578947368376 AS "P_1", 0 AS "D", 0.9473684210526315 AS "DP" UNION ALL SELECT 7 AS nid, 0.4 AS "P_0", 0.6 AS "P_1", 1 AS "D", 0.6 AS "DP") AS "Values"), 
"DT_Output_12" AS 
(SELECT "DT_node_lookup_12"."KEY" AS "KEY", "DT_node_lookup_12".node_id_2 AS node_id_2, "DT_node_data_12".nid AS nid, "DT_node_data_12"."P_0" AS "P_0", "DT_node_data_12"."P_1" AS "P_1", "DT_node_data_12"."D" AS "D", "DT_node_data_12"."DP" AS "DP" 
FROM "DT_node_lookup_12" LEFT OUTER JOIN "DT_node_data_12" ON "DT_node_lookup_12".node_id_2 = "DT_node_data_12".nid), 
"RF_Model_12" AS 
(SELECT "DT_Output_12"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_12"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_12"."P_0" IS NULL OR "DT_Output_12"."P_0" > 0.0) THEN ln("DT_Output_12"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_12"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_12"."P_1" IS NULL OR "DT_Output_12"."P_1" > 0.0) THEN ln("DT_Output_12"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_12"), 
"DT_node_lookup_13" AS 
(SELECT "ADS"."KEY" AS "KEY", 1 AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_13" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 1 AS nid, 0.5625 AS "P_0", 0.4375 AS "P_1", 0 AS "D", 0.5625 AS "DP") AS "Values"), 
"DT_Output_13" AS 
(SELECT "DT_node_lookup_13"."KEY" AS "KEY", "DT_node_lookup_13".node_id_2 AS node_id_2, "DT_node_data_13".nid AS nid, "DT_node_data_13"."P_0" AS "P_0", "DT_node_data_13"."P_1" AS "P_1", "DT_node_data_13"."D" AS "D", "DT_node_data_13"."DP" AS "DP" 
FROM "DT_node_lookup_13" LEFT OUTER JOIN "DT_node_data_13" ON "DT_node_lookup_13".node_id_2 = "DT_node_data_13".nid), 
"RF_Model_13" AS 
(SELECT "DT_Output_13"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_13"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_13"."P_0" IS NULL OR "DT_Output_13"."P_0" > 0.0) THEN ln("DT_Output_13"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_13"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_13"."P_1" IS NULL OR "DT_Output_13"."P_1" > 0.0) THEN ln("DT_Output_13"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_13"), 
"DT_node_lookup_14" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_9" <= 0.015023609022383418) THEN CASE WHEN ("ADS"."Feature_9" <= -1.0494568450298771) THEN 3 ELSE CASE WHEN ("ADS"."Feature_1" <= 0.01559558553610639) THEN 5 ELSE 6 END END ELSE 7 END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_14" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 3 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 5 AS nid, 0.4 AS "P_0", 0.6 AS "P_1", 1 AS "D", 0.6 AS "DP" UNION ALL SELECT 6 AS nid, 0.85 AS "P_0", 0.15 AS "P_1", 0 AS "D", 0.85 AS "DP" UNION ALL SELECT 7 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP") AS "Values"), 
"DT_Output_14" AS 
(SELECT "DT_node_lookup_14"."KEY" AS "KEY", "DT_node_lookup_14".node_id_2 AS node_id_2, "DT_node_data_14".nid AS nid, "DT_node_data_14"."P_0" AS "P_0", "DT_node_data_14"."P_1" AS "P_1", "DT_node_data_14"."D" AS "D", "DT_node_data_14"."DP" AS "DP" 
FROM "DT_node_lookup_14" LEFT OUTER JOIN "DT_node_data_14" ON "DT_node_lookup_14".node_id_2 = "DT_node_data_14".nid), 
"RF_Model_14" AS 
(SELECT "DT_Output_14"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_14"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_14"."P_0" IS NULL OR "DT_Output_14"."P_0" > 0.0) THEN ln("DT_Output_14"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_14"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_14"."P_1" IS NULL OR "DT_Output_14"."P_1" > 0.0) THEN ln("DT_Output_14"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_14"), 
"DT_node_lookup_15" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_0" <= -0.7343297083876039) THEN 2 ELSE CASE WHEN ("ADS"."Feature_5" <= -0.9991732885159312) THEN CASE WHEN ("ADS"."Feature_7" <= 0.3326253755149539) THEN 5 ELSE 6 END ELSE CASE WHEN ("ADS"."Feature_3" <= -0.5026674914419033) THEN 8 ELSE 9 END END END AS node_id_2 
FROM "BinaryClass_10" AS "ADS"), 
"DT_node_data_15" AS 
(SELECT "Values".nid AS nid, "Values"."P_0" AS "P_0", "Values"."P_1" AS "P_1", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 2 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 5 AS nid, 0.0 AS "P_0", 1.0 AS "P_1", 1 AS "D", 1.0 AS "DP" UNION ALL SELECT 6 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP" UNION ALL SELECT 8 AS nid, 0.857142857142857 AS "P_0", 0.142857142857143 AS "P_1", 0 AS "D", 0.857142857142857 AS "DP" UNION ALL SELECT 9 AS nid, 1.0 AS "P_0", 0.0 AS "P_1", 0 AS "D", 1.0 AS "DP") AS "Values"), 
"DT_Output_15" AS 
(SELECT "DT_node_lookup_15"."KEY" AS "KEY", "DT_node_lookup_15".node_id_2 AS node_id_2, "DT_node_data_15".nid AS nid, "DT_node_data_15"."P_0" AS "P_0", "DT_node_data_15"."P_1" AS "P_1", "DT_node_data_15"."D" AS "D", "DT_node_data_15"."DP" AS "DP" 
FROM "DT_node_lookup_15" LEFT OUTER JOIN "DT_node_data_15" ON "DT_node_lookup_15".node_id_2 = "DT_node_data_15".nid), 
"RF_Model_15" AS 
(SELECT "DT_Output_15"."KEY" AS "KEY", CAST(NULL AS FLOAT) AS "Score_0", "DT_Output_15"."P_0" AS "Proba_0", CASE WHEN ("DT_Output_15"."P_0" IS NULL OR "DT_Output_15"."P_0" > 0.0) THEN ln("DT_Output_15"."P_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CAST(NULL AS FLOAT) AS "Score_1", "DT_Output_15"."P_1" AS "Proba_1", CASE WHEN ("DT_Output_15"."P_1" IS NULL OR "DT_Output_15"."P_1" > 0.0) THEN ln("DT_Output_15"."P_1") ELSE -1.79769313486231e+308 END AS "LogProba_1" 
FROM "DT_Output_15")
 SELECT "RF_esu_1"."KEY", "RF_esu_1"."Score_0", "RF_esu_1"."Proba_0", "RF_esu_1"."LogProba_0", "RF_esu_1"."Score_1", "RF_esu_1"."Proba_1", "RF_esu_1"."LogProba_1" 
FROM (SELECT "RF_Model_10"."KEY" AS "KEY", CAST("RF_Model_10"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_10"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_10"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_10"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_10"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_10"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_10" UNION ALL SELECT "RF_Model_11"."KEY" AS "KEY", CAST("RF_Model_11"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_11"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_11"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_11"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_11"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_11"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_11" UNION ALL SELECT "RF_Model_12"."KEY" AS "KEY", CAST("RF_Model_12"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_12"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_12"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_12"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_12"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_12"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_12" UNION ALL SELECT "RF_Model_13"."KEY" AS "KEY", CAST("RF_Model_13"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_13"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_13"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_13"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_13"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_13"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_13" UNION ALL SELECT "RF_Model_14"."KEY" AS "KEY", CAST("RF_Model_14"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_14"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_14"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_14"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_14"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_14"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_14" UNION ALL SELECT "RF_Model_15"."KEY" AS "KEY", CAST("RF_Model_15"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_Model_15"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_Model_15"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_Model_15"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_Model_15"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_Model_15"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_Model_15") AS "RF_esu_1"), 
"RF" AS 
(SELECT "RFbig_esu"."KEY" AS "KEY", "RFbig_esu"."Score_0" AS "Score_0", "RFbig_esu"."Proba_0" AS "Proba_0", "RFbig_esu"."LogProba_0" AS "LogProba_0", "RFbig_esu"."Score_1" AS "Score_1", "RFbig_esu"."Proba_1" AS "Proba_1", "RFbig_esu"."LogProba_1" AS "LogProba_1" 
FROM (SELECT "RF_0"."KEY" AS "KEY", CAST("RF_0"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_0"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_0"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_0"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_0"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_0"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_0" UNION ALL SELECT "RF_1"."KEY" AS "KEY", CAST("RF_1"."Score_0" AS FLOAT) AS "Score_0", CAST("RF_1"."Proba_0" AS FLOAT) AS "Proba_0", CAST("RF_1"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("RF_1"."Score_1" AS FLOAT) AS "Score_1", CAST("RF_1"."Proba_1" AS FLOAT) AS "Proba_1", CAST("RF_1"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM "RF_1") AS "RFbig_esu"), 
"RF_avg" AS 
(SELECT "T"."KEY" AS "KEY", CAST("T"."Score_0" AS FLOAT) AS "Score_0", CAST("T"."Proba_0" AS FLOAT) AS "Proba_0", CAST("T"."LogProba_0" AS FLOAT) AS "LogProba_0", CAST("T"."Score_1" AS FLOAT) AS "Score_1", CAST("T"."Proba_1" AS FLOAT) AS "Proba_1", CAST("T"."LogProba_1" AS FLOAT) AS "LogProba_1" 
FROM (SELECT "RF"."KEY" AS "KEY", avg(CAST("RF"."Score_0" AS FLOAT)) AS "Score_0", avg(CAST("RF"."Proba_0" AS FLOAT)) AS "Proba_0", CAST(NULL AS FLOAT) AS "LogProba_0", avg(CAST("RF"."Score_1" AS FLOAT)) AS "Score_1", avg(CAST("RF"."Proba_1" AS FLOAT)) AS "Proba_1", CAST(NULL AS FLOAT) AS "LogProba_1" 
FROM "RF" GROUP BY "RF"."KEY") AS "T"), 
orig_cte AS 
(SELECT "RF_avg"."KEY" AS "KEY", "RF_avg"."Score_0" AS "Score_0", "RF_avg"."Score_1" AS "Score_1", "RF_avg"."Proba_0" AS "Proba_0", "RF_avg"."Proba_1" AS "Proba_1", "RF_avg"."LogProba_0" AS "LogProba_0", "RF_avg"."LogProba_1" AS "LogProba_1", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS FLOAT) AS "DecisionProba" 
FROM "RF_avg"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu.class AS class, scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS class, orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS class, orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Proba" AS "max_Proba" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Proba") AS "max_Proba" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union.class AS class, score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba" 
FROM score_class_union LEFT OUTER JOIN score_max ON score_class_union."KEY_u" = score_max."KEY"), 
arg_max_cte AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Proba" AS "max_Proba", "arg_max_t_Proba"."KEY_Proba" AS "KEY_Proba", "arg_max_t_Proba"."arg_max_Proba" AS "arg_max_Proba" 
FROM score_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Proba", max(union_with_max.class) AS "arg_max_Proba" 
FROM union_with_max 
WHERE union_with_max."max_Proba" <= union_with_max."Proba" GROUP BY union_with_max."KEY") AS "arg_max_t_Proba" ON score_max."KEY" = "arg_max_t_Proba"."KEY_Proba")
 SELECT arg_max_cte."KEY" AS "KEY", arg_max_cte."Score_0" AS "Score_0", arg_max_cte."Score_1" AS "Score_1", arg_max_cte."Proba_0" AS "Proba_0", arg_max_cte."Proba_1" AS "Proba_1", CASE WHEN (arg_max_cte."Proba_0" IS NULL OR arg_max_cte."Proba_0" > 0.0) THEN ln(arg_max_cte."Proba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."Proba_1" IS NULL OR arg_max_cte."Proba_1" > 0.0) THEN ln(arg_max_cte."Proba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", arg_max_cte."arg_max_Proba" AS "Decision", arg_max_cte."max_Proba" AS "DecisionProba" 
FROM arg_max_cte