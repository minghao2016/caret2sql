-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet
-- Dataset : diabetes
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE) AS "Feature_9" 
FROM diabetes AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", 0.0 * linear_input."Feature_0" + -196.41210228384568 * linear_input."Feature_1" + 505.05039577129367 * linear_input."Feature_2" + 283.9779159059505 * linear_input."Feature_3" + -33.466482798155624 * linear_input."Feature_4" + -84.25995325070419 * linear_input."Feature_5" + -278.06366609352193 * linear_input."Feature_6" + 0.0 * linear_input."Feature_7" + 495.920874167536 * linear_input."Feature_8" + 69.4951459535754 * linear_input."Feature_9" + 152.57946549750432 AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte