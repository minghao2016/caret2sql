-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet
-- Dataset : boston
-- Database : oracle


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS BINARY_DOUBLE) AS "Feature_0", CAST("ADS"."Feature_1" AS BINARY_DOUBLE) AS "Feature_1", CAST("ADS"."Feature_2" AS BINARY_DOUBLE) AS "Feature_2", CAST("ADS"."Feature_3" AS BINARY_DOUBLE) AS "Feature_3", CAST("ADS"."Feature_4" AS BINARY_DOUBLE) AS "Feature_4", CAST("ADS"."Feature_5" AS BINARY_DOUBLE) AS "Feature_5", CAST("ADS"."Feature_6" AS BINARY_DOUBLE) AS "Feature_6", CAST("ADS"."Feature_7" AS BINARY_DOUBLE) AS "Feature_7", CAST("ADS"."Feature_8" AS BINARY_DOUBLE) AS "Feature_8", CAST("ADS"."Feature_9" AS BINARY_DOUBLE) AS "Feature_9", CAST("ADS"."Feature_10" AS BINARY_DOUBLE) AS "Feature_10", CAST("ADS"."Feature_11" AS BINARY_DOUBLE) AS "Feature_11", CAST("ADS"."Feature_12" AS BINARY_DOUBLE) AS "Feature_12" 
FROM "BOSTON" "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", -5.583046e-05 * "IL"."Feature_0" + 0.03750949 * "IL"."Feature_1" + -0.0006153164 * "IL"."Feature_2" + 9.442965e-05 * "IL"."Feature_3" + 0.0001484757 * "IL"."Feature_4" + 0.004104074 * "IL"."Feature_5" + 0.01569749 * "IL"."Feature_6" + 0.003058024 * "IL"."Feature_7" + 0.001953323 * "IL"."Feature_8" + 0.1115541 * "IL"."Feature_9" + 0.007548324 * "IL"."Feature_10" + 0.2028717 * "IL"."Feature_11" + -0.0001923122 * "IL"."Feature_12" + 0.0004413201 AS "NEUR_1_1", -0.01668383 * "IL"."Feature_0" + 0.05059434 * "IL"."Feature_1" + -0.1761741 * "IL"."Feature_2" + 3.439959 * "IL"."Feature_3" + -0.5898355 * "IL"."Feature_4" + 3.53567 * "IL"."Feature_5" + -0.03475699 * "IL"."Feature_6" + -1.454999 * "IL"."Feature_7" + 0.456323 * "IL"."Feature_8" + -0.01532417 * "IL"."Feature_9" + -0.2756665 * "IL"."Feature_10" + -0.009117229 * "IL"."Feature_11" + -0.6457767 * "IL"."Feature_12" + -0.05874909 AS "NEUR_1_2", -0.6411997 * "IL"."Feature_0" + 2.812081 * "IL"."Feature_1" + -2.055654 * "IL"."Feature_2" + -0.003103697 * "IL"."Feature_3" + 0.0157932 * "IL"."Feature_4" + 0.6618638 * "IL"."Feature_5" + 3.48077 * "IL"."Feature_6" + 0.4112559 * "IL"."Feature_7" + -0.883503 * "IL"."Feature_8" + -10.2587 * "IL"."Feature_9" + 0.9771095 * "IL"."Feature_10" + 35.34376 * "IL"."Feature_11" + -1.531701 * "IL"."Feature_12" + 0.07294683 AS "NEUR_1_3", -0.01001402 * "IL"."Feature_0" + 0.2850182 * "IL"."Feature_1" + -0.03036417 * "IL"."Feature_2" + 0.001793035 * "IL"."Feature_3" + 0.001626523 * "IL"."Feature_4" + 0.04324285 * "IL"."Feature_5" + 0.09110911 * "IL"."Feature_6" + 0.02512365 * "IL"."Feature_7" + 0.01016451 * "IL"."Feature_8" + 0.6846068 * "IL"."Feature_9" + 0.05967576 * "IL"."Feature_10" + 2.180476 * "IL"."Feature_11" + -0.05586015 * "IL"."Feature_12" + 0.004673361 AS "NEUR_1_4", -0.003649607 * "IL"."Feature_0" + 0.09690312 * "IL"."Feature_1" + -0.0117344 * "IL"."Feature_2" + 0.0007643966 * "IL"."Feature_3" + 0.0005094244 * "IL"."Feature_4" + 0.01432114 * "IL"."Feature_5" + 0.02264408 * "IL"."Feature_6" + 0.008522431 * "IL"."Feature_7" + 0.002305123 * "IL"."Feature_8" + 0.1958152 * "IL"."Feature_9" + 0.01885917 * "IL"."Feature_10" + 0.7321084 * "IL"."Feature_11" + -0.02190911 * "IL"."Feature_12" + 0.001460211 AS "NEUR_1_5" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", 1.144323 * "HL_1_logistic_1"."NEUR_1_1" + 18.01933 * "HL_1_logistic_1"."NEUR_1_2" + 7.045548 * "HL_1_logistic_1"."NEUR_1_3" + 3.773046 * "HL_1_logistic_1"."NEUR_1_4" + 3.773987 * "HL_1_logistic_1"."NEUR_1_5" + 3.78225 AS "NEUR_2_1" 
FROM "HL_1_logistic_1"), 
"OL_identity" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_BA"), 
"OL_identity_1" AS 
(SELECT "OL_identity"."KEY" AS "KEY", "OL_identity"."NEUR_2_1" AS "NEUR_2_1" 
FROM "OL_identity")
 SELECT "OL_identity_1"."KEY" AS "KEY", "OL_identity_1"."NEUR_2_1" AS "Estimator" 
FROM "OL_identity_1"