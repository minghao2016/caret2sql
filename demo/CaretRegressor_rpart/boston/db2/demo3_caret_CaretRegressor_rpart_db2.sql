-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_rpart
-- Dataset : boston
-- Database : db2


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "DT_node_lookup" AS 
(SELECT "ADS"."KEY" AS "KEY", CASE WHEN ("ADS"."Feature_5" < 7.0105) THEN CASE WHEN ("ADS"."Feature_12" >= 14.78) THEN 4 ELSE 5 END ELSE 3 END AS node_id_2 
FROM "BOSTON" AS "ADS"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 3 AS nid, 38.68599999999999 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 4 AS nid, 14.779527559055119 AS "E" FROM SYSIBM.SYSDUMMY1 UNION ALL SELECT 5 AS nid, 23.394713656387673 AS "E" FROM SYSIBM.SYSDUMMY1) AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"