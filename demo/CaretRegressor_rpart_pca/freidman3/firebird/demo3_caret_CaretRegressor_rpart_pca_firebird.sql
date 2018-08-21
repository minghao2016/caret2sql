-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_rpart_pca
-- Dataset : freidman3
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman3 AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * -0.6121650749100701 + "CenteredDataForPCA"."Feature_1" * 0.5464782903329433 + "CenteredDataForPCA"."Feature_2" * -0.5708677485644764 + "CenteredDataForPCA"."Feature_3" * -0.02693349038014348 AS caret_preprocess_output_2, "CenteredDataForPCA"."Feature_0" * 0.4888813380420076 + "CenteredDataForPCA"."Feature_1" * 0.2745192584561386 + "CenteredDataForPCA"."Feature_2" * -0.2238449995359107 + "CenteredDataForPCA"."Feature_3" * -0.7971998684355868 AS caret_preprocess_output_3, "CenteredDataForPCA"."Feature_0" * -0.024686176636208892 + "CenteredDataForPCA"."Feature_1" * 0.7091918576518509 + "CenteredDataForPCA"."Feature_2" * 0.7038817472089458 + "CenteredDataForPCA"."Feature_3" * 0.03143227114740615 AS caret_preprocess_output_4, "CenteredDataForPCA"."Feature_0" * -0.6209988333786876 + "CenteredDataForPCA"."Feature_1" * -0.3507813620644518 + "CenteredDataForPCA"."Feature_2" * 0.358544161544677 + "CenteredDataForPCA"."Feature_3" * -0.6022947527521242 AS caret_preprocess_output_5 
FROM "CenteredDataForPCA"), 
"DT_node_lookup" AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_car_1_OUT".caret_preprocess_output_4 < -0.5522192010591933) THEN CASE WHEN ("ADS_car_1_OUT".caret_preprocess_output_5 < 0.4758976561219204) THEN 4 ELSE 5 END ELSE 3 END AS node_id_2 
FROM "ADS_car_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 1.473565120352516 AS "E" FROM rdb$database UNION ALL SELECT 4 AS nid, 1.001159815852261 AS "E" FROM rdb$database UNION ALL SELECT 5 AS nid, 1.3541172191495907 AS "E" FROM rdb$database) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"