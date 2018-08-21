-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_glmnet_pca
-- Dataset : boston
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH "CenteredDataForPCA" AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 3.3688565346534647) / 8.003438191901774 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 12.113861386138614) / 24.217647441147463 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 10.983613861386141) / 6.826200750364282 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 0.07178217821782178) / 0.2584469594478702 AS "Feature_3", (CAST("ADS"."Feature_4" AS DOUBLE) - 0.5541153465346534) / 0.1181544189262098 AS "Feature_4", (CAST("ADS"."Feature_5" AS DOUBLE) - 6.299148514851484) / 0.7069171793669617 AS "Feature_5", (CAST("ADS"."Feature_6" AS DOUBLE) - 67.85049504950496) / 28.14225428392539 AS "Feature_6", (CAST("ADS"."Feature_7" AS DOUBLE) - 3.8198420792079206) / 2.0959683176629325 AS "Feature_7", (CAST("ADS"."Feature_8" AS DOUBLE) - 9.559405940594061) / 8.73962685484057 AS "Feature_8", (CAST("ADS"."Feature_9" AS DOUBLE) - 405.8019801980198) / 169.99638120813233 AS "Feature_9", (CAST("ADS"."Feature_10" AS DOUBLE) - 18.409158415841585) / 2.169479311043464 AS "Feature_10", (CAST("ADS"."Feature_11" AS DOUBLE) - 358.3797277227722) / 90.75931171894922 AS "Feature_11", (CAST("ADS"."Feature_12" AS DOUBLE) - 12.626584158415842) / 7.176826037708456 AS "Feature_12" 
FROM boston AS "ADS"), 
"ADS_car_1_OUT" AS 
(SELECT "CenteredDataForPCA"."KEY" AS "KEY", "CenteredDataForPCA"."Feature_0" * 0.24841410578666634 + "CenteredDataForPCA"."Feature_1" * -0.25793045679790993 + "CenteredDataForPCA"."Feature_2" * 0.34939054530840163 + "CenteredDataForPCA"."Feature_3" * 0.01103178070706744 + "CenteredDataForPCA"."Feature_4" * 0.34187076794579857 + "CenteredDataForPCA"."Feature_5" * -0.1836781817569792 + "CenteredDataForPCA"."Feature_6" * 0.3131418744444361 + "CenteredDataForPCA"."Feature_7" * -0.32228158148313235 + "CenteredDataForPCA"."Feature_8" * 0.32113400831901884 + "CenteredDataForPCA"."Feature_9" * 0.3373437210361459 + "CenteredDataForPCA"."Feature_10" * 0.20420067126542288 + "CenteredDataForPCA"."Feature_11" * -0.2045262578878756 + "CenteredDataForPCA"."Feature_12" * 0.3107628818087805 AS caress_2, "CenteredDataForPCA"."Feature_0" * -0.331436237235216 + "CenteredDataForPCA"."Feature_1" * -0.343858870160862 + "CenteredDataForPCA"."Feature_2" * 0.08634951487655973 + "CenteredDataForPCA"."Feature_3" * 0.42706306899641816 + "CenteredDataForPCA"."Feature_4" * 0.2124923133456056 + "CenteredDataForPCA"."Feature_5" * 0.06345897527782733 + "CenteredDataForPCA"."Feature_6" * 0.31456796161991923 + "CenteredDataForPCA"."Feature_7" * -0.3388466237600608 + "CenteredDataForPCA"."Feature_8" * -0.3085072612941247 + "CenteredDataForPCA"."Feature_9" * -0.2778095353893425 + "CenteredDataForPCA"."Feature_10" * -0.291122675257368 + "CenteredDataForPCA"."Feature_11" * 0.2480141144595412 + "CenteredDataForPCA"."Feature_12" * -0.02244218146296809 AS caress_3, "CenteredDataForPCA"."Feature_0" * 0.1965899153802936 + "CenteredDataForPCA"."Feature_1" * 0.2503351867963905 + "CenteredDataForPCA"."Feature_2" * -0.02287137456789046 + "CenteredDataForPCA"."Feature_3" * 0.29091925541645786 + "CenteredDataForPCA"."Feature_4" * 0.14297001469595266 + "CenteredDataForPCA"."Feature_5" * 0.638932015726971 + "CenteredDataForPCA"."Feature_6" * 0.043450067145207966 + "CenteredDataForPCA"."Feature_7" * -0.10023447451258656 + "CenteredDataForPCA"."Feature_8" * 0.254378647658414 + "CenteredDataForPCA"."Feature_9" * 0.18930994415081187 + "CenteredDataForPCA"."Feature_10" * -0.3508996533778344 + "CenteredDataForPCA"."Feature_11" * -0.26966309283023066 + "CenteredDataForPCA"."Feature_12" * -0.2766273318428769 AS caress_4, "CenteredDataForPCA"."Feature_0" * -0.06962655675259406 + "CenteredDataForPCA"."Feature_1" * -0.3673577640145995 + "CenteredDataForPCA"."Feature_2" * 0.00449678830389115 + "CenteredDataForPCA"."Feature_3" * -0.41019842177397103 + "CenteredDataForPCA"."Feature_4" * -0.08469394755450847 + "CenteredDataForPCA"."Feature_5" * 0.4799253632736895 + "CenteredDataForPCA"."Feature_6" * 0.09402537438665684 + "CenteredDataForPCA"."Feature_7" * -0.1868334076820512 + "CenteredDataForPCA"."Feature_8" * 0.09258217733073708 + "CenteredDataForPCA"."Feature_9" * 0.041277037894022366 + "CenteredDataForPCA"."Feature_10" * 0.4178977311232903 + "CenteredDataForPCA"."Feature_11" * 0.2959477643471333 + "CenteredDataForPCA"."Feature_12" * -0.3717118384515257 AS caress_5, "CenteredDataForPCA"."Feature_0" * 0.04828502431918075 + "CenteredDataForPCA"."Feature_1" * -0.03767048968934535 + "CenteredDataForPCA"."Feature_2" * 0.02149779912801638 + "CenteredDataForPCA"."Feature_3" * 0.7351016254721285 + "CenteredDataForPCA"."Feature_4" * -0.18554304520631426 + "CenteredDataForPCA"."Feature_5" * -0.06186149843352633 + "CenteredDataForPCA"."Feature_6" * -0.1651748185193224 + "CenteredDataForPCA"."Feature_7" * 0.14487675096690894 + "CenteredDataForPCA"."Feature_8" * 0.19706775612700847 + "CenteredDataForPCA"."Feature_9" * 0.14085090371660589 + "CenteredDataForPCA"."Feature_10" * 0.4721012006780772 + "CenteredDataForPCA"."Feature_11" * 0.26682218144720266 + "CenteredDataForPCA"."Feature_12" * -0.12704163672123284 AS caress_6, "CenteredDataForPCA"."Feature_0" * -0.4117545960920293 + "CenteredDataForPCA"."Feature_1" * -0.2761632560720824 + "CenteredDataForPCA"."Feature_2" * -0.009076813765589579 + "CenteredDataForPCA"."Feature_3" * 0.10870253999447858 + "CenteredDataForPCA"."Feature_4" * -0.09411617538631524 + "CenteredDataForPCA"."Feature_5" * 0.057999503395913685 + "CenteredDataForPCA"."Feature_6" * -0.11033317007784019 + "CenteredDataForPCA"."Feature_7" * 0.0386279661452304 + "CenteredDataForPCA"."Feature_8" * -0.08175006854777264 + "CenteredDataForPCA"."Feature_9" * -0.11253165613689584 + "CenteredDataForPCA"."Feature_10" * 0.2608308935943642 + "CenteredDataForPCA"."Feature_11" * -0.7881961990488242 + "CenteredDataForPCA"."Feature_12" * -0.08816803390787215 AS caress_7, "CenteredDataForPCA"."Feature_0" * 0.7183704626031118 + "CenteredDataForPCA"."Feature_1" * -0.3292354259053473 + "CenteredDataForPCA"."Feature_2" * -0.3330831683510891 + "CenteredDataForPCA"."Feature_3" * 0.09449116036811656 + "CenteredDataForPCA"."Feature_4" * -0.2281057312624052 + "CenteredDataForPCA"."Feature_5" * 0.04042496999100387 + "CenteredDataForPCA"."Feature_6" * 0.07816711452450523 + "CenteredDataForPCA"."Feature_7" * -0.0893698268866878 + "CenteredDataForPCA"."Feature_8" * -0.17830386327335054 + "CenteredDataForPCA"."Feature_9" * -0.3535925325865837 + "CenteredDataForPCA"."Feature_10" * 0.02764083821465466 + "CenteredDataForPCA"."Feature_11" * -0.15818810334760786 + "CenteredDataForPCA"."Feature_12" * 0.07282877892915167 AS caress_8, "CenteredDataForPCA"."Feature_0" * -0.15033900450904195 + "CenteredDataForPCA"."Feature_1" * 0.3711471048148375 + "CenteredDataForPCA"."Feature_2" * -0.20376591832223506 + "CenteredDataForPCA"."Feature_3" * 0.04320997027539855 + "CenteredDataForPCA"."Feature_4" * -0.12120893370211683 + "CenteredDataForPCA"."Feature_5" * 0.2879609116229261 + "CenteredDataForPCA"."Feature_6" * 0.6191690863332303 + "CenteredDataForPCA"."Feature_7" * 0.14239381934024448 + "CenteredDataForPCA"."Feature_8" * -0.061399061672456186 + "CenteredDataForPCA"."Feature_9" * -0.08778739258751968 + "CenteredDataForPCA"."Feature_10" * 0.3213915850058762 + "CenteredDataForPCA"."Feature_11" * -0.009448514615624085 + "CenteredDataForPCA"."Feature_12" * 0.42443210694803135 AS caress_9, "CenteredDataForPCA"."Feature_0" * 0.22983591020745625 + "CenteredDataForPCA"."Feature_1" * 0.378270969681239 + "CenteredDataForPCA"."Feature_2" * 0.6395155208268178 + "CenteredDataForPCA"."Feature_3" * 0.00398451676517715 + "CenteredDataForPCA"."Feature_4" * -0.002746209686233014 + "CenteredDataForPCA"."Feature_5" * 0.06758065516186769 + "CenteredDataForPCA"."Feature_6" * -0.05221742020198725 + "CenteredDataForPCA"."Feature_7" * -0.15208471502695142 + "CenteredDataForPCA"."Feature_8" * -0.4761905795695734 + "CenteredDataForPCA"."Feature_9" * -0.1920482989419129 + "CenteredDataForPCA"."Feature_10" * 0.2593091004976377 + "CenteredDataForPCA"."Feature_11" * -0.0727626894223145 + "CenteredDataForPCA"."Feature_12" * -0.16877146742266055 AS caress_10, "CenteredDataForPCA"."Feature_0" * -0.020019368114816968 + "CenteredDataForPCA"."Feature_1" * -0.2741196617822449 + "CenteredDataForPCA"."Feature_2" * 0.37595103157836735 + "CenteredDataForPCA"."Feature_3" * 0.01078909805661186 + "CenteredDataForPCA"."Feature_4" * -0.247394981341338 + "CenteredDataForPCA"."Feature_5" * 0.4337662784429465 + "CenteredDataForPCA"."Feature_6" * -0.3279945378430991 + "CenteredDataForPCA"."Feature_7" * 0.1970025109158796 + "CenteredDataForPCA"."Feature_8" * -0.01000234249528807 + "CenteredDataForPCA"."Feature_9" * 0.02032929600603173 + "CenteredDataForPCA"."Feature_10" * -0.1672306078040258 + "CenteredDataForPCA"."Feature_11" * 0.09737252568656972 + "CenteredDataForPCA"."Feature_12" * 0.5910104684328228 AS caress_11, "CenteredDataForPCA"."Feature_0" * -0.11936234877245785 + "CenteredDataForPCA"."Feature_1" * 0.25907047966301533 + "CenteredDataForPCA"."Feature_2" * -0.2822397432439493 + "CenteredDataForPCA"."Feature_3" * 0.014122785942177881 + "CenteredDataForPCA"."Feature_4" * -0.03763467346905133 + "CenteredDataForPCA"."Feature_5" * 0.05591067245740722 + "CenteredDataForPCA"."Feature_6" * -0.4221058644486063 + "CenteredDataForPCA"."Feature_7" * -0.735597203744979 + "CenteredDataForPCA"."Feature_8" * 0.05792554259587926 + "CenteredDataForPCA"."Feature_9" * -0.06113750009421669 + "CenteredDataForPCA"."Feature_10" * 0.1504934938358735 + "CenteredDataForPCA"."Feature_11" * 0.028450148055247586 + "CenteredDataForPCA"."Feature_12" * 0.2905280478685803 AS caress_12, "CenteredDataForPCA"."Feature_0" * -0.071102478853876 + "CenteredDataForPCA"."Feature_1" * 0.027694505144112855 + "CenteredDataForPCA"."Feature_2" * 0.1723614510041722 + "CenteredDataForPCA"."Feature_3" * -0.005368267155293576 + "CenteredDataForPCA"."Feature_4" * -0.7974597825356315 + "CenteredDataForPCA"."Feature_5" * -0.18031745533951077 + "CenteredDataForPCA"."Feature_6" * 0.27056362783623517 + "CenteredDataForPCA"."Feature_7" * -0.28724156243374865 + "CenteredDataForPCA"."Feature_8" * 0.08349847361563019 + "CenteredDataForPCA"."Feature_9" * 0.23024422338398925 + "CenteredDataForPCA"."Feature_10" * -0.2493386582256261 + "CenteredDataForPCA"."Feature_11" * -0.05561511798834909 + "CenteredDataForPCA"."Feature_12" * -0.12257274211468562 AS caress_13, "CenteredDataForPCA"."Feature_0" * 0.04342255336892238 + "CenteredDataForPCA"."Feature_1" * -0.08756232596868851 + "CenteredDataForPCA"."Feature_2" * -0.2392282902252778 + "CenteredDataForPCA"."Feature_3" * 0.03538080324401055 + "CenteredDataForPCA"."Feature_4" * 0.0421865705111826 + "CenteredDataForPCA"."Feature_5" * 0.05971297600709905 + "CenteredDataForPCA"."Feature_6" * -0.04048193343752012 + "CenteredDataForPCA"."Feature_7" * -0.008294939067259166 + "CenteredDataForPCA"."Feature_8" * -0.6404299316346868 + "CenteredDataForPCA"."Feature_9" * 0.7156789400852169 + "CenteredDataForPCA"."Feature_10" * 0.028042536302364328 + "CenteredDataForPCA"."Feature_11" * -0.01078892145740025 + "CenteredDataForPCA"."Feature_12" * 0.0407771796461392 AS caress_14 
FROM "CenteredDataForPCA"), 
linear_input AS 
(SELECT "ADS_car_1_OUT"."KEY" AS "KEY", CAST("ADS_car_1_OUT".caress_2 AS DOUBLE) AS caress_2, CAST("ADS_car_1_OUT".caress_3 AS DOUBLE) AS caress_3, CAST("ADS_car_1_OUT".caress_4 AS DOUBLE) AS caress_4, CAST("ADS_car_1_OUT".caress_5 AS DOUBLE) AS caress_5, CAST("ADS_car_1_OUT".caress_6 AS DOUBLE) AS caress_6, CAST("ADS_car_1_OUT".caress_7 AS DOUBLE) AS caress_7, CAST("ADS_car_1_OUT".caress_8 AS DOUBLE) AS caress_8, CAST("ADS_car_1_OUT".caress_9 AS DOUBLE) AS caress_9, CAST("ADS_car_1_OUT".caress_10 AS DOUBLE) AS caress_10, CAST("ADS_car_1_OUT".caress_11 AS DOUBLE) AS caress_11, CAST("ADS_car_1_OUT".caress_12 AS DOUBLE) AS caress_12, CAST("ADS_car_1_OUT".caress_13 AS DOUBLE) AS caress_13, CAST("ADS_car_1_OUT".caress_14 AS DOUBLE) AS caress_14 
FROM "ADS_car_1_OUT"), 
linear_model_cte AS 
(SELECT linear_input."KEY" AS "KEY", -2.222938031659684 * linear_input.caress_2 + 1.5452266537716155 * linear_input.caress_3 + 3.761166432688865 * linear_input.caress_4 + 2.125490153100168 * linear_input.caress_5 + 0.0 * linear_input.caress_6 + -0.4374838356994629 * linear_input.caress_7 + -0.06353639364744297 * linear_input.caress_8 + -0.875085670096529 * linear_input.caress_9 + 0.0 * linear_input.caress_10 + 0.0 * linear_input.caress_11 + 1.763931032101281 * linear_input.caress_12 + 1.8792065912996168 * linear_input.caress_13 + -2.6706225730822384 * linear_input.caress_14 + 22.578960396039587 AS "Estimator" 
FROM linear_input)
 SELECT linear_model_cte."KEY" AS "KEY", linear_model_cte."Estimator" AS "Estimator" 
FROM linear_model_cte