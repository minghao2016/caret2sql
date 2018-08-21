-- This SQL code was generated by sklearn2sql (development version).
-- Copyright 2018

-- Model : CaretRegressor_svmRadial
-- Dataset : freidman2
-- Database : monetdb


-- This SQL code can contain one or more statements, to be executed in the order they appear in this file.



-- Model deployment code

WITH kernel_input_with_scaling AS 
(SELECT "ADS"."KEY" AS "KEY", (CAST("ADS"."Feature_0" AS DOUBLE) - 43.791281222074) / 26.1998878150635 AS "Feature_0", (CAST("ADS"."Feature_1" AS DOUBLE) - 945.96728330844) / 464.3666952541536 AS "Feature_1", (CAST("ADS"."Feature_2" AS DOUBLE) - 0.5310009099975209) / 0.2920171749459157 AS "Feature_2", (CAST("ADS"."Feature_3" AS DOUBLE) - 6.139967152050498) / 3.0923049253819994 AS "Feature_3" 
FROM freidman2 AS "ADS"), 
"SV_data" AS 
(SELECT "Values".sv_idx AS sv_idx, "Values".dual_coeff AS dual_coeff, "Values".sv_0 AS sv_0, "Values".sv_1 AS sv_1, "Values".sv_2 AS sv_2, "Values".sv_3 AS sv_3 
FROM (SELECT 0 AS sv_idx, -0.811408931445273 AS dual_coeff, 0.7107389141967823 AS sv_0, 0.18267237513772625 AS sv_1, 0.6226049798744541 AS sv_2, 1.379215021055077 AS sv_3 UNION ALL SELECT 1 AS sv_idx, -1.0 AS dual_coeff, -0.061452150015480836 AS sv_0, 0.3774517898163364 AS sv_1, 0.8031840175318877 AS sv_2, 0.30220624018005193 AS sv_3 UNION ALL SELECT 2 AS sv_idx, -0.5676639201538026 AS dual_coeff, -0.21152729584795463 AS sv_0, -1.7444439677525907 AS sv_1, 0.4004397884124831 AS sv_2, -1.280761716963789 AS sv_3 UNION ALL SELECT 3 AS sv_idx, 1.0 AS dual_coeff, 0.041766113433661996 AS sv_0, 1.4674056735783636 AS sv_1, 1.0087784473355752 AS sv_2, 1.268788761557724 AS sv_3 UNION ALL SELECT 4 AS sv_idx, 0.3978107241938035 AS dual_coeff, -0.040434821565860604 AS sv_0, 0.33316647170492614 AS sv_1, 1.516378433743919 AS sv_2, -1.0779792006390798 AS sv_3 UNION ALL SELECT 5 AS sv_idx, 0.8601072225468478 AS dual_coeff, -1.3271083980674663 AS sv_0, -0.9681552144848872 AS sv_1, -0.36931753289215297 AS sv_2, 0.7762082793822555 AS sv_3 UNION ALL SELECT 6 AS sv_idx, -0.689312085784023 AS dual_coeff, 2.1441062194703595 AS sv_0, -1.5860201052988996 AS sv_1, 0.887640633884356 AS sv_2, -1.4027307340509194 AS sv_3 UNION ALL SELECT 7 AS sv_idx, -0.5697743788163294 AS dual_coeff, 0.7297966940855642 AS sv_0, -1.0546257130717192 AS sv_1, -1.6324213800380485 AS sv_2, 1.2758491111612755 AS sv_3 UNION ALL SELECT 8 AS sv_idx, -1.0 AS dual_coeff, -1.1235642146527816 AS sv_0, 1.6831962197372268 AS sv_1, -1.7985020645272316 AS sv_2, -0.8477663172082077 AS sv_3 UNION ALL SELECT 9 AS sv_idx, 0.4891948582845186 AS dual_coeff, -1.4593802161589065 AS sv_0, 0.7018378149519552 AS sv_1, -0.9101131840730574 AS sv_2, -1.2754210367439045 AS sv_3 UNION ALL SELECT 10 AS sv_idx, -0.15481206325239014 AS dual_coeff, -0.13407363073193884 AS sv_0, -1.2484766986547693 AS sv_1, 1.5947158390479141 AS sv_2, -1.4497212689408288 AS sv_3 UNION ALL SELECT 11 AS sv_idx, -0.2607542793905537 AS dual_coeff, 1.093352025970274 AS sv_0, 0.37879673097191136 AS sv_1, 1.4295314017838043 AS sv_2, 0.09299261931469872 AS sv_3 UNION ALL SELECT 12 AS sv_idx, 1.0 AS dual_coeff, -1.2956953232218467 AS sv_0, 1.4987717050067189 AS sv_1, 0.6045319069288794 AS sv_2, -0.049480778656289616 AS sv_3 UNION ALL SELECT 13 AS sv_idx, 1.0 AS dual_coeff, -0.3277555483076999 AS sv_0, 1.6444901489977306 AS sv_1, 0.02537289323251288 AS sv_2, -0.7554856825861698 AS sv_3 UNION ALL SELECT 14 AS sv_idx, -0.5016585019907664 AS dual_coeff, 2.010032312501274 AS sv_0, 0.09530861930129077 AS sv_1, -1.1913671710570364 AS sv_2, -1.618815287158773 AS sv_3 UNION ALL SELECT 15 AS sv_idx, -0.5195138687477998 AS dual_coeff, 0.9946938352219382 AS sv_0, 1.492696939628282 AS sv_1, -0.3469838908117189 AS sv_2, 0.4282157274143781 AS sv_3 UNION ALL SELECT 16 AS sv_idx, 1.0 AS dual_coeff, -0.1743166818336495 AS sv_0, 1.1501017450587885 AS sv_1, 1.5363842711868212 AS sv_2, 1.551694080146041 AS sv_3 UNION ALL SELECT 17 AS sv_idx, -0.02726238744885089 AS dual_coeff, 0.6125763327348124 AS sv_0, 0.5103116632620852 AS sv_1, 0.1889573095574378 AS sv_2, -1.1444547023849527 AS sv_3 UNION ALL SELECT 18 AS sv_idx, 0.7782496831330078 AS dual_coeff, 0.21406979439593113 AS sv_0, -1.5118055059174604 AS sv_1, -0.401528196386498 AS sv_2, -0.039017517211154665 AS sv_3 UNION ALL SELECT 19 AS sv_idx, -0.8041092592620878 AS dual_coeff, -1.0864384290982352 AS sv_0, -1.6483271949983813 AS sv_1, 0.6144078655656166 AS sv_2, 1.1229003779563531 AS sv_3 UNION ALL SELECT 20 AS sv_idx, -0.5586759506702698 AS dual_coeff, -1.2164497979438718 AS sv_0, 1.503310417535894 AS sv_1, -1.6659814454902533 AS sv_2, -1.3456333509575589 AS sv_3 UNION ALL SELECT 21 AS sv_idx, -1.0 AS dual_coeff, -0.6393876588754417 AS sv_0, 0.4552812872104025 AS sv_1, 0.0453310496742652 AS sv_2, -0.4257327196658084 AS sv_3 UNION ALL SELECT 22 AS sv_idx, 0.10477550206688538 AS dual_coeff, -0.008120044849170525 AS sv_0, 1.5461995199793308 AS sv_1, -0.39686978766106656 AS sv_2, -0.9878565201234888 AS sv_3 UNION ALL SELECT 23 AS sv_idx, 0.5510714756126958 AS dual_coeff, -0.0265344430722154 AS sv_0, -0.0283631248134526 AS sv_1, -0.739570601711903 AS sv_2, 0.16082809124136166 AS sv_3 UNION ALL SELECT 24 AS sv_idx, -0.3222463763645388 AS dual_coeff, -0.9894374348380393 AS sv_0, 1.1628195030168447 AS sv_1, -1.6348530109335948 AS sv_2, 0.06543940945798173 AS sv_3 UNION ALL SELECT 25 AS sv_idx, -0.33153872232555776 AS dual_coeff, -1.3445193007126655 AS sv_0, 0.476367891619324 AS sv_1, -1.0814171294453323 AS sv_2, 1.4174747937922738 AS sv_3 UNION ALL SELECT 26 AS sv_idx, -0.2994131760001981 AS dual_coeff, -0.08429331712502665 AS sv_0, -1.0999319759856232 AS sv_1, -1.4761017015390492 AS sv_2, -1.1829469095899825 AS sv_3 UNION ALL SELECT 27 AS sv_idx, -0.8770498283015642 AS dual_coeff, -1.6140966135148043 AS sv_0, -1.7643768278128538 AS sv_1, -0.6526951695405658 AS sv_2, 1.1878103980702412 AS sv_3 UNION ALL SELECT 28 AS sv_idx, -0.13993673063499204 AS dual_coeff, -1.0603027345726208 AS sv_0, -0.7477287119197085 AS sv_1, -1.6186493290430493 AS sv_2, 1.2695784995912052 AS sv_3 UNION ALL SELECT 29 AS sv_idx, 1.0 AS dual_coeff, 1.75577554800642 AS sv_0, 0.962684681824095 AS sv_1, 1.0869930076042431 AS sv_2, 1.0379200088920848 AS sv_3 UNION ALL SELECT 30 AS sv_idx, -0.5427042607033055 AS dual_coeff, 0.977145951082381 AS sv_0, -1.5055431734679958 AS sv_1, 1.3851794474085446 AS sv_2, -0.16142774484821756 AS sv_3 UNION ALL SELECT 31 AS sv_idx, 1.0 AS dual_coeff, 1.3069659327192833 AS sv_0, 0.18630106914955127 AS sv_1, 1.5113442172696083 AS sv_2, -1.5876587304789196 AS sv_3 UNION ALL SELECT 32 AS sv_idx, 0.602084102543969 AS dual_coeff, -1.6042453407535435 AS sv_0, -0.26487689620125343 AS sv_1, 1.3528981281701018 AS sv_2, 1.1669888744725379 AS sv_3 UNION ALL SELECT 33 AS sv_idx, -0.2025116118985912 AS dual_coeff, -0.917278251770317 AS sv_0, -1.4509035319107564 AS sv_1, -0.2786390833534205 AS sv_2, -1.3827993897154927 AS sv_3 UNION ALL SELECT 34 AS sv_idx, 1.0 AS dual_coeff, 1.3477086249535588 AS sv_0, 0.795308777919337 AS sv_1, 1.5593635512024997 AS sv_2, -0.07389069627856555 AS sv_3 UNION ALL SELECT 35 AS sv_idx, 0.3970527648091664 AS dual_coeff, -0.3774886879153139 AS sv_0, 0.09160188642436172 AS sv_1, 1.4845066754343574 AS sv_2, -1.076465022258961 AS sv_3) AS "Values"), 
kernel_dp AS 
(SELECT t."KEY" AS "KEY", t.dot_product AS dot_product 
FROM (SELECT full_join_data_sv."KEY" AS "KEY", sum(CAST(full_join_data_sv.dot_prod1 AS DOUBLE)) + -0.136889475443211 AS dot_product 
FROM (SELECT kernel_input_with_scaling."KEY" AS "KEY", "SV_data".dual_coeff * exp(CASE WHEN (100.0 <= CASE WHEN (-100.0 <= -0.166237820108079 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2))) THEN -0.166237820108079 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2)) ELSE -100.0 END) THEN 100.0 ELSE CASE WHEN (-100.0 <= -0.166237820108079 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2))) THEN -0.166237820108079 * (power(kernel_input_with_scaling."Feature_0" - "SV_data".sv_0, 2) + power(kernel_input_with_scaling."Feature_1" - "SV_data".sv_1, 2) + power(kernel_input_with_scaling."Feature_2" - "SV_data".sv_2, 2) + power(kernel_input_with_scaling."Feature_3" - "SV_data".sv_3, 2)) ELSE -100.0 END END) AS dot_prod1 
FROM kernel_input_with_scaling, "SV_data") AS full_join_data_sv GROUP BY full_join_data_sv."KEY") AS t)
 SELECT kernel_dp."KEY" AS "KEY", 499.0928844651739 + 374.0338110593958 * kernel_dp.dot_product AS "Estimator" 
FROM kernel_dp