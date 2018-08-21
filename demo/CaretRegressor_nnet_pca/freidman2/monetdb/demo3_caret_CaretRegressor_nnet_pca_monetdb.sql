-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet_pca
-- Dataset : freidman2
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * -0.6121650749100701 + "CenteredDataForPCA"."Feature_1" * 0.5464782903329433 + "CenteredDataForPCA"."Feature_2" * -0.5708677485644764 + "CenteredDataForPCA"."Feature_3" * -0.02693349038014348 AS caret_preprocess_output_2, "CenteredDataForPCA"."Feature_0" * 0.4888813380420076 + "CenteredDataForPCA"."Feature_1" * 0.2745192584561386 + "CenteredDataForPCA"."Feature_2" * -0.2238449995359107 + "CenteredDataForPCA"."Feature_3" * -0.7971998684355868 AS caret_preprocess_output_3, "CenteredDataForPCA"."Feature_0" * -0.024686176636208892 + "CenteredDataForPCA"."Feature_1" * 0.7091918576518509 + "CenteredDataForPCA"."Feature_2" * 0.7038817472089458 + "CenteredDataForPCA"."Feature_3" * 0.03143227114740615 AS caret_preprocess_output_4, "CenteredDataForPCA"."Feature_0" * -0.6209988333786876 + "CenteredDataForPCA"."Feature_1" * -0.3507813620644518 + "CenteredDataForPCA"."Feature_2" * 0.358544161544677 + "CenteredDataForPCA"."Feature_3" * -0.6022947527521242 AS caret_preprocess_output_5 
FROM "CenteredDataForPCA"), 
"IL" AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CAST("ADS_car_1_OUT".caret_preprocess_output_2 AS DOUBLE) AS caret_preprocess_output_2, CAST("ADS_car_1_OUT".caret_preprocess_output_3 AS DOUBLE) AS caret_preprocess_output_3, CAST("ADS_car_1_OUT".caret_preprocess_output_4 AS DOUBLE) AS caret_preprocess_output_4, CAST("ADS_car_1_OUT".caret_preprocess_output_5 AS DOUBLE) AS caret_preprocess_output_5 
FROM "ADS_car_1_OUT"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", 0.1535673 * "IL".caret_preprocess_output_2 + 0.04694851 * "IL".caret_preprocess_output_3 + -2.001495 * "IL".caret_preprocess_output_4 + 0.03542956 * "IL".caret_preprocess_output_5 + 1.237418 AS "NEUR_1_1" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_1") THEN -"HL_BA_1"."NEUR_1_1" ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -"HL_BA_1"."NEUR_1_1") THEN -"HL_BA_1"."NEUR_1_1" ELSE -100.0 END END)) AS "NEUR_1_1" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", -1224.595 * "HL_1_logistic_1"."NEUR_1_1" + 1320.234 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"