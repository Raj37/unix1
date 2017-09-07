show schemas;
use ${hiveconf:DB_NAME};
CREATE TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME} (id int,A int,B string,C string,D string,E string,F string,G string,H string,I string,J string,K string,L string,M string,N string,O string,P string,Q string,R string,S string,T string,U string,V string,W string,X string,Y string,Z string,AA string,AB string,AC string,AD string,AE string,AF string,AG string,AH string,AI string,AJ string,AK string,AL string,AM string,AN string,AO string,AP string,AQ string,AR string,AS string,AT string,AU string,AV string,AW string,AX string,AY string,AZ string,BA string,BB string,BC string,BD string,BE string,BF string,BG string,BH string,BI string,BJ string,BK string,BL string,BM string,BN string,BO string,BP string,BQ string,BR string,BS string,BT string,BU string,BV string,BW string,BX string,BY string,BZ string,CA string,CB string,CC string,CD string,CE string,CF string,CG string)row format delimited fields terminated by '|' lines terminated by '\n';
show tables;
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/kafka/DR/source' OVERWRITE INTO TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME};
select * from ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME};
