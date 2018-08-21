-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet
-- Dataset : RandomReg_10
-- Database : firebird


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM "RandomReg_10" AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", 33.02221412626405 * linear_input."Feature_0" + 73.03252225826601 * linear_input."Feature_1" + 92.33127771515268 * linear_input."Feature_2" + 33.78656268224644 * linear_input."Feature_3" + 51.77525571451931 * linear_input."Feature_4" + 82.11234540646899 * linear_input."Feature_5" + 32.17693227965698 * linear_input."Feature_6" + 39.52956998916965 * linear_input."Feature_7" + 79.82447714908727 * linear_input."Feature_8" + 57.66587857513772 * linear_input."Feature_9" + 1.069879947429186 AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte