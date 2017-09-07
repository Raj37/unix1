show schemas;
use ${hiveconf:DB_NAME};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME9}; 
CREATE TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME9} (id int,au_col string,au_sentiment string)row format delimited fields terminated by '|' lines terminated by '\n';
show tables;
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/kafka/DR/comment/output4' OVERWRITE INTO TABLE ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME9};
DROP TABLE IF EXISTS ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME10}; 
create table ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME10} (id int,A string,B string,C string,D string,E string,F string,G string,H string,I string,J string,K string,L string,M string,M_SENTIMENT string,N string,N_SENTIMENT string,O string,P string,Q string,R string,S string,T string,U string,V string,W string,W_SENTIMENT string,X string,Y string,Z string,AA string,AB string,AC string,AD string,AE string,AF string,AG string,AH string,AI string,AJ string,AK string,AL string,AM string,AN string,AO string,AP string,AQ string,AR string,AS string,AT string,AU string,AU_SENTIMENT string,AV string,AW string,AX string,AY string,AZ string,BA string,BB string,BC string,BD string,BE string,BF string,BG string,BH string,BI string,BJ string,BK string,BL string,BM string,BN string,BO string,BP string,BQ string,BR string,BS string,BT string,BU string,BV string,BW string,BX string,BY string,BZ string,CA string,CB string,CC string,CD string,CE string,CF string,CG string)row format delimited fields terminated by '|' lines terminated by '\n';
insert into ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME10} select a1.id,a1.A,a1.B,a1.C,a1.D,a1.E,a1.F,a1.G,a1.H,a1.I,a1.J,a1.K,a1.L,a1.M,b1.M_SENTIMENT,a1.N,c1.N_SENTIMENT,a1.O,a1.P,a1.Q,a1.R,a1.S,a1.T,a1.U,a1.V,a1.W,d1.W_SENTIMENT,a1.X,a1.Y,a1.Z,
a1.AA,a1.AB,a1.AC,a1.AD,a1.AE,a1.AF,a1.AG,a1.AH,a1.AI,a1.AJ,a1.AK,a1.AL,a1.AM,a1.AN,a1.AO,a1.AP,a1.AQ,a1.AR,a1.AS,a1.AT,a1.AU,e1.AU_SENTIMENT,a1.AV,a1.AW,a1.AX,a1.AY,a1.AZ,
a1.BA,a1.BB,a1.BC,a1.BD,a1.BE,a1.BF,a1.BG,a1.BH,a1.BI,a1.BJ,a1.BK,a1.BL,a1.BM,a1.BN,a1.BO,a1.BP,a1.BQ,a1.BR,a1.BS,a1.BT,a1.BU,a1.BV,a1.BW,a1.BX,a1.BY,a1.BZ,
a1.CA,a1.CB,a1.CC,a1.CD,a1.CE,a1.CF,a1.CG from ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME1} as a1 left outer join ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME3} as b1 on (a1.id=b1.id) left outer join ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME5} as c1 on (a1.id=c1.id) left outer join ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME7} as d1 on (a1.id=d1.id) left outer join ${hiveconf:DB_NAME}.${hiveconf:TABLE_NAME9} as e1 on (a1.id=e1.id);


