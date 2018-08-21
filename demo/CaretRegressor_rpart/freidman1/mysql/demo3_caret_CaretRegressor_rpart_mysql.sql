-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_rpart
-- Dataset : freidman1
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `DT_node_lookup` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_1` < 0.4457722655336853) THEN CASE WHEN (`ADS`.`Feature_4` < 0.6678532911348944) THEN 4 ELSE 5 END ELSE 3 END AS node_id_2 
FROM freidman1 AS `ADS`), 
`DT_node_data` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 3 AS nid, 18.270077573225237 AS `E` UNION ALL SELECT 4 AS nid, 10.79389336190427 AS `E` UNION ALL SELECT 5 AS nid, 16.62049825513814 AS `E`) AS `Values`), 
`DT_Output` AS 
(SELECT `DT_node_lookup`.`KEY` AS `KEY`, `DT_node_lookup`.node_id_2 AS node_id_2, `DT_node_data`.nid AS nid, `DT_node_data`.`E` AS `E` 
FROM `DT_node_lookup` LEFT OUTER JOIN `DT_node_data` ON `DT_node_lookup`.node_id_2 = `DT_node_data`.nid)
 SELECT `DT_Output`.`KEY` AS `KEY`, `DT_Output`.`E` AS `Estimator` 
FROM `DT_Output`