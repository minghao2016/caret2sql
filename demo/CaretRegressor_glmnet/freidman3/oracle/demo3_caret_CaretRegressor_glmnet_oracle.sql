-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet
-- Dataset : freidman3
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS BINARY_DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS BINARY_DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS BINARY_DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS BINARY_DOUBLE) AS "Feature_3" 
FROM "FREIDMAN3" "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", -0.003201548154027199 * linear_input."Feature_0" + 0.0001885869846090814 * linear_input."Feature_1" + 0.5834540702812887 * linear_input."Feature_2" + 0.005364968358498984 * linear_input."Feature_3" + 0.980281609332857 AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte