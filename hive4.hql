show schemas;
use ${hiveconf:DB_NAME};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME7}; 
CREATE TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME7} (id int,w_col string,w_sentiment string)row format delimited fields terminated by '|' lines terminated by '\n';
show tables;
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/kafka/DR/comment/output3' OVERWRITE INTO TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME7};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME8}; 
create table ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME8} (au_col string)row format delimited lines terminated by '\n';
insert into ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME8} select au from ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME1};

