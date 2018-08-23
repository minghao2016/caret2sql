-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_rpart_pca
-- Dataset : RandomReg_10
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 0.1668094729813739) / 1.03547567419981 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - -0.1635127199444346) / 0.9978373487111776 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.19149292241003152) / 0.9379956714934372 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.05838484475305535) / 1.092422041481253 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - -0.09933205162122273) / 1.081168997121092 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - 0.21293121660488026) / 0.9417116446342017 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - 0.0478655686900296) / 1.1435269275597653 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 0.05078698959084227) / 0.9786817421858578 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - -0.19131992259081876) / 1.1488000469275086 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - 0.1994040567747336) / 0.8878119561240071 AS "Feature_9" 
FROM "RandomReg_10" AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * 0.1456841447657754 + "CenteredDataForPCA"."Feature_1" * 0.01052326111479696 + "CenteredDataForPCA"."Feature_2" * 0.06914860134209275 + "CenteredDataForPCA"."Feature_3" * 0.395081446850409 + "CenteredDataForPCA"."Feature_4" * 0.5653788508678024 + "CenteredDataForPCA"."Feature_5" * -0.4234978636491337 + "CenteredDataForPCA"."Feature_6" * -0.13347391731421338 + "CenteredDataForPCA"."Feature_7" * 0.5073597310574229 + "CenteredDataForPCA"."Feature_8" * 0.17681881915451916 + "CenteredDataForPCA"."Feature_9" * 0.11089070562205412 AS caress_2, "CenteredDataForPCA"."Feature_0" * -0.28606729371603284 + "CenteredDataForPCA"."Feature_1" * -0.1416224223949325 + "CenteredDataForPCA"."Feature_2" * -0.21284760934172509 + "CenteredDataForPCA"."Feature_3" * -0.2570681745801655 + "CenteredDataForPCA"."Feature_4" * 0.22505517518455515 + "CenteredDataForPCA"."Feature_5" * -0.01568473246748345 + "CenteredDataForPCA"."Feature_6" * -0.5725136264722785 + "CenteredDataForPCA"."Feature_7" * -0.08820208123478704 + "CenteredDataForPCA"."Feature_8" * -0.3605522366090105 + "CenteredDataForPCA"."Feature_9" * 0.5198800093216087 AS caress_3, "CenteredDataForPCA"."Feature_0" * 0.3393859060808712 + "CenteredDataForPCA"."Feature_1" * 0.4706204946180642 + "CenteredDataForPCA"."Feature_2" * 0.4682237189969609 + "CenteredDataForPCA"."Feature_3" * -0.24873660011955734 + "CenteredDataForPCA"."Feature_4" * 0.30955843893203433 + "CenteredDataForPCA"."Feature_5" * 0.27598076274469385 + "CenteredDataForPCA"."Feature_6" * -0.3878587432228167 + "CenteredDataForPCA"."Feature_7" * -0.1713140961495792 + "CenteredDataForPCA"."Feature_8" * 0.041332656018300086 + "CenteredDataForPCA"."Feature_9" * -0.16954966329100976 AS caress_4, "CenteredDataForPCA"."Feature_0" * 0.38499125608277135 + "CenteredDataForPCA"."Feature_1" * -0.4892407072526046 + "CenteredDataForPCA"."Feature_2" * 0.4525070336744841 + "CenteredDataForPCA"."Feature_3" * -0.11446163468336185 + "CenteredDataForPCA"."Feature_4" * -0.08228589793601762 + "CenteredDataForPCA"."Feature_5" * 0.05835205758419686 + "CenteredDataForPCA"."Feature_6" * 0.13193485154948764 + "CenteredDataForPCA"."Feature_7" * 0.2747942471701797 + "CenteredDataForPCA"."Feature_8" * -0.535971424967745 + "CenteredDataForPCA"."Feature_9" * 0.06481665241973472 AS caress_5, "CenteredDataForPCA"."Feature_0" * -0.4241318059513543 + "CenteredDataForPCA"."Feature_1" * -0.12904202328161374 + "CenteredDataForPCA"."Feature_2" * 0.4375442860931951 + "CenteredDataForPCA"."Feature_3" * 0.3534858161601103 + "CenteredDataForPCA"."Feature_4" * 0.14097295746133154 + "CenteredDataForPCA"."Feature_5" * 0.5320793223160138 + "CenteredDataForPCA"."Feature_6" * 0.15027430836617292 + "CenteredDataForPCA"."Feature_7" * -0.03078935335662195 + "CenteredDataForPCA"."Feature_8" * 0.20609808144469807 + "CenteredDataForPCA"."Feature_9" * 0.3436198360204909 AS caress_6, "CenteredDataForPCA"."Feature_0" * 0.16994011109828247 + "CenteredDataForPCA"."Feature_1" * 0.33484071907765084 + "CenteredDataForPCA"."Feature_2" * 0.10471628928699762 + "CenteredDataForPCA"."Feature_3" * 0.5541013299742117 + "CenteredDataForPCA"."Feature_4" * -0.14490660804802982 + "CenteredDataForPCA"."Feature_5" * -0.26123038722761205 + "CenteredDataForPCA"."Feature_6" * 0.06579599409431937 + "CenteredDataForPCA"."Feature_7" * -0.4582634526572295 + "CenteredDataForPCA"."Feature_8" * -0.4058380481420916 + "CenteredDataForPCA"."Feature_9" * 0.26968500124997136 AS caress_7, "CenteredDataForPCA"."Feature_0" * 0.4370347300341415 + "CenteredDataForPCA"."Feature_1" * 0.3004814913700811 + "CenteredDataForPCA"."Feature_2" * -0.29942592437311427 + "CenteredDataForPCA"."Feature_3" * -0.04148829060270187 + "CenteredDataForPCA"."Feature_4" * -0.2386399066951679 + "CenteredDataForPCA"."Feature_5" * 0.3468575401295237 + "CenteredDataForPCA"."Feature_6" * 0.08868221205015787 + "CenteredDataForPCA"."Feature_7" * 0.35236441046927025 + "CenteredDataForPCA"."Feature_8" * 0.13869954974668547 + "CenteredDataForPCA"."Feature_9" * 0.5466373750783862 AS caress_8, "CenteredDataForPCA"."Feature_0" * -0.4110649381042073 + "CenteredDataForPCA"."Feature_1" * 0.5225383542860303 + "CenteredDataForPCA"."Feature_2" * 0.07502877109148233 + "CenteredDataForPCA"."Feature_3" * -0.26071341076512045 + "CenteredDataForPCA"."Feature_4" * 0.1511348690751304 + "CenteredDataForPCA"."Feature_5" * -0.06293150763998201 + "CenteredDataForPCA"."Feature_6" * 0.4215737990655631 + "CenteredDataForPCA"."Feature_7" * 0.3351500274975048 + "CenteredDataForPCA"."Feature_8" * -0.4091241309239941 + "CenteredDataForPCA"."Feature_9" * -0.01199162701594769 AS caress_9, "CenteredDataForPCA"."Feature_0" * 0.08623923191991435 + "CenteredDataForPCA"."Feature_1" * -0.04151682611391222 + "CenteredDataForPCA"."Feature_2" * -0.4542511848329893 + "CenteredDataForPCA"."Feature_3" * 0.3528555538617996 + "CenteredDataForPCA"."Feature_4" * 0.32348914209631324 + "CenteredDataForPCA"."Feature_5" * 0.5130971990159016 + "CenteredDataForPCA"."Feature_6" * -0.0196749802426699 + "CenteredDataForPCA"."Feature_7" * 0.04194568413514674 + "CenteredDataForPCA"."Feature_8" * -0.38205041307882054 + "CenteredDataForPCA"."Feature_9" * -0.379427124917308 AS caress_10, "CenteredDataForPCA"."Feature_0" * -0.2395040689151328 + "CenteredDataForPCA"."Feature_1" * 0.15862841716211185 + "CenteredDataForPCA"."Feature_2" * 0.14791367901080205 + "CenteredDataForPCA"."Feature_3" * 0.27690238914206244 + "CenteredDataForPCA"."Feature_4" * -0.5493562127048842 + "CenteredDataForPCA"."Feature_5" * 0.04409331852702746 + "CenteredDataForPCA"."Feature_6" * -0.5231482227042055 + "CenteredDataForPCA"."Feature_7" * 0.42514357917517104 + "CenteredDataForPCA"."Feature_8" * -0.09999927400060166 + "CenteredDataForPCA"."Feature_9" * -0.22528645516624776 AS caress_11 
FROM "CenteredDataForPCA"), 
"DT_node_lookup" AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CASE WHEN ("ADS_car_1_OUT".caress_6 < -0.9223485953910504) THEN 2 ELSE CASE WHEN ("ADS_car_1_OUT".caress_4 < -0.7011411570380337) THEN 6 ELSE 7 END END AS node_id_2 
FROM "ADS_car_1_OUT"), 
"DT_node_data" AS 
(SELECT "Values".nid AS nid, "Values"."E" AS "E" 
FROM (SELECT 2 AS nid, -226.60950031770514 AS "E" UNION ALL SELECT 6 AS nid, -79.60972458941154 AS "E" UNION ALL SELECT 7 AS nid, 154.59567642839346 AS "E") AS "Values"), 
"DT_Output" AS 
(SELECT "DT_node_lookup"."KEY" AS "KEY", "DT_node_lookup".node_id_2 AS node_id_2, "DT_node_data".nid AS nid, "DT_node_data"."E" AS "E" 
FROM "DT_node_lookup" LEFT OUTER JOIN "DT_node_data" ON "DT_node_lookup".node_id_2 = "DT_node_data".nid)
 SELECT "DT_Output"."KEY" AS "KEY", "DT_Output"."E" AS "Estimator" 
FROM "DT_Output"