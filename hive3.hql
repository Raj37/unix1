show schemas;
use ${hiveconf:DB_NAME};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME5};
CREATE TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME5} (id int,n_col string,n_sentiment string)row format delimited fields terminated by '|' lines terminated by '\n';
show tables;
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/kafka/DR/comment/output2' OVERWRITE INTO TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME5};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME6};
create table ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME6} (w_col string)row format delimited lines terminated by '\n';
insert into ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME6} select w from ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME1};


