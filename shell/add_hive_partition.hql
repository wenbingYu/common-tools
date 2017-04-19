--function 增加分区的脚本程序
--author wenbing.yu
--每天定时执行，目前需要分区是bic，account，click_cvt

use optimus;
set mapreduce.job.queuename=important;

ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=00) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=00/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=01) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=01/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=02) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=02/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=03) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=03/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=04) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=04/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=05) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=05/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=06) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=06/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=07) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=07/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=08) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=08/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=09) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=09/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=10) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=10/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=11) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=11/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=12) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=12/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=13) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=13/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=14) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=14/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=15) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=15/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=16) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=16/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=17) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=17/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=18) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=18/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=19) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=19/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=20) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=20/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=21) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=21/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=22) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=22/";
ALTER TABLE rpt_effect_day_test ADD PARTITION (pday=${hiveconf:pday},phour=23) location "year=${hiveconf:current_year}/month=${hiveconf:current_month}/day=${hiveconf:current_day}/hour=23/";

