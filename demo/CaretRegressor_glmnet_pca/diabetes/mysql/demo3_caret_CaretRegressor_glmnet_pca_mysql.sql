-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet_pca
-- Dataset : diabetes
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `CenteredDataForPCA` AS 
(SELECT `ADS`.`KEY` AS `KEY`, (CAST(`ADS`.`Feature_0` AS DOUBLE) - 0.0002686932066652983) / 0.04730915349390602 AS `Feature_0`, (CAST(`ADS`.`Feature_1` AS DOUBLE) - 0.0007239580580639588) / 0.047673150284254465 AS `Feature_1`, (CAST(`ADS`.`Feature_2` AS DOUBLE) - 0.0007280719825586781) / 0.04700253448417295 AS `Feature_2`, (CAST(`ADS`.`Feature_3` AS DOUBLE) - 0.0010135652210843957) / 0.04840388131203584 AS `Feature_3`, (CAST(`ADS`.`Feature_4` AS DOUBLE) - 0.0009763580732882078) / 0.04811896752594957 AS `Feature_4`, (CAST(`ADS`.`Feature_5` AS DOUBLE) - 0.0017643808242337245) / 0.048129028508581584 AS `Feature_5`, (CAST(`ADS`.`Feature_6` AS DOUBLE) - -0.0016512815450565033) / 0.04626798564989309 AS `Feature_6`, (CAST(`ADS`.`Feature_7` AS DOUBLE) - 0.0013905501983388132) / 0.04743032244703379 AS `Feature_7`, (CAST(`ADS`.`Feature_8` AS DOUBLE) - 0.001272648254809092) / 0.04595800380394428 AS `Feature_8`, (CAST(`ADS`.`Feature_9` AS DOUBLE) - 0.0010344250056816262) / 0.04782938024075454 AS `Feature_9` 
FROM diabetes AS `ADS`), 
`ADS_car_1_OUT` AS 
(SELECT `CenteredDataForPCA`.`KEY` AS `KEY`, `CenteredDataForPCA`.`Feature_0` * -0.2290778852038531 + `CenteredDataForPCA`.`Feature_1` * -0.1753752188773297 + `CenteredDataForPCA`.`Feature_2` * -0.3101462867523008 + `CenteredDataForPCA`.`Feature_3` * -0.2626680617954629 + `CenteredDataForPCA`.`Feature_4` * -0.3479056910483734 + `CenteredDataForPCA`.`Feature_5` * -0.3559311512395374 + `CenteredDataForPCA`.`Feature_6` * 0.2700667896053253 + `CenteredDataForPCA`.`Feature_7` * -0.4281896059050315 + `CenteredDataForPCA`.`Feature_8` * -0.3817554053543343 + `CenteredDataForPCA`.`Feature_9` * -0.319118586083605 AS caress_2, `CenteredDataForPCA`.`Feature_0` * 0.09937121658133408 + `CenteredDataForPCA`.`Feature_1` * -0.3974071373222933 + `CenteredDataForPCA`.`Feature_2` * -0.0955290657434 + `CenteredDataForPCA`.`Feature_3` * -0.10428227480233908 + `CenteredDataForPCA`.`Feature_4` * 0.5519944936080498 + `CenteredDataForPCA`.`Feature_5` * 0.44169748621486143 + `CenteredDataForPCA`.`Feature_6` * 0.5359791630654337 + `CenteredDataForPCA`.`Feature_7` * -0.09747648126824032 + `CenteredDataForPCA`.`Feature_8` * -0.06464571596604123 + `CenteredDataForPCA`.`Feature_9` * -0.1069735796588606 AS caress_3, `CenteredDataForPCA`.`Feature_0` * -0.447334397656141 + `CenteredDataForPCA`.`Feature_1` * 0.06517171310859735 + `CenteredDataForPCA`.`Feature_2` * -0.1813228857818792 + `CenteredDataForPCA`.`Feature_3` * -0.5633053550809429 + `CenteredDataForPCA`.`Feature_4` * 0.10998840407137493 + `CenteredDataForPCA`.`Feature_5` * 0.2893639101113097 + `CenteredDataForPCA`.`Feature_6` * -0.3533722834611607 + `CenteredDataForPCA`.`Feature_7` * 0.3825782441157001 + `CenteredDataForPCA`.`Feature_8` * -0.04470455133576475 + `CenteredDataForPCA`.`Feature_9` * -0.2763840995943125 AS caress_4, `CenteredDataForPCA`.`Feature_0` * -0.3821475868520689 + `CenteredDataForPCA`.`Feature_1` * -0.6833479183061256 + `CenteredDataForPCA`.`Feature_2` * 0.5241820976738465 + `CenteredDataForPCA`.`Feature_3` * -0.03681239814871951 + `CenteredDataForPCA`.`Feature_4` * -0.08445010736913261 + `CenteredDataForPCA`.`Feature_5` * -0.16994357503869012 + `CenteredDataForPCA`.`Feature_6` * -0.07693340159969728 + `CenteredDataForPCA`.`Feature_7` * 0.017466366084080358 + `CenteredDataForPCA`.`Feature_8` * 0.2554449000560565 + `CenteredDataForPCA`.`Feature_9` * 0.05820877690254081 AS caress_5, `CenteredDataForPCA`.`Feature_0` * -0.7351365637973705 + `CenteredDataForPCA`.`Feature_1` * 0.3763855813795456 + `CenteredDataForPCA`.`Feature_2` * 0.1420393394491647 + `CenteredDataForPCA`.`Feature_3` * 0.3926718700192453 + `CenteredDataForPCA`.`Feature_4` * 0.1428650665541864 + `CenteredDataForPCA`.`Feature_5` * 0.1276726308786394 + `CenteredDataForPCA`.`Feature_6` * 0.245950649429653 + `CenteredDataForPCA`.`Feature_7` * -0.1284011919823951 + `CenteredDataForPCA`.`Feature_8` * -0.1367980851890121 + `CenteredDataForPCA`.`Feature_9` * 0.1055401494998786 AS caress_6, `CenteredDataForPCA`.`Feature_0` * -0.12368487725974045 + `CenteredDataForPCA`.`Feature_1` * -0.06284387588101352 + `CenteredDataForPCA`.`Feature_2` * -0.2953969232053042 + `CenteredDataForPCA`.`Feature_3` * -0.3412960311712761 + `CenteredDataForPCA`.`Feature_4` * -0.01656449034153671 + `CenteredDataForPCA`.`Feature_5` * -0.04587438751367261 + `CenteredDataForPCA`.`Feature_6` * 0.08082110381516423 + `CenteredDataForPCA`.`Feature_7` * -0.030199014358925625 + `CenteredDataForPCA`.`Feature_8` * -0.0053457810566821425 + `CenteredDataForPCA`.`Feature_9` * 0.8758760898858822 AS caress_7, `CenteredDataForPCA`.`Feature_0` * -0.18093645279344808 + `CenteredDataForPCA`.`Feature_1` * -0.06987137416766502 + `CenteredDataForPCA`.`Feature_2` * -0.5789173338500514 + `CenteredDataForPCA`.`Feature_3` * 0.2280204737784956 + `CenteredDataForPCA`.`Feature_4` * 0.10126984562459923 + `CenteredDataForPCA`.`Feature_5` * -0.2246202656518164 + `CenteredDataForPCA`.`Feature_6` * 0.06544614151024082 + `CenteredDataForPCA`.`Feature_7` * 0.03808580365663454 + `CenteredDataForPCA`.`Feature_8` * 0.6979315085634531 + `CenteredDataForPCA`.`Feature_9` * -0.147273260741705 AS caress_8, `CenteredDataForPCA`.`Feature_0` * -0.05383172736122197 + `CenteredDataForPCA`.`Feature_1` * -0.4351274140391209 + `CenteredDataForPCA`.`Feature_2` * -0.37821690169463146 + `CenteredDataForPCA`.`Feature_3` * 0.5275864487344293 + `CenteredDataForPCA`.`Feature_4` * -0.10231604328930263 + `CenteredDataForPCA`.`Feature_5` * 0.18616170017658573 + `CenteredDataForPCA`.`Feature_6` * -0.32383229348443515 + `CenteredDataForPCA`.`Feature_7` * 0.20648110070520395 + `CenteredDataForPCA`.`Feature_8` * -0.4325759465726844 + `CenteredDataForPCA`.`Feature_9` * 0.0813774719019286 AS caress_9, `CenteredDataForPCA`.`Feature_0` * -0.0118709035580283 + `CenteredDataForPCA`.`Feature_1` * -0.01608813015824754 + `CenteredDataForPCA`.`Feature_2` * -0.03679649410236003 + `CenteredDataForPCA`.`Feature_3` * -0.019988053380157533 + `CenteredDataForPCA`.`Feature_4` * 0.043694971359643266 + `CenteredDataForPCA`.`Feature_5` * 0.37143600152557 + `CenteredDataForPCA`.`Feature_6` * -0.4864756469787478 + `CenteredDataForPCA`.`Feature_7` * -0.7682461390900374 + `CenteredDataForPCA`.`Feature_8` * 0.17559159913947106 + `CenteredDataForPCA`.`Feature_9` * 0.0167242545619639 AS caress_10, `CenteredDataForPCA`.`Feature_0` * -0.001831091592284298 + `CenteredDataForPCA`.`Feature_1` * 0.00268481872708177 + `CenteredDataForPCA`.`Feature_2` * 0.007537615926184184 + `CenteredDataForPCA`.`Feature_3` * -0.0069370547321724 + `CenteredDataForPCA`.`Feature_4` * 0.7153434315394136 + `CenteredDataForPCA`.`Feature_5` * -0.5693190225069522 + `CenteredDataForPCA`.`Feature_6` * -0.3101075092440782 + `CenteredDataForPCA`.`Feature_7` * -0.09378091486819988 + `CenteredDataForPCA`.`Feature_8` * -0.24295700163084485 + `CenteredDataForPCA`.`Feature_9` * 0.007382012624339704 AS caress_11 
FROM `CenteredDataForPCA`), 
linear_input AS 
(SELECT `ADS_car_1_OUT`.`KEY` AS `KEY`, CAST(`ADS_car_1_OUT`.caress_2 AS DOUBLE) AS caress_2, CAST(`ADS_car_1_OUT`.caress_3 AS DOUBLE) AS caress_3, CAST(`ADS_car_1_OUT`.caress_4 AS DOUBLE) AS caress_4, CAST(`ADS_car_1_OUT`.caress_5 AS DOUBLE) AS caress_5, CAST(`ADS_car_1_OUT`.caress_6 AS DOUBLE) AS caress_6, CAST(`ADS_car_1_OUT`.caress_7 AS DOUBLE) AS caress_7, CAST(`ADS_car_1_OUT`.caress_8 AS DOUBLE) AS caress_8, CAST(`ADS_car_1_OUT`.caress_9 AS DOUBLE) AS caress_9, CAST(`ADS_car_1_OUT`.caress_10 AS DOUBLE) AS caress_10, CAST(`ADS_car_1_OUT`.caress_11 AS DOUBLE) AS caress_11 
FROM `ADS_car_1_OUT`), 
linear_model_cte AS 
(SELECT linear_input.`KEY` AS `KEY`, -20.315510300717467 * linear_input.caress_2 + -11.64210198020713 * linear_input.caress_3 + -11.21065494310613 * linear_input.caress_4 + 27.17427596715785 * linear_input.caress_5 + -0.5658369226703621 * linear_input.caress_6 + -7.599450616473291 * linear_input.caress_7 + 4.959952389591803 * linear_input.caress_8 + -1.2078670751109974 * linear_input.caress_9 + 2.9270236849594298 * linear_input.caress_10 + -8.869811474290222 * linear_input.caress_11 + 154.07365439093482 AS `Estimator` 
FROM linear_input)
 SELECT linear_model_cte.`KEY` AS `KEY`, linear_model_cte.`Estimator` AS `Estimator` 
FROM linear_model_cte