-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_ctree_pca
-- Dataset : iris_str_tgt
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "ADS_sca_1_OUT" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - CAST(5.8475 AS DOUBLE PRECISION)) / CAST(0.83050683118121 AS DOUBLE PRECISION) AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - CAST(3.040833333333333 AS DOUBLE PRECISION)) / CAST(0.441063617685633 AS DOUBLE PRECISION) AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - CAST(3.844166666666666 AS DOUBLE PRECISION)) / CAST(1.718157887567567 AS DOUBLE PRECISION) AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - CAST(1.245833333333333 AS DOUBLE PRECISION)) / CAST(0.75179290834033 AS DOUBLE PRECISION) AS "Feature_3" 
FROM iris_str_tgt AS "ADS"), 
"ADS_pre_1_OUT" AS 
(SELECT "ADS_sca_1_OUT"."KEY" AS "KEY", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.526301451438797 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.249543074005026 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.582256265414231 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.567197212453844 AS DOUBLE PRECISION) AS "PC1", "ADS_sca_1_OUT"."Feature_0" * CAST(0.357978551872095 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.931208839467465 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.009350349831008 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(0.067926612275687 AS DOUBLE PRECISION) AS "PC2", "ADS_sca_1_OUT"."Feature_0" * CAST(0.726838701881798 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(-0.231985866568292 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(-0.142090941958786 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.630633192412678 AS DOUBLE PRECISION) AS "PC3", "ADS_sca_1_OUT"."Feature_0" * CAST(-0.257999302440444 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_1" * CAST(0.129463930213543 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_2" * CAST(0.800437615656071 AS DOUBLE PRECISION) + "ADS_sca_1_OUT"."Feature_3" * CAST(-0.525333298161016 AS DOUBLE PRECISION) AS "PC4" 
FROM "ADS_sca_1_OUT"), 
"DT_node_lookup" AS 
(SELECT "ADS_pre_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_pre_1_OUT"."PC1" <= CAST(0.607754061772 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC1" <= CAST(-0.861756350507 AS DOUBLE PRECISION)) THEN CASE WHEN ("ADS_pre_1_OUT"."PC3" <= CAST(0.266924738639 AS DOUBLE PRECISION)) THEN 4 ELSE 5 END ELSE CASE WHEN ("ADS_pre_1_OUT"."PC3" <= CAST(-0.240952665429 AS DOUBLE PRECISION)) THEN 7 ELSE 8 END END ELSE 9 END AS node_id_2 
FROM "ADS_pre_1_OUT"), 
dummy_cte AS 
(SELECT CAST(0.0 AS DOUBLE PRECISION) AS "X"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."P_CLASS_0" AS "P_CLASS_0", "Values"."P_CLASS_1" AS "P_CLASS_1", "Values"."P_CLASS_2" AS "P_CLASS_2", "Values"."D" AS "D", "Values"."DP" AS "DP" 
FROM (SELECT 4 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_0", CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_1", CAST(1.0 AS DOUBLE PRECISION) AS "P_CLASS_2", 'CLASS_2' AS "D", CAST(1.0 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 5 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_0", CAST(0.5 AS DOUBLE PRECISION) AS "P_CLASS_1", CAST(0.5 AS DOUBLE PRECISION) AS "P_CLASS_2", 'CLASS_1' AS "D", CAST(0.5 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 7 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_0", CAST(0.857142857142857 AS DOUBLE PRECISION) AS "P_CLASS_1", CAST(0.142857142857143 AS DOUBLE PRECISION) AS "P_CLASS_2", 'CLASS_1' AS "D", CAST(0.857142857142857 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 8 AS nid, CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_0", CAST(1.0 AS DOUBLE PRECISION) AS "P_CLASS_1", CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_2", 'CLASS_1' AS "D", CAST(1.0 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte UNION ALL SELECT 9 AS nid, CAST(1.0 AS DOUBLE PRECISION) AS "P_CLASS_0", CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_1", CAST(0.0 AS DOUBLE PRECISION) AS "P_CLASS_2", 'CLASS_0' AS "D", CAST(1.0 AS DOUBLE PRECISION) AS "DP" 
FROM dummy_cte) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."P_CLASS_0" AS "P_CLASS_0", "DT_node_data"."P_CLASS_1" AS "P_CLASS_1", "DT_node_data"."P_CLASS_2" AS "P_CLASS_2", "DT_node_data"."D" AS "D", "DT_node_data"."DP" AS "DP" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_CLASS_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_CLASS_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_CLASS_2", "DT_Output"."P_CLASS_0" AS "Proba_CLASS_0", "DT_Output"."P_CLASS_1" AS "Proba_CLASS_1", "DT_Output"."P_CLASS_2" AS "Proba_CLASS_2", CASE WHEN ("DT_Output"."P_CLASS_0" IS NULL OR "DT_Output"."P_CLASS_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_CLASS_0") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_0", CASE WHEN ("DT_Output"."P_CLASS_1" IS NULL OR "DT_Output"."P_CLASS_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_CLASS_1") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_1", CASE WHEN ("DT_Output"."P_CLASS_2" IS NULL OR "DT_Output"."P_CLASS_2" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln("DT_Output"."P_CLASS_2") ELSE -1.79769313486231e+308 END AS "LogProba_CLASS_2", "DT_Output"."D" AS "Decision", "DT_Output"."DP" AS "DecisionProba" 
FROM "DT_Output"