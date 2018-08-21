-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet
-- Dataset : RandomReg_100
-- Database : pgsql


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH linear_input AS 
(SELECT "ADS"."KEY" AS "KEY", CAST("ADS"."Feature_0" AS FLOAT) AS "Feature_0", CAST("ADS"."Feature_1" AS FLOAT) AS "Feature_1", CAST("ADS"."Feature_2" AS FLOAT) AS "Feature_2", CAST("ADS"."Feature_3" AS FLOAT) AS "Feature_3", CAST("ADS"."Feature_4" AS FLOAT) AS "Feature_4", CAST("ADS"."Feature_5" AS FLOAT) AS "Feature_5", CAST("ADS"."Feature_6" AS FLOAT) AS "Feature_6", CAST("ADS"."Feature_7" AS FLOAT) AS "Feature_7", CAST("ADS"."Feature_8" AS FLOAT) AS "Feature_8", CAST("ADS"."Feature_9" AS FLOAT) AS "Feature_9", CAST("ADS"."Feature_10" AS FLOAT) AS "Feature_10", CAST("ADS"."Feature_11" AS FLOAT) AS "Feature_11", CAST("ADS"."Feature_12" AS FLOAT) AS "Feature_12", CAST("ADS"."Feature_13" AS FLOAT) AS "Feature_13", CAST("ADS"."Feature_14" AS FLOAT) AS "Feature_14", CAST("ADS"."Feature_15" AS FLOAT) AS "Feature_15", CAST("ADS"."Feature_16" AS FLOAT) AS "Feature_16", CAST("ADS"."Feature_17" AS FLOAT) AS "Feature_17", CAST("ADS"."Feature_18" AS FLOAT) AS "Feature_18", CAST("ADS"."Feature_19" AS FLOAT) AS "Feature_19", CAST("ADS"."Feature_20" AS FLOAT) AS "Feature_20", CAST("ADS"."Feature_21" AS FLOAT) AS "Feature_21", CAST("ADS"."Feature_22" AS FLOAT) AS "Feature_22", CAST("ADS"."Feature_23" AS FLOAT) AS "Feature_23", CAST("ADS"."Feature_24" AS FLOAT) AS "Feature_24", CAST("ADS"."Feature_25" AS FLOAT) AS "Feature_25", CAST("ADS"."Feature_26" AS FLOAT) AS "Feature_26", CAST("ADS"."Feature_27" AS FLOAT) AS "Feature_27", CAST("ADS"."Feature_28" AS FLOAT) AS "Feature_28", CAST("ADS"."Feature_29" AS FLOAT) AS "Feature_29", CAST("ADS"."Feature_30" AS FLOAT) AS "Feature_30", CAST("ADS"."Feature_31" AS FLOAT) AS "Feature_31", CAST("ADS"."Feature_32" AS FLOAT) AS "Feature_32", CAST("ADS"."Feature_33" AS FLOAT) AS "Feature_33", CAST("ADS"."Feature_34" AS FLOAT) AS "Feature_34", CAST("ADS"."Feature_35" AS FLOAT) AS "Feature_35", CAST("ADS"."Feature_36" AS FLOAT) AS "Feature_36", CAST("ADS"."Feature_37" AS FLOAT) AS "Feature_37", CAST("ADS"."Feature_38" AS FLOAT) AS "Feature_38", CAST("ADS"."Feature_39" AS FLOAT) AS "Feature_39", CAST("ADS"."Feature_40" AS FLOAT) AS "Feature_40", CAST("ADS"."Feature_41" AS FLOAT) AS "Feature_41", CAST("ADS"."Feature_42" AS FLOAT) AS "Feature_42", CAST("ADS"."Feature_43" AS FLOAT) AS "Feature_43", CAST("ADS"."Feature_44" AS FLOAT) AS "Feature_44", CAST("ADS"."Feature_45" AS FLOAT) AS "Feature_45", CAST("ADS"."Feature_46" AS FLOAT) AS "Feature_46", CAST("ADS"."Feature_47" AS FLOAT) AS "Feature_47", CAST("ADS"."Feature_48" AS FLOAT) AS "Feature_48", CAST("ADS"."Feature_49" AS FLOAT) AS "Feature_49", CAST("ADS"."Feature_50" AS FLOAT) AS "Feature_50", CAST("ADS"."Feature_51" AS FLOAT) AS "Feature_51", CAST("ADS"."Feature_52" AS FLOAT) AS "Feature_52", CAST("ADS"."Feature_53" AS FLOAT) AS "Feature_53", CAST("ADS"."Feature_54" AS FLOAT) AS "Feature_54", CAST("ADS"."Feature_55" AS FLOAT) AS "Feature_55", CAST("ADS"."Feature_56" AS FLOAT) AS "Feature_56", CAST("ADS"."Feature_57" AS FLOAT) AS "Feature_57", CAST("ADS"."Feature_58" AS FLOAT) AS "Feature_58", CAST("ADS"."Feature_59" AS FLOAT) AS "Feature_59", CAST("ADS"."Feature_60" AS FLOAT) AS "Feature_60", CAST("ADS"."Feature_61" AS FLOAT) AS "Feature_61", CAST("ADS"."Feature_62" AS FLOAT) AS "Feature_62", CAST("ADS"."Feature_63" AS FLOAT) AS "Feature_63", CAST("ADS"."Feature_64" AS FLOAT) AS "Feature_64", CAST("ADS"."Feature_65" AS FLOAT) AS "Feature_65", CAST("ADS"."Feature_66" AS FLOAT) AS "Feature_66", CAST("ADS"."Feature_67" AS FLOAT) AS "Feature_67", CAST("ADS"."Feature_68" AS FLOAT) AS "Feature_68", CAST("ADS"."Feature_69" AS FLOAT) AS "Feature_69", CAST("ADS"."Feature_70" AS FLOAT) AS "Feature_70", CAST("ADS"."Feature_71" AS FLOAT) AS "Feature_71", CAST("ADS"."Feature_72" AS FLOAT) AS "Feature_72", CAST("ADS"."Feature_73" AS FLOAT) AS "Feature_73", CAST("ADS"."Feature_74" AS FLOAT) AS "Feature_74", CAST("ADS"."Feature_75" AS FLOAT) AS "Feature_75", CAST("ADS"."Feature_76" AS FLOAT) AS "Feature_76", CAST("ADS"."Feature_77" AS FLOAT) AS "Feature_77", CAST("ADS"."Feature_78" AS FLOAT) AS "Feature_78", CAST("ADS"."Feature_79" AS FLOAT) AS "Feature_79", CAST("ADS"."Feature_80" AS FLOAT) AS "Feature_80", CAST("ADS"."Feature_81" AS FLOAT) AS "Feature_81", CAST("ADS"."Feature_82" AS FLOAT) AS "Feature_82", CAST("ADS"."Feature_83" AS FLOAT) AS "Feature_83", CAST("ADS"."Feature_84" AS FLOAT) AS "Feature_84", CAST("ADS"."Feature_85" AS FLOAT) AS "Feature_85", CAST("ADS"."Feature_86" AS FLOAT) AS "Feature_86", CAST("ADS"."Feature_87" AS FLOAT) AS "Feature_87", CAST("ADS"."Feature_88" AS FLOAT) AS "Feature_88", CAST("ADS"."Feature_89" AS FLOAT) AS "Feature_89", CAST("ADS"."Feature_90" AS FLOAT) AS "Feature_90", CAST("ADS"."Feature_91" AS FLOAT) AS "Feature_91", CAST("ADS"."Feature_92" AS FLOAT) AS "Feature_92", CAST("ADS"."Feature_93" AS FLOAT) AS "Feature_93", CAST("ADS"."Feature_94" AS FLOAT) AS "Feature_94", CAST("ADS"."Feature_95" AS FLOAT) AS "Feature_95", CAST("ADS"."Feature_96" AS FLOAT) AS "Feature_96", CAST("ADS"."Feature_97" AS FLOAT) AS "Feature_97", CAST("ADS"."Feature_98" AS FLOAT) AS "Feature_98", CAST("ADS"."Feature_99" AS FLOAT) AS "Feature_99" 
FROM "RandomReg_100" AS "ADS"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", 0.0 * linear_input."Feature_0" + 0.0 * linear_input."Feature_1" + 0.0 * linear_input."Feature_2" + 0.0 * linear_input."Feature_3" + 0.0 * linear_input."Feature_4" + 0.0 * linear_input."Feature_5" + 0.0 * linear_input."Feature_6" + 0.0 * linear_input."Feature_7" + 0.0 * linear_input."Feature_8" + 0.0 * linear_input."Feature_9" + 0.0 * linear_input."Feature_10" + 0.0 * linear_input."Feature_11" + 0.0 * linear_input."Feature_12" + 0.0 * linear_input."Feature_13" + 0.0 * linear_input."Feature_14" + 0.0 * linear_input."Feature_15" + 18.510234036858662 * linear_input."Feature_16" + 0.0 * linear_input."Feature_17" + 0.0 * linear_input."Feature_18" + 0.0 * linear_input."Feature_19" + 0.0 * linear_input."Feature_20" + 0.0 * linear_input."Feature_21" + 0.0 * linear_input."Feature_22" + 0.0 * linear_input."Feature_23" + 0.0 * linear_input."Feature_24" + 0.0 * linear_input."Feature_25" + 0.0 * linear_input."Feature_26" + 0.0 * linear_input."Feature_27" + 0.0 * linear_input."Feature_28" + 0.0 * linear_input."Feature_29" + 0.0 * linear_input."Feature_30" + 0.0 * linear_input."Feature_31" + 0.0 * linear_input."Feature_32" + 0.0 * linear_input."Feature_33" + 0.0 * linear_input."Feature_34" + 0.0 * linear_input."Feature_35" + 0.0 * linear_input."Feature_36" + 0.0 * linear_input."Feature_37" + 0.0 * linear_input."Feature_38" + 73.2972562600153 * linear_input."Feature_39" + 0.0 * linear_input."Feature_40" + 71.1962718916975 * linear_input."Feature_41" + 0.0 * linear_input."Feature_42" + 0.0 * linear_input."Feature_43" + 16.744638139434258 * linear_input."Feature_44" + 0.0 * linear_input."Feature_45" + 0.0 * linear_input."Feature_46" + 0.0 * linear_input."Feature_47" + 0.0 * linear_input."Feature_48" + 25.46608653347435 * linear_input."Feature_49" + 0.0 * linear_input."Feature_50" + 0.0 * linear_input."Feature_51" + 0.0 * linear_input."Feature_52" + 0.0 * linear_input."Feature_53" + 0.0 * linear_input."Feature_54" + 0.0 * linear_input."Feature_55" + 0.0 * linear_input."Feature_56" + 0.0 * linear_input."Feature_57" + 0.0 * linear_input."Feature_58" + 0.0 * linear_input."Feature_59" + 0.0 * linear_input."Feature_60" + 0.0 * linear_input."Feature_61" + 0.0 * linear_input."Feature_62" + 65.82757639546317 * linear_input."Feature_63" + 0.0 * linear_input."Feature_64" + 0.0 * linear_input."Feature_65" + 0.0 * linear_input."Feature_66" + 0.0 * linear_input."Feature_67" + 13.28565392958224 * linear_input."Feature_68" + 0.0 * linear_input."Feature_69" + 0.0 * linear_input."Feature_70" + 0.0 * linear_input."Feature_71" + 0.0 * linear_input."Feature_72" + 0.0 * linear_input."Feature_73" + 0.0 * linear_input."Feature_74" + 0.0 * linear_input."Feature_75" + 0.0 * linear_input."Feature_76" + 0.0 * linear_input."Feature_77" + 0.0 * linear_input."Feature_78" + 0.0 * linear_input."Feature_79" + 83.35905827216364 * linear_input."Feature_80" + 0.0 * linear_input."Feature_81" + 0.0 * linear_input."Feature_82" + 0.0 * linear_input."Feature_83" + 0.0 * linear_input."Feature_84" + 0.0 * linear_input."Feature_85" + 0.0 * linear_input."Feature_86" + 0.0 * linear_input."Feature_87" + 0.0 * linear_input."Feature_88" + 0.0 * linear_input."Feature_89" + 0.0 * linear_input."Feature_90" + 0.0 * linear_input."Feature_91" + 0.0 * linear_input."Feature_92" + 0.0 * linear_input."Feature_93" + 0.0 * linear_input."Feature_94" + 82.0372941718786 * linear_input."Feature_95" + 0.0 * linear_input."Feature_96" + 0.0 * linear_input."Feature_97" + 0.0 * linear_input."Feature_98" + 0.0 * linear_input."Feature_99" + -1.36508834734748 AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte