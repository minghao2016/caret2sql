-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet_pca
-- Dataset : freidman2
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE PRECISION) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE PRECISION) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE PRECISION) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE PRECISION) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * -0.6121650749100701 + "CenteredDataForPCA"."Feature_1" * 0.5464782903329433 + "CenteredDataForPCA"."Feature_2" * -0.5708677485644764 + "CenteredDataForPCA"."Feature_3" * -0.02693349038014348 AS caret_preprocess_output_2, "CenteredDataForPCA"."Feature_0" * 0.4888813380420076 + "CenteredDataForPCA"."Feature_1" * 0.2745192584561386 + "CenteredDataForPCA"."Feature_2" * -0.2238449995359107 + "CenteredDataForPCA"."Feature_3" * -0.7971998684355868 AS caret_preprocess_output_3, "CenteredDataForPCA"."Feature_0" * -0.024686176636208892 + "CenteredDataForPCA"."Feature_1" * 0.7091918576518509 + "CenteredDataForPCA"."Feature_2" * 0.7038817472089458 + "CenteredDataForPCA"."Feature_3" * 0.03143227114740615 AS caret_preprocess_output_4, "CenteredDataForPCA"."Feature_0" * -0.6209988333786876 + "CenteredDataForPCA"."Feature_1" * -0.3507813620644518 + "CenteredDataForPCA"."Feature_2" * 0.358544161544677 + "CenteredDataForPCA"."Feature_3" * -0.6022947527521242 AS caret_preprocess_output_5 
FROM "CenteredDataForPCA"), 
linear_input AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CAST("ADS_car_1_OUT".caret_preprocess_output_2 AS DOUBLE PRECISION) AS caret_preprocess_output_2, CAST("ADS_car_1_OUT".caret_preprocess_output_3 AS DOUBLE PRECISION) AS caret_preprocess_output_3, CAST("ADS_car_1_OUT".caret_preprocess_output_4 AS DOUBLE PRECISION) AS caret_preprocess_output_4, CAST("ADS_car_1_OUT".caret_preprocess_output_5 AS DOUBLE PRECISION) AS caret_preprocess_output_5 
FROM "ADS_car_1_OUT"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", -35.411267626025705 * linear_input.caret_preprocess_output_2 + -1.7482174355137432 * linear_input.caret_preprocess_output_3 + 354.5141421916619 * linear_input.caret_preprocess_output_4 + -7.787334598544836 * linear_input.caret_preprocess_output_5 + 499.09288446517394 AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte