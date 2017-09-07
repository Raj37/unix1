show schemas;
use ${hiveconf:DB_NAME};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME3};
CREATE TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME3} (id int,m_col string,m_sentiment string)row format delimited fields terminated by '|' lines terminated by '\n';
show tables;
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/kafka/DR/comment/output1' OVERWRITE INTO TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME3};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME4};
create table ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME4} (n_col string)row format delimited lines terminated by '\n';
insert into ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME4} select n from ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME1};


