-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_nnet
-- Dataset : RandomReg_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `IL` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CAST(`ADS`.`Feature_0` AS DOUBLE) AS `Feature_0`, CAST(`ADS`.`Feature_1` AS DOUBLE) AS `Feature_1`, CAST(`ADS`.`Feature_2` AS DOUBLE) AS `Feature_2`, CAST(`ADS`.`Feature_3` AS DOUBLE) AS `Feature_3`, CAST(`ADS`.`Feature_4` AS DOUBLE) AS `Feature_4`, CAST(`ADS`.`Feature_5` AS DOUBLE) AS `Feature_5`, CAST(`ADS`.`Feature_6` AS DOUBLE) AS `Feature_6`, CAST(`ADS`.`Feature_7` AS DOUBLE) AS `Feature_7`, CAST(`ADS`.`Feature_8` AS DOUBLE) AS `Feature_8`, CAST(`ADS`.`Feature_9` AS DOUBLE) AS `Feature_9` 
FROM `RandomReg_10` AS `ADS`), 
`HL_BA_1` AS 
(SELECT `IL`.`KEY` AS `KEY`, -0.2016384 * `IL`.`Feature_0` + -0.4188318 * `IL`.`Feature_1` + -0.5208484 * `IL`.`Feature_2` + -0.2005239 * `IL`.`Feature_3` + -0.3145793 * `IL`.`Feature_4` + -0.4869879 * `IL`.`Feature_5` + -0.1871874 * `IL`.`Feature_6` + -0.2339407 * `IL`.`Feature_7` + -0.4644367 * `IL`.`Feature_8` + -0.3311524 * `IL`.`Feature_9` + 0.07051844 AS `NEUR_1_1` 
FROM `IL`), 
`HL_1_logistic` AS 
(SELECT `HL_BA_1`.`KEY` AS `KEY`, 1.0 / (1.0 + exp(least(100.0, greatest(-100.0, -`HL_BA_1`.`NEUR_1_1`)))) AS `NEUR_1_1` 
FROM `HL_BA_1`), 
`HL_1_logistic_1` AS 
(SELECT `HL_1_logistic`.`KEY` AS `KEY`, `HL_1_logistic`.`NEUR_1_1` AS `NEUR_1_1` 
FROM `HL_1_logistic`), 
`OL_BA` AS 
(SELECT `HL_1_logistic_1`.`KEY` AS `KEY`, -847.9704 * `HL_1_logistic_1`.`NEUR_1_1` + 438.3158 AS `NEUR_2_1` 
FROM `HL_1_logistic_1`), 
`OL_identity` AS 
(SELECT `OL_BA`.`KEY` AS `KEY`, `OL_BA`.`NEUR_2_1` AS `NEUR_2_1` 
FROM `OL_BA`), 
`OL_identity_1` AS 
(SELECT `OL_identity`.`KEY` AS `KEY`, `OL_identity`.`NEUR_2_1` AS `NEUR_2_1` 
FROM `OL_identity`)
 SELECT `OL_identity_1`.`KEY` AS `KEY`, `OL_identity_1`.`NEUR_2_1` AS `Estimator` 
FROM `OL_identity_1`