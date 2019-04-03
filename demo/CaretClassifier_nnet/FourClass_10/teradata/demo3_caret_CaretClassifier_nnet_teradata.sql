-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretClassifier_nnet
-- Dataset : FourClass_10
-- Database : teradata


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "IL" AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS DOUBLE PRECISION) AS "Feature_0", CAST("ADS"."Feature_1" AS DOUBLE PRECISION) AS "Feature_1", CAST("ADS"."Feature_2" AS DOUBLE PRECISION) AS "Feature_2", CAST("ADS"."Feature_3" AS DOUBLE PRECISION) AS "Feature_3", CAST("ADS"."Feature_4" AS DOUBLE PRECISION) AS "Feature_4", CAST("ADS"."Feature_5" AS DOUBLE PRECISION) AS "Feature_5", CAST("ADS"."Feature_6" AS DOUBLE PRECISION) AS "Feature_6", CAST("ADS"."Feature_7" AS DOUBLE PRECISION) AS "Feature_7", CAST("ADS"."Feature_8" AS DOUBLE PRECISION) AS "Feature_8", CAST("ADS"."Feature_9" AS DOUBLE PRECISION) AS "Feature_9" 
FROM "FourClass_10" AS "ADS"), 
"HL_BA_1" AS 
(SELECT "IL"."KEY" AS "KEY", CAST(-1.651662 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(1.845718 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-0.01562079 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.1274862 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(1.487272 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-0.07394767 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.3315006 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-1.790184 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(1.325039 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(1.933444 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(1.427408 AS DOUBLE PRECISION) AS "NEUR_1_1", CAST(-1.018354 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(1.118241 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.450062 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(2.09441 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(2.037287 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(2.223254 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(-0.7981725 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(0.05314979 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(0.3214303 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(-1.531757 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(-1.330549 AS DOUBLE PRECISION) AS "NEUR_1_2", CAST(2.069882 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-1.185341 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-1.192164 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.9236574 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-1.581089 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-2.286624 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.1869901 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(0.5310627 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(0.7408143 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(4.099371 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(-1.329097 AS DOUBLE PRECISION) AS "NEUR_1_3", CAST(1.650026 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(2.717332 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.390106 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(1.499331 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(1.045106 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-0.9247347 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.03384548 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-3.115749 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(-0.7884556 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(2.008505 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(0.5693499 AS DOUBLE PRECISION) AS "NEUR_1_4", CAST(-0.5770777 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-3.019643 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(0.7325906 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-2.465286 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(1.433634 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-0.1134266 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.8349705 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-0.5591612 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(1.130861 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(-1.010465 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(2.173622 AS DOUBLE PRECISION) AS "NEUR_1_5", CAST(-0.2477715 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-0.001503881 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-2.156722 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.4561067 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(2.399096 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(0.1985589 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.1052852 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(4.381391 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(0.3050465 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(-1.254042 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(1.499311 AS DOUBLE PRECISION) AS "NEUR_1_6", CAST(-1.338988 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(0.7438631 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.484616 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(1.834015 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-1.321465 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-0.2961341 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(-0.4781967 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-1.497869 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(0.782204 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(-0.1487667 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(-2.188113 AS DOUBLE PRECISION) AS "NEUR_1_7", CAST(-1.433482 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(1.056245 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(0.3298336 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(1.588044 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.317329 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(1.804727 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(-0.5113279 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(0.08454124 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(-0.412357 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(0.1856672 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(2.357765 AS DOUBLE PRECISION) AS "NEUR_1_8", CAST(2.376725 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(1.181278 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(0.1083273 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(1.641876 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-2.735579 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(0.1951922 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(-0.5399303 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-0.2453851 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(-1.877068 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(-1.933336 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(-2.331939 AS DOUBLE PRECISION) AS "NEUR_1_9", CAST(-2.318762 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-0.5748949 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(-1.164806 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-1.541052 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-2.143681 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(1.619624 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.6388997 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-1.236768 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(-0.6711701 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(-1.177695 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(-2.603578 AS DOUBLE PRECISION) AS "NEUR_1_10", CAST(-2.04289 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(1.403104 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(0.1976764 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(0.04046305 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.54531 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-1.402144 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(0.3954367 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(-3.023371 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(0.5998054 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(2.828694 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(1.253117 AS DOUBLE PRECISION) AS "NEUR_1_11", CAST(-0.2438417 AS DOUBLE PRECISION) * "IL"."Feature_0" + CAST(-1.787604 AS DOUBLE PRECISION) * "IL"."Feature_1" + CAST(1.784339 AS DOUBLE PRECISION) * "IL"."Feature_2" + CAST(-0.07624879 AS DOUBLE PRECISION) * "IL"."Feature_3" + CAST(-0.6931606 AS DOUBLE PRECISION) * "IL"."Feature_4" + CAST(-0.6516074 AS DOUBLE PRECISION) * "IL"."Feature_5" + CAST(-0.3143847 AS DOUBLE PRECISION) * "IL"."Feature_6" + CAST(0.01964755 AS DOUBLE PRECISION) * "IL"."Feature_7" + CAST(-4.350148 AS DOUBLE PRECISION) * "IL"."Feature_8" + CAST(1.427976 AS DOUBLE PRECISION) * "IL"."Feature_9" + CAST(-3.042775 AS DOUBLE PRECISION) AS "NEUR_1_12" 
FROM "IL"), 
"HL_1_logistic" AS 
(SELECT "HL_BA_1"."KEY" AS "KEY", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_1")))) AS "NEUR_1_1", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_2")))) AS "NEUR_1_2", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_3")))) AS "NEUR_1_3", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_4")))) AS "NEUR_1_4", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_5")))) AS "NEUR_1_5", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_6")))) AS "NEUR_1_6", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_7")))) AS "NEUR_1_7", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_8")))) AS "NEUR_1_8", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_9")))) AS "NEUR_1_9", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_10")))) AS "NEUR_1_10", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_11")))) AS "NEUR_1_11", CAST(1.0 AS DOUBLE PRECISION) / (CAST(1.0 AS DOUBLE PRECISION) + exp(least(CAST(100.0 AS DOUBLE PRECISION), greatest(-CAST(100.0 AS DOUBLE PRECISION), -"HL_BA_1"."NEUR_1_12")))) AS "NEUR_1_12" 
FROM "HL_BA_1"), 
"HL_1_logistic_1" AS 
(SELECT "HL_1_logistic"."KEY" AS "KEY", "HL_1_logistic"."NEUR_1_1" AS "NEUR_1_1", "HL_1_logistic"."NEUR_1_2" AS "NEUR_1_2", "HL_1_logistic"."NEUR_1_3" AS "NEUR_1_3", "HL_1_logistic"."NEUR_1_4" AS "NEUR_1_4", "HL_1_logistic"."NEUR_1_5" AS "NEUR_1_5", "HL_1_logistic"."NEUR_1_6" AS "NEUR_1_6", "HL_1_logistic"."NEUR_1_7" AS "NEUR_1_7", "HL_1_logistic"."NEUR_1_8" AS "NEUR_1_8", "HL_1_logistic"."NEUR_1_9" AS "NEUR_1_9", "HL_1_logistic"."NEUR_1_10" AS "NEUR_1_10", "HL_1_logistic"."NEUR_1_11" AS "NEUR_1_11", "HL_1_logistic"."NEUR_1_12" AS "NEUR_1_12" 
FROM "HL_1_logistic"), 
"OL_BA" AS 
(SELECT "HL_1_logistic_1"."KEY" AS "KEY", CAST(-1.333374 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(-1.127997 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(-0.1855517 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(0.4472295 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(9.332336 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(4.3873 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(-4.786372 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(-0.4808208 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(-2.118273 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(-5.983296 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(-2.437558 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(3.052213 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(1.782516 AS DOUBLE PRECISION) AS "NEUR_2_1", CAST(-0.6492255 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(2.724992 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(-7.011719 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(6.602941 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(-3.104725 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(0.9207786 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(1.568567 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(0.8328423 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(-5.116228 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(-3.837741 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(-1.328288 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(6.183143 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(-0.9431841 AS DOUBLE PRECISION) AS "NEUR_2_2", CAST(-1.637003 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(2.831291 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(7.930261 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(-6.986989 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(-0.5885611 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(1.414038 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(2.808503 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(-4.496042 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(0.9938878 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(7.54587 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(-1.122004 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(-4.353742 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(2.87825 AS DOUBLE PRECISION) AS "NEUR_2_3", CAST(4.022609 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_1" + CAST(-4.241332 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_2" + CAST(-0.487704 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_3" + CAST(-0.23581 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_4" + CAST(-5.942228 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_5" + CAST(-7.28127 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_6" + CAST(0.6563967 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_7" + CAST(4.788383 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_8" + CAST(6.043794 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_9" + CAST(2.502438 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_10" + CAST(5.197069 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_11" + CAST(-5.32506 AS DOUBLE PRECISION) * "HL_1_logistic_1"."NEUR_1_12" + CAST(-3.587187 AS DOUBLE PRECISION) AS "NEUR_2_4" 
FROM "HL_1_logistic_1"), 
"OL_softmax" AS 
(SELECT "OL_BA"."KEY" AS "KEY", "OL_BA"."NEUR_2_1" AS "NEUR_2_1", "OL_BA"."NEUR_2_2" AS "NEUR_2_2", "OL_BA"."NEUR_2_3" AS "NEUR_2_3", "OL_BA"."NEUR_2_4" AS "NEUR_2_4" 
FROM "OL_BA"), 
"OL_softmax_1" AS 
(SELECT "OL_softmax"."KEY" AS "KEY", "OL_softmax"."NEUR_2_1" AS "NEUR_2_1", "OL_softmax"."NEUR_2_2" AS "NEUR_2_2", "OL_softmax"."NEUR_2_3" AS "NEUR_2_3", "OL_softmax"."NEUR_2_4" AS "NEUR_2_4" 
FROM "OL_softmax"), 
orig_cte AS 
(SELECT "OL_softmax_1"."KEY" AS "KEY", "OL_softmax_1"."NEUR_2_1" AS "Score_0", "OL_softmax_1"."NEUR_2_2" AS "Score_1", "OL_softmax_1"."NEUR_2_3" AS "Score_2", "OL_softmax_1"."NEUR_2_4" AS "Score_3", CAST(NULL AS DOUBLE PRECISION) AS "Proba_0", CAST(NULL AS DOUBLE PRECISION) AS "Proba_1", CAST(NULL AS DOUBLE PRECISION) AS "Proba_2", CAST(NULL AS DOUBLE PRECISION) AS "Proba_3", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_0", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_1", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_2", CAST(NULL AS DOUBLE PRECISION) AS "LogProba_3", CAST(NULL AS BIGINT) AS "Decision", CAST(NULL AS DOUBLE PRECISION) AS "DecisionProba" 
FROM "OL_softmax_1"), 
score_class_union AS 
(SELECT scu."KEY_u" AS "KEY_u", scu."class" AS "class", scu."LogProba" AS "LogProba", scu."Proba" AS "Proba", scu."Score" AS "Score" 
FROM (SELECT orig_cte."KEY" AS "KEY_u", 0 AS "class", orig_cte."LogProba_0" AS "LogProba", orig_cte."Proba_0" AS "Proba", orig_cte."Score_0" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 1 AS "class", orig_cte."LogProba_1" AS "LogProba", orig_cte."Proba_1" AS "Proba", orig_cte."Score_1" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 2 AS "class", orig_cte."LogProba_2" AS "LogProba", orig_cte."Proba_2" AS "Proba", orig_cte."Score_2" AS "Score" 
FROM orig_cte UNION ALL SELECT orig_cte."KEY" AS "KEY_u", 3 AS "class", orig_cte."LogProba_3" AS "LogProba", orig_cte."Proba_3" AS "Proba", orig_cte."Score_3" AS "Score" 
FROM orig_cte) AS scu), 
score_max AS 
(SELECT orig_cte."KEY" AS "KEY", orig_cte."Score_0" AS "Score_0", orig_cte."Score_1" AS "Score_1", orig_cte."Score_2" AS "Score_2", orig_cte."Score_3" AS "Score_3", orig_cte."Proba_0" AS "Proba_0", orig_cte."Proba_1" AS "Proba_1", orig_cte."Proba_2" AS "Proba_2", orig_cte."Proba_3" AS "Proba_3", orig_cte."LogProba_0" AS "LogProba_0", orig_cte."LogProba_1" AS "LogProba_1", orig_cte."LogProba_2" AS "LogProba_2", orig_cte."LogProba_3" AS "LogProba_3", orig_cte."Decision" AS "Decision", orig_cte."DecisionProba" AS "DecisionProba", max_select."KEY_m" AS "KEY_m", max_select."max_Score" AS "max_Score" 
FROM orig_cte LEFT OUTER JOIN (SELECT score_class_union."KEY_u" AS "KEY_m", max(score_class_union."Score") AS "max_Score" 
FROM score_class_union GROUP BY score_class_union."KEY_u") AS max_select ON orig_cte."KEY" = max_select."KEY_m"), 
score_soft_max_deltas AS 
(SELECT score_max."KEY" AS "KEY", score_max."Score_0" AS "Score_0", score_max."Score_1" AS "Score_1", score_max."Score_2" AS "Score_2", score_max."Score_3" AS "Score_3", score_max."Proba_0" AS "Proba_0", score_max."Proba_1" AS "Proba_1", score_max."Proba_2" AS "Proba_2", score_max."Proba_3" AS "Proba_3", score_max."LogProba_0" AS "LogProba_0", score_max."LogProba_1" AS "LogProba_1", score_max."LogProba_2" AS "LogProba_2", score_max."LogProba_3" AS "LogProba_3", score_max."Decision" AS "Decision", score_max."DecisionProba" AS "DecisionProba", score_max."KEY_m" AS "KEY_m", score_max."max_Score" AS "max_Score", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_0" - score_max."max_Score")) AS "exp_delta_Score_0", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_1" - score_max."max_Score")) AS "exp_delta_Score_1", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_2" - score_max."max_Score")) AS "exp_delta_Score_2", exp(greatest(CAST(-100.0 AS DOUBLE PRECISION), score_max."Score_3" - score_max."max_Score")) AS "exp_delta_Score_3" 
FROM score_max), 
score_class_union_soft AS 
(SELECT soft_scu."KEY" AS "KEY", soft_scu."class" AS "class", soft_scu."exp_delta_Score" AS "exp_delta_Score" 
FROM (SELECT score_soft_max_deltas."KEY" AS "KEY", 0 AS "class", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 1 AS "class", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 2 AS "class", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score" 
FROM score_soft_max_deltas UNION ALL SELECT score_soft_max_deltas."KEY" AS "KEY", 3 AS "class", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score" 
FROM score_soft_max_deltas) AS soft_scu), 
score_soft_max AS 
(SELECT score_soft_max_deltas."KEY" AS "KEY", score_soft_max_deltas."Score_0" AS "Score_0", score_soft_max_deltas."Score_1" AS "Score_1", score_soft_max_deltas."Score_2" AS "Score_2", score_soft_max_deltas."Score_3" AS "Score_3", score_soft_max_deltas."Proba_0" AS "Proba_0", score_soft_max_deltas."Proba_1" AS "Proba_1", score_soft_max_deltas."Proba_2" AS "Proba_2", score_soft_max_deltas."Proba_3" AS "Proba_3", score_soft_max_deltas."LogProba_0" AS "LogProba_0", score_soft_max_deltas."LogProba_1" AS "LogProba_1", score_soft_max_deltas."LogProba_2" AS "LogProba_2", score_soft_max_deltas."LogProba_3" AS "LogProba_3", score_soft_max_deltas."Decision" AS "Decision", score_soft_max_deltas."DecisionProba" AS "DecisionProba", score_soft_max_deltas."KEY_m" AS "KEY_m", score_soft_max_deltas."max_Score" AS "max_Score", score_soft_max_deltas."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max_deltas."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max_deltas."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max_deltas."exp_delta_Score_3" AS "exp_delta_Score_3", sum_exp_t."KEY_sum" AS "KEY_sum", sum_exp_t."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_soft_max_deltas LEFT OUTER JOIN (SELECT score_class_union_soft."KEY" AS "KEY_sum", sum(score_class_union_soft."exp_delta_Score") AS "sum_ExpDeltaScore" 
FROM score_class_union_soft GROUP BY score_class_union_soft."KEY") AS sum_exp_t ON score_soft_max_deltas."KEY" = sum_exp_t."KEY_sum"), 
union_with_max AS 
(SELECT score_class_union."KEY_u" AS "KEY_u", score_class_union."class" AS "class", score_class_union."LogProba" AS "LogProba", score_class_union."Proba" AS "Proba", score_class_union."Score" AS "Score", score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore" 
FROM score_class_union LEFT OUTER JOIN score_soft_max ON score_class_union."KEY_u" = score_soft_max."KEY"), 
arg_max_cte AS 
(SELECT score_soft_max."KEY" AS "KEY", score_soft_max."Score_0" AS "Score_0", score_soft_max."Score_1" AS "Score_1", score_soft_max."Score_2" AS "Score_2", score_soft_max."Score_3" AS "Score_3", score_soft_max."Proba_0" AS "Proba_0", score_soft_max."Proba_1" AS "Proba_1", score_soft_max."Proba_2" AS "Proba_2", score_soft_max."Proba_3" AS "Proba_3", score_soft_max."LogProba_0" AS "LogProba_0", score_soft_max."LogProba_1" AS "LogProba_1", score_soft_max."LogProba_2" AS "LogProba_2", score_soft_max."LogProba_3" AS "LogProba_3", score_soft_max."Decision" AS "Decision", score_soft_max."DecisionProba" AS "DecisionProba", score_soft_max."KEY_m" AS "KEY_m", score_soft_max."max_Score" AS "max_Score", score_soft_max."exp_delta_Score_0" AS "exp_delta_Score_0", score_soft_max."exp_delta_Score_1" AS "exp_delta_Score_1", score_soft_max."exp_delta_Score_2" AS "exp_delta_Score_2", score_soft_max."exp_delta_Score_3" AS "exp_delta_Score_3", score_soft_max."KEY_sum" AS "KEY_sum", score_soft_max."sum_ExpDeltaScore" AS "sum_ExpDeltaScore", "arg_max_t_Score"."KEY_Score" AS "KEY_Score", "arg_max_t_Score"."arg_max_Score" AS "arg_max_Score", soft_max_comp."KEY_softmax" AS "KEY_softmax", soft_max_comp."SoftProba_0" AS "SoftProba_0", soft_max_comp."SoftProba_1" AS "SoftProba_1", soft_max_comp."SoftProba_2" AS "SoftProba_2", soft_max_comp."SoftProba_3" AS "SoftProba_3" 
FROM score_soft_max LEFT OUTER JOIN (SELECT union_with_max."KEY" AS "KEY_Score", max(union_with_max."class") AS "arg_max_Score" 
FROM union_with_max 
WHERE union_with_max."max_Score" <= union_with_max."Score" GROUP BY union_with_max."KEY") AS "arg_max_t_Score" ON score_soft_max."KEY" = "arg_max_t_Score"."KEY_Score" LEFT OUTER JOIN (SELECT score_soft_max."KEY" AS "KEY_softmax", score_soft_max."exp_delta_Score_0" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_0", score_soft_max."exp_delta_Score_1" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_1", score_soft_max."exp_delta_Score_2" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_2", score_soft_max."exp_delta_Score_3" / score_soft_max."sum_ExpDeltaScore" AS "SoftProba_3" 
FROM score_soft_max) AS soft_max_comp ON soft_max_comp."KEY_softmax" = "arg_max_t_Score"."KEY_Score")
 SELECT arg_max_cte."KEY" AS "KEY", CAST(NULL AS DOUBLE PRECISION) AS "Score_0", CAST(NULL AS DOUBLE PRECISION) AS "Score_1", CAST(NULL AS DOUBLE PRECISION) AS "Score_2", CAST(NULL AS DOUBLE PRECISION) AS "Score_3", arg_max_cte."SoftProba_0" AS "Proba_0", arg_max_cte."SoftProba_1" AS "Proba_1", arg_max_cte."SoftProba_2" AS "Proba_2", arg_max_cte."SoftProba_3" AS "Proba_3", CASE WHEN (arg_max_cte."SoftProba_0" IS NULL OR arg_max_cte."SoftProba_0" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_0") ELSE -1.79769313486231e+308 END AS "LogProba_0", CASE WHEN (arg_max_cte."SoftProba_1" IS NULL OR arg_max_cte."SoftProba_1" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_1") ELSE -1.79769313486231e+308 END AS "LogProba_1", CASE WHEN (arg_max_cte."SoftProba_2" IS NULL OR arg_max_cte."SoftProba_2" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_2") ELSE -1.79769313486231e+308 END AS "LogProba_2", CASE WHEN (arg_max_cte."SoftProba_3" IS NULL OR arg_max_cte."SoftProba_3" > CAST(0.0 AS DOUBLE PRECISION)) THEN ln(arg_max_cte."SoftProba_3") ELSE -1.79769313486231e+308 END AS "LogProba_3", arg_max_cte."arg_max_Score" AS "Decision", greatest(arg_max_cte."SoftProba_0", arg_max_cte."SoftProba_1", arg_max_cte."SoftProba_2", arg_max_cte."SoftProba_3") AS "DecisionProba" 
FROM arg_max_cte