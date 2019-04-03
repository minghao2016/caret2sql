-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_cforest
-- Dataset : RandomReg_10
-- Database : mysql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH `RF_0` AS 
(WITH `DT_node_lookup` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_8` <= -1.012696716665257) THEN CASE WHEN (`ADS`.`Feature_2` <= -0.5273034378934962) THEN 3 ELSE CASE WHEN (`ADS`.`Feature_3` <= -0.4581032350802117) THEN 5 ELSE 6 END END ELSE CASE WHEN (`ADS`.`Feature_1` <= -0.6087374876863917) THEN 8 ELSE CASE WHEN (`ADS`.`Feature_2` <= 0.3874849065169055) THEN CASE WHEN (`ADS`.`Feature_9` <= 0.361303302354855) THEN 11 ELSE 12 END ELSE 13 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 3 AS nid, -312.822146271969 AS `E` UNION ALL SELECT 5 AS nid, -170.751668442225 AS `E` UNION ALL SELECT 6 AS nid, -45.5737298537339 AS `E` UNION ALL SELECT 8 AS nid, -138.318360322738 AS `E` UNION ALL SELECT 11 AS nid, -56.3535590219279 AS `E` UNION ALL SELECT 12 AS nid, 92.8825676556057 AS `E` UNION ALL SELECT 13 AS nid, 210.095706439456 AS `E`) AS `Values`), 
`DT_Output` AS 
(SELECT `DT_node_lookup`.`KEY` AS `KEY`, `DT_node_lookup`.node_id_2 AS node_id_2, `DT_node_data`.nid AS nid, `DT_node_data`.`E` AS `E` 
FROM `DT_node_lookup` LEFT OUTER JOIN `DT_node_data` ON `DT_node_lookup`.node_id_2 = `DT_node_data`.nid), 
`RF_Model_0` AS 
(SELECT `DT_Output`.`KEY` AS `KEY`, `DT_Output`.`E` AS `Estimator` 
FROM `DT_Output`), 
`DT_node_lookup_1` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_5` <= 0.6069251466869219) THEN CASE WHEN (`ADS`.`Feature_2` <= 0.4689199707627693) THEN CASE WHEN (`ADS`.`Feature_1` <= -0.1446618436445941) THEN 4 ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.1506074374291746) THEN 6 ELSE 7 END END ELSE 8 END ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.1200989007434062) THEN 10 ELSE CASE WHEN (`ADS`.`Feature_2` <= -0.1344308719107648) THEN 12 ELSE 13 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_1` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -219.372548018699 AS `E` UNION ALL SELECT 6 AS nid, -55.32080406533171 AS `E` UNION ALL SELECT 7 AS nid, 53.7776998307207 AS `E` UNION ALL SELECT 8 AS nid, 194.92103822406997 AS `E` UNION ALL SELECT 10 AS nid, -44.9953924819705 AS `E` UNION ALL SELECT 12 AS nid, 125.442279066328 AS `E` UNION ALL SELECT 13 AS nid, 323.934261244215 AS `E`) AS `Values`), 
`DT_Output_1` AS 
(SELECT `DT_node_lookup_1`.`KEY` AS `KEY`, `DT_node_lookup_1`.node_id_2 AS node_id_2, `DT_node_data_1`.nid AS nid, `DT_node_data_1`.`E` AS `E` 
FROM `DT_node_lookup_1` LEFT OUTER JOIN `DT_node_data_1` ON `DT_node_lookup_1`.node_id_2 = `DT_node_data_1`.nid), 
`RF_Model_1` AS 
(SELECT `DT_Output_1`.`KEY` AS `KEY`, `DT_Output_1`.`E` AS `Estimator` 
FROM `DT_Output_1`), 
`DT_node_lookup_2` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 0.5686299031785073) THEN CASE WHEN (`ADS`.`Feature_7` <= 0.0055727036558749785) THEN CASE WHEN (`ADS`.`Feature_4` <= -0.3205826891821421) THEN 4 ELSE 5 END ELSE CASE WHEN (`ADS`.`Feature_5` <= 0.3945813760489362) THEN 7 ELSE 8 END END ELSE CASE WHEN (`ADS`.`Feature_4` <= 0.1585352328181231) THEN 10 ELSE 11 END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_2` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -243.150588615421 AS `E` UNION ALL SELECT 5 AS nid, -34.1278471980651 AS `E` UNION ALL SELECT 7 AS nid, -91.01012157080429 AS `E` UNION ALL SELECT 8 AS nid, 56.0682330498845 AS `E` UNION ALL SELECT 10 AS nid, 42.2514075960565 AS `E` UNION ALL SELECT 11 AS nid, 311.357654472467 AS `E`) AS `Values`), 
`DT_Output_2` AS 
(SELECT `DT_node_lookup_2`.`KEY` AS `KEY`, `DT_node_lookup_2`.node_id_2 AS node_id_2, `DT_node_data_2`.nid AS nid, `DT_node_data_2`.`E` AS `E` 
FROM `DT_node_lookup_2` LEFT OUTER JOIN `DT_node_data_2` ON `DT_node_lookup_2`.node_id_2 = `DT_node_data_2`.nid), 
`RF_Model_2` AS 
(SELECT `DT_Output_2`.`KEY` AS `KEY`, `DT_Output_2`.`E` AS `Estimator` 
FROM `DT_Output_2`), 
`DT_node_lookup_3` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 1.020498192809712) THEN CASE WHEN (`ADS`.`Feature_8` <= 0.5363879326031334) THEN CASE WHEN (`ADS`.`Feature_2` <= -0.4233378333961578) THEN CASE WHEN (`ADS`.`Feature_1` <= -0.3950305345518847) THEN 5 ELSE 6 END ELSE CASE WHEN (`ADS`.`Feature_8` <= -1.249540920880333) THEN 8 ELSE 9 END END ELSE 10 END ELSE 11 END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_3` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 5 AS nid, -199.507220861717 AS `E` UNION ALL SELECT 6 AS nid, -84.1388033087568 AS `E` UNION ALL SELECT 8 AS nid, -91.1857000527515 AS `E` UNION ALL SELECT 9 AS nid, 33.2032859729648 AS `E` UNION ALL SELECT 10 AS nid, 137.886280888949 AS `E` UNION ALL SELECT 11 AS nid, 231.517687337061 AS `E`) AS `Values`), 
`DT_Output_3` AS 
(SELECT `DT_node_lookup_3`.`KEY` AS `KEY`, `DT_node_lookup_3`.node_id_2 AS node_id_2, `DT_node_data_3`.nid AS nid, `DT_node_data_3`.`E` AS `E` 
FROM `DT_node_lookup_3` LEFT OUTER JOIN `DT_node_data_3` ON `DT_node_lookup_3`.node_id_2 = `DT_node_data_3`.nid), 
`RF_Model_3` AS 
(SELECT `DT_Output_3`.`KEY` AS `KEY`, `DT_Output_3`.`E` AS `Estimator` 
FROM `DT_Output_3`), 
`DT_node_lookup_4` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 0.21351935978155803) THEN CASE WHEN (`ADS`.`Feature_5` <= -0.7073458532617333) THEN 3 ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.2482922016106332) THEN CASE WHEN (`ADS`.`Feature_7` <= -0.08936038423557588) THEN 6 ELSE 7 END ELSE 8 END END ELSE CASE WHEN (`ADS`.`Feature_3` <= -0.2147234858968854) THEN 10 ELSE CASE WHEN (`ADS`.`Feature_1` <= 0.2358753523466806) THEN 12 ELSE 13 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_4` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 3 AS nid, -284.304751372008 AS `E` UNION ALL SELECT 6 AS nid, -150.312771399738 AS `E` UNION ALL SELECT 7 AS nid, -35.31544000614429 AS `E` UNION ALL SELECT 8 AS nid, 71.7340858349964 AS `E` UNION ALL SELECT 10 AS nid, -11.223508518255 AS `E` UNION ALL SELECT 12 AS nid, 154.953948229226 AS `E` UNION ALL SELECT 13 AS nid, 217.324383523214 AS `E`) AS `Values`), 
`DT_Output_4` AS 
(SELECT `DT_node_lookup_4`.`KEY` AS `KEY`, `DT_node_lookup_4`.node_id_2 AS node_id_2, `DT_node_data_4`.nid AS nid, `DT_node_data_4`.`E` AS `E` 
FROM `DT_node_lookup_4` LEFT OUTER JOIN `DT_node_data_4` ON `DT_node_lookup_4`.node_id_2 = `DT_node_data_4`.nid), 
`RF_Model_4` AS 
(SELECT `DT_Output_4`.`KEY` AS `KEY`, `DT_Output_4`.`E` AS `Estimator` 
FROM `DT_Output_4`), 
`DT_node_lookup_5` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_1` <= -0.3653894159197561) THEN CASE WHEN (`ADS`.`Feature_5` <= -0.5336312908433302) THEN 3 ELSE CASE WHEN (`ADS`.`Feature_5` <= 0.7491792114879661) THEN 5 ELSE 6 END END ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.1200989007434062) THEN 8 ELSE CASE WHEN (`ADS`.`Feature_8` <= 0.4931714251821265) THEN 10 ELSE 11 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_5` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 3 AS nid, -267.029212807517 AS `E` UNION ALL SELECT 5 AS nid, -51.2197829349211 AS `E` UNION ALL SELECT 6 AS nid, 42.4198446375039 AS `E` UNION ALL SELECT 8 AS nid, -56.2427965624294 AS `E` UNION ALL SELECT 10 AS nid, 199.547536324954 AS `E` UNION ALL SELECT 11 AS nid, 287.801017450723 AS `E`) AS `Values`), 
`DT_Output_5` AS 
(SELECT `DT_node_lookup_5`.`KEY` AS `KEY`, `DT_node_lookup_5`.node_id_2 AS node_id_2, `DT_node_data_5`.nid AS nid, `DT_node_data_5`.`E` AS `E` 
FROM `DT_node_lookup_5` LEFT OUTER JOIN `DT_node_data_5` ON `DT_node_lookup_5`.node_id_2 = `DT_node_data_5`.nid), 
`RF_Model_5` AS 
(SELECT `DT_Output_5`.`KEY` AS `KEY`, `DT_Output_5`.`E` AS `Estimator` 
FROM `DT_Output_5`), 
`DT_node_lookup_6` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_8` <= 0.4868962273143151) THEN CASE WHEN (`ADS`.`Feature_2` <= 0.6635298189266661) THEN CASE WHEN (`ADS`.`Feature_5` <= 0.3142993323634745) THEN CASE WHEN (`ADS`.`Feature_1` <= -1.095359900156557) THEN 5 ELSE 6 END ELSE 7 END ELSE 8 END ELSE 9 END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_6` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 5 AS nid, -268.678015035932 AS `E` UNION ALL SELECT 6 AS nid, -111.65461423569401 AS `E` UNION ALL SELECT 7 AS nid, 68.7750180217587 AS `E` UNION ALL SELECT 8 AS nid, 133.96025744193 AS `E` UNION ALL SELECT 9 AS nid, 256.45095713798304 AS `E`) AS `Values`), 
`DT_Output_6` AS 
(SELECT `DT_node_lookup_6`.`KEY` AS `KEY`, `DT_node_lookup_6`.node_id_2 AS node_id_2, `DT_node_data_6`.nid AS nid, `DT_node_data_6`.`E` AS `E` 
FROM `DT_node_lookup_6` LEFT OUTER JOIN `DT_node_data_6` ON `DT_node_lookup_6`.node_id_2 = `DT_node_data_6`.nid), 
`RF_Model_6` AS 
(SELECT `DT_Output_6`.`KEY` AS `KEY`, `DT_Output_6`.`E` AS `Estimator` 
FROM `DT_Output_6`), 
`DT_node_lookup_7` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_4` <= -1.056875732169196) THEN 2 ELSE CASE WHEN (`ADS`.`Feature_0` <= 1.1521313128676909) THEN CASE WHEN (`ADS`.`Feature_2` <= 0.7939394135047745) THEN CASE WHEN (`ADS`.`Feature_8` <= 0.4868962273143151) THEN CASE WHEN (`ADS`.`Feature_1` <= -0.7673072786425086) THEN 7 ELSE CASE WHEN (`ADS`.`Feature_2` <= -0.7051913326628592) THEN 9 ELSE 10 END END ELSE 11 END ELSE 12 END ELSE 13 END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_7` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 2 AS nid, -190.443152178401 AS `E` UNION ALL SELECT 7 AS nid, -133.36657167721 AS `E` UNION ALL SELECT 9 AS nid, -31.2872477545953 AS `E` UNION ALL SELECT 10 AS nid, 43.2323213145537 AS `E` UNION ALL SELECT 11 AS nid, 167.477680514662 AS `E` UNION ALL SELECT 12 AS nid, 240.10734194299198 AS `E` UNION ALL SELECT 13 AS nid, 350.80206878437104 AS `E`) AS `Values`), 
`DT_Output_7` AS 
(SELECT `DT_node_lookup_7`.`KEY` AS `KEY`, `DT_node_lookup_7`.node_id_2 AS node_id_2, `DT_node_data_7`.nid AS nid, `DT_node_data_7`.`E` AS `E` 
FROM `DT_node_lookup_7` LEFT OUTER JOIN `DT_node_data_7` ON `DT_node_lookup_7`.node_id_2 = `DT_node_data_7`.nid), 
`RF_Model_7` AS 
(SELECT `DT_Output_7`.`KEY` AS `KEY`, `DT_Output_7`.`E` AS `Estimator` 
FROM `DT_Output_7`), 
`DT_node_lookup_8` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 0.3189943963893445) THEN CASE WHEN (`ADS`.`Feature_1` <= -0.014980996492931432) THEN CASE WHEN (`ADS`.`Feature_5` <= 0.6069251466869219) THEN CASE WHEN (`ADS`.`Feature_3` <= 0.1417001850164255) THEN 5 ELSE 6 END ELSE 7 END ELSE 8 END ELSE CASE WHEN (`ADS`.`Feature_4` <= -0.2685204667699346) THEN 10 ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.1306274931517295) THEN 12 ELSE 13 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_8` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 5 AS nid, -294.426317963539 AS `E` UNION ALL SELECT 6 AS nid, -146.50639897245702 AS `E` UNION ALL SELECT 7 AS nid, -61.653962586479594 AS `E` UNION ALL SELECT 8 AS nid, 45.4895050564965 AS `E` UNION ALL SELECT 10 AS nid, -0.194928884757988 AS `E` UNION ALL SELECT 12 AS nid, 123.289053515727 AS `E` UNION ALL SELECT 13 AS nid, 245.720135741281 AS `E`) AS `Values`), 
`DT_Output_8` AS 
(SELECT `DT_node_lookup_8`.`KEY` AS `KEY`, `DT_node_lookup_8`.node_id_2 AS node_id_2, `DT_node_data_8`.nid AS nid, `DT_node_data_8`.`E` AS `E` 
FROM `DT_node_lookup_8` LEFT OUTER JOIN `DT_node_data_8` ON `DT_node_lookup_8`.node_id_2 = `DT_node_data_8`.nid), 
`RF_Model_8` AS 
(SELECT `DT_Output_8`.`KEY` AS `KEY`, `DT_Output_8`.`E` AS `Estimator` 
FROM `DT_Output_8`), 
`DT_node_lookup_9` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 0.5686299031785073) THEN CASE WHEN (`ADS`.`Feature_6` <= -0.3376027568500307) THEN CASE WHEN (`ADS`.`Feature_5` <= -0.7506181799438272) THEN 4 ELSE 5 END ELSE CASE WHEN (`ADS`.`Feature_5` <= 1.097882598377592) THEN CASE WHEN (`ADS`.`Feature_7` <= 0.1837672692879219) THEN 8 ELSE 9 END ELSE 10 END END ELSE CASE WHEN (`ADS`.`Feature_0` <= 0.4043527991246496) THEN 12 ELSE 13 END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_9` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -271.458701653373 AS `E` UNION ALL SELECT 5 AS nid, -114.93727227905599 AS `E` UNION ALL SELECT 8 AS nid, -94.21838045981069 AS `E` UNION ALL SELECT 9 AS nid, -0.434799775900151 AS `E` UNION ALL SELECT 10 AS nid, 250.890624264709 AS `E` UNION ALL SELECT 12 AS nid, 119.183995641475 AS `E` UNION ALL SELECT 13 AS nid, 269.904306818937 AS `E`) AS `Values`), 
`DT_Output_9` AS 
(SELECT `DT_node_lookup_9`.`KEY` AS `KEY`, `DT_node_lookup_9`.node_id_2 AS node_id_2, `DT_node_data_9`.nid AS nid, `DT_node_data_9`.`E` AS `E` 
FROM `DT_node_lookup_9` LEFT OUTER JOIN `DT_node_data_9` ON `DT_node_lookup_9`.node_id_2 = `DT_node_data_9`.nid), 
`RF_Model_9` AS 
(SELECT `DT_Output_9`.`KEY` AS `KEY`, `DT_Output_9`.`E` AS `Estimator` 
FROM `DT_Output_9`)
 SELECT `RF_esu_0`.`KEY`, `RF_esu_0`.`Estimator` 
FROM (SELECT `RF_Model_0`.`KEY` AS `KEY`, CAST(`RF_Model_0`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_0` UNION ALL SELECT `RF_Model_1`.`KEY` AS `KEY`, CAST(`RF_Model_1`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_1` UNION ALL SELECT `RF_Model_2`.`KEY` AS `KEY`, CAST(`RF_Model_2`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_2` UNION ALL SELECT `RF_Model_3`.`KEY` AS `KEY`, CAST(`RF_Model_3`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_3` UNION ALL SELECT `RF_Model_4`.`KEY` AS `KEY`, CAST(`RF_Model_4`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_4` UNION ALL SELECT `RF_Model_5`.`KEY` AS `KEY`, CAST(`RF_Model_5`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_5` UNION ALL SELECT `RF_Model_6`.`KEY` AS `KEY`, CAST(`RF_Model_6`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_6` UNION ALL SELECT `RF_Model_7`.`KEY` AS `KEY`, CAST(`RF_Model_7`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_7` UNION ALL SELECT `RF_Model_8`.`KEY` AS `KEY`, CAST(`RF_Model_8`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_8` UNION ALL SELECT `RF_Model_9`.`KEY` AS `KEY`, CAST(`RF_Model_9`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_9`) AS `RF_esu_0`), 
`RF_1` AS 
(WITH `DT_node_lookup_10` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_8` <= 1.371858099026126) THEN CASE WHEN (`ADS`.`Feature_2` <= 0.9380136904955608) THEN CASE WHEN (`ADS`.`Feature_5` <= -0.5336312908433302) THEN 4 ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.1637200925582812) THEN CASE WHEN (`ADS`.`Feature_4` <= 0.2713068995986149) THEN 7 ELSE 8 END ELSE CASE WHEN (`ADS`.`Feature_7` <= -0.4859884920974707) THEN 10 ELSE 11 END END END ELSE 12 END ELSE 13 END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_10` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -200.678619751466 AS `E` UNION ALL SELECT 7 AS nid, -105.830650289593 AS `E` UNION ALL SELECT 8 AS nid, -5.28837838859369 AS `E` UNION ALL SELECT 10 AS nid, 23.6223581558639 AS `E` UNION ALL SELECT 11 AS nid, 264.56745970169703 AS `E` UNION ALL SELECT 12 AS nid, 198.402380347318 AS `E` UNION ALL SELECT 13 AS nid, 345.046810435524 AS `E`) AS `Values`), 
`DT_Output_10` AS 
(SELECT `DT_node_lookup_10`.`KEY` AS `KEY`, `DT_node_lookup_10`.node_id_2 AS node_id_2, `DT_node_data_10`.nid AS nid, `DT_node_data_10`.`E` AS `E` 
FROM `DT_node_lookup_10` LEFT OUTER JOIN `DT_node_data_10` ON `DT_node_lookup_10`.node_id_2 = `DT_node_data_10`.nid), 
`RF_Model_10` AS 
(SELECT `DT_Output_10`.`KEY` AS `KEY`, `DT_Output_10`.`E` AS `Estimator` 
FROM `DT_Output_10`), 
`DT_node_lookup_11` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_5` <= -0.7073458532617333) THEN 2 ELSE CASE WHEN (`ADS`.`Feature_1` <= -0.6481408566108926) THEN CASE WHEN (`ADS`.`Feature_8` <= -1.751625343391991) THEN 5 ELSE 6 END ELSE CASE WHEN (`ADS`.`Feature_8` <= -0.4025380964924924) THEN 8 ELSE CASE WHEN (`ADS`.`Feature_8` <= 0.3804535114147103) THEN 10 ELSE 11 END END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_11` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 2 AS nid, -197.464373065327 AS `E` UNION ALL SELECT 5 AS nid, -146.674367556594 AS `E` UNION ALL SELECT 6 AS nid, 20.6031009535703 AS `E` UNION ALL SELECT 8 AS nid, -55.0443139985451 AS `E` UNION ALL SELECT 10 AS nid, 148.771218753721 AS `E` UNION ALL SELECT 11 AS nid, 258.81217164425897 AS `E`) AS `Values`), 
`DT_Output_11` AS 
(SELECT `DT_node_lookup_11`.`KEY` AS `KEY`, `DT_node_lookup_11`.node_id_2 AS node_id_2, `DT_node_data_11`.nid AS nid, `DT_node_data_11`.`E` AS `E` 
FROM `DT_node_lookup_11` LEFT OUTER JOIN `DT_node_data_11` ON `DT_node_lookup_11`.node_id_2 = `DT_node_data_11`.nid), 
`RF_Model_11` AS 
(SELECT `DT_Output_11`.`KEY` AS `KEY`, `DT_Output_11`.`E` AS `Estimator` 
FROM `DT_Output_11`), 
`DT_node_lookup_12` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= -0.3134723767948273) THEN CASE WHEN (`ADS`.`Feature_8` <= 0.2527382359077959) THEN 3 ELSE 4 END ELSE CASE WHEN (`ADS`.`Feature_4` <= -0.8712378800310411) THEN 6 ELSE CASE WHEN (`ADS`.`Feature_1` <= -0.4083097367481784) THEN CASE WHEN (`ADS`.`Feature_2` <= 0.3928388355825836) THEN 9 ELSE 10 END ELSE CASE WHEN (`ADS`.`Feature_7` <= 0.6098850048713202) THEN 12 ELSE 13 END END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_12` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 3 AS nid, -192.86555043359698 AS `E` UNION ALL SELECT 4 AS nid, -37.7109473362081 AS `E` UNION ALL SELECT 6 AS nid, -158.24643540173201 AS `E` UNION ALL SELECT 9 AS nid, -22.834593343229 AS `E` UNION ALL SELECT 10 AS nid, 184.09677195300597 AS `E` UNION ALL SELECT 12 AS nid, 194.083316351338 AS `E` UNION ALL SELECT 13 AS nid, 303.248546378259 AS `E`) AS `Values`), 
`DT_Output_12` AS 
(SELECT `DT_node_lookup_12`.`KEY` AS `KEY`, `DT_node_lookup_12`.node_id_2 AS node_id_2, `DT_node_data_12`.nid AS nid, `DT_node_data_12`.`E` AS `E` 
FROM `DT_node_lookup_12` LEFT OUTER JOIN `DT_node_data_12` ON `DT_node_lookup_12`.node_id_2 = `DT_node_data_12`.nid), 
`RF_Model_12` AS 
(SELECT `DT_Output_12`.`KEY` AS `KEY`, `DT_Output_12`.`E` AS `Estimator` 
FROM `DT_Output_12`), 
`DT_node_lookup_13` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_8` <= -0.2482922016106332) THEN CASE WHEN (`ADS`.`Feature_1` <= 0.14357443390062802) THEN CASE WHEN (`ADS`.`Feature_5` <= 0.2163651917284173) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN (`ADS`.`Feature_0` <= 1.4884859009409979) THEN CASE WHEN (`ADS`.`Feature_5` <= -0.6314193013700002) THEN 9 ELSE CASE WHEN (`ADS`.`Feature_2` <= -0.032772530203207216) THEN 11 ELSE 12 END END ELSE 13 END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_13` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -254.990999217019 AS `E` UNION ALL SELECT 5 AS nid, -59.19747458177711 AS `E` UNION ALL SELECT 6 AS nid, 5.65243483859097 AS `E` UNION ALL SELECT 9 AS nid, -191.22554472073102 AS `E` UNION ALL SELECT 11 AS nid, 79.321386951701 AS `E` UNION ALL SELECT 12 AS nid, 201.813868592695 AS `E` UNION ALL SELECT 13 AS nid, 361.5145364822 AS `E`) AS `Values`), 
`DT_Output_13` AS 
(SELECT `DT_node_lookup_13`.`KEY` AS `KEY`, `DT_node_lookup_13`.node_id_2 AS node_id_2, `DT_node_data_13`.nid AS nid, `DT_node_data_13`.`E` AS `E` 
FROM `DT_node_lookup_13` LEFT OUTER JOIN `DT_node_data_13` ON `DT_node_lookup_13`.node_id_2 = `DT_node_data_13`.nid), 
`RF_Model_13` AS 
(SELECT `DT_Output_13`.`KEY` AS `KEY`, `DT_Output_13`.`E` AS `Estimator` 
FROM `DT_Output_13`), 
`DT_node_lookup_14` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_8` <= -0.2482922016106332) THEN CASE WHEN (`ADS`.`Feature_2` <= 0.6635298189266661) THEN CASE WHEN (`ADS`.`Feature_3` <= -1.1184345137667329) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN (`ADS`.`Feature_0` <= 0.2459499062971691) THEN 8 ELSE CASE WHEN (`ADS`.`Feature_0` <= 1.083107983728137) THEN 10 ELSE 11 END END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_14` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -274.97707541579 AS `E` UNION ALL SELECT 5 AS nid, -65.1991895519049 AS `E` UNION ALL SELECT 6 AS nid, 61.3460525924147 AS `E` UNION ALL SELECT 8 AS nid, -18.308525345564 AS `E` UNION ALL SELECT 10 AS nid, 170.397062781563 AS `E` UNION ALL SELECT 11 AS nid, 321.160601184467 AS `E`) AS `Values`), 
`DT_Output_14` AS 
(SELECT `DT_node_lookup_14`.`KEY` AS `KEY`, `DT_node_lookup_14`.node_id_2 AS node_id_2, `DT_node_data_14`.nid AS nid, `DT_node_data_14`.`E` AS `E` 
FROM `DT_node_lookup_14` LEFT OUTER JOIN `DT_node_data_14` ON `DT_node_lookup_14`.node_id_2 = `DT_node_data_14`.nid), 
`RF_Model_14` AS 
(SELECT `DT_Output_14`.`KEY` AS `KEY`, `DT_Output_14`.`E` AS `Estimator` 
FROM `DT_Output_14`), 
`DT_node_lookup_15` AS 
(SELECT `ADS`.`KEY` AS `KEY`, CASE WHEN (`ADS`.`Feature_2` <= 0.7379869754948905) THEN CASE WHEN (`ADS`.`Feature_8` <= -0.1506074374291746) THEN CASE WHEN (`ADS`.`Feature_4` <= -0.5580918930264211) THEN 4 ELSE 5 END ELSE 6 END ELSE CASE WHEN (`ADS`.`Feature_8` <= 0.4931714251821265) THEN 8 ELSE 9 END END AS node_id_2 
FROM `RandomReg_10` AS `ADS`), 
`DT_node_data_15` AS 
(SELECT `Values`.nid AS nid, `Values`.`E` AS `E` 
FROM (SELECT 4 AS nid, -236.31339816752498 AS `E` UNION ALL SELECT 5 AS nid, -55.226005513016794 AS `E` UNION ALL SELECT 6 AS nid, 93.6205911148596 AS `E` UNION ALL SELECT 8 AS nid, 217.148632933894 AS `E` UNION ALL SELECT 9 AS nid, 326.267013258648 AS `E`) AS `Values`), 
`DT_Output_15` AS 
(SELECT `DT_node_lookup_15`.`KEY` AS `KEY`, `DT_node_lookup_15`.node_id_2 AS node_id_2, `DT_node_data_15`.nid AS nid, `DT_node_data_15`.`E` AS `E` 
FROM `DT_node_lookup_15` LEFT OUTER JOIN `DT_node_data_15` ON `DT_node_lookup_15`.node_id_2 = `DT_node_data_15`.nid), 
`RF_Model_15` AS 
(SELECT `DT_Output_15`.`KEY` AS `KEY`, `DT_Output_15`.`E` AS `Estimator` 
FROM `DT_Output_15`)
 SELECT `RF_esu_1`.`KEY`, `RF_esu_1`.`Estimator` 
FROM (SELECT `RF_Model_10`.`KEY` AS `KEY`, CAST(`RF_Model_10`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_10` UNION ALL SELECT `RF_Model_11`.`KEY` AS `KEY`, CAST(`RF_Model_11`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_11` UNION ALL SELECT `RF_Model_12`.`KEY` AS `KEY`, CAST(`RF_Model_12`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_12` UNION ALL SELECT `RF_Model_13`.`KEY` AS `KEY`, CAST(`RF_Model_13`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_13` UNION ALL SELECT `RF_Model_14`.`KEY` AS `KEY`, CAST(`RF_Model_14`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_14` UNION ALL SELECT `RF_Model_15`.`KEY` AS `KEY`, CAST(`RF_Model_15`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_Model_15`) AS `RF_esu_1`), 
`RF` AS 
(SELECT `RFbig_esu`.`KEY` AS `KEY`, `RFbig_esu`.`Estimator` AS `Estimator` 
FROM (SELECT `RF_0`.`KEY` AS `KEY`, CAST(`RF_0`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_0` UNION ALL SELECT `RF_1`.`KEY` AS `KEY`, CAST(`RF_1`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM `RF_1`) AS `RFbig_esu`), 
`RF_avg` AS 
(SELECT `T`.`KEY` AS `KEY`, CAST(`T`.`Estimator` AS DOUBLE) AS `Estimator` 
FROM (SELECT `RF`.`KEY` AS `KEY`, avg(CAST(`RF`.`Estimator` AS DOUBLE)) AS `Estimator` 
FROM `RF` GROUP BY `RF`.`KEY`) AS `T`)
 SELECT `RF_avg`.`KEY` AS `KEY`, `RF_avg`.`Estimator` AS `Estimator` 
FROM `RF_avg`