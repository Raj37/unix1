#!/bin/bash
#PATH="/home/cloudera/Desktop/unix"
now="$(date)"
printf "Current date and time %s\n" "$now"
 
now="$(date +'%d/%m/%Y')"
printf "Current date in dd/mm/yyyy format %s\n" "$now"
 
echo "Starting backup at $now, please wait..."
# command to backup scripts goes here
# ...

exec >> /home/cloudera/Desktop/kafka/DR/scripts/script.log.$(date +%d) 2>&1

MY_MESSAGE="#######~~~~~~~Welcome to Stanford NLP Sentiment Analysis Program Wizard~~~~~~~######"
echo $MY_MESSAGE

#running sqoop script for import data from mysql server to hdfs

echo "Hive job for source table creation and data loading..."

#set JAVA_OPTS="-Xms2048M -Xmx4096M" 
#java -cp /home/cloudera/Desktop/kafka/DR/project2.jar -Xmx4096M -XX:+UseParallelGC CsvFileReaderExample input1 output1
#(exec /home/cloudera/Desktop/kafka/DR/scripts/hive.hql) > /home/cloudera/Desktop/kafka/DR/scripts/hive_job.log 2>&1

#variables used in stanford core nlp sentiment analysis.
db_name="sentiment"
table_name1="source_tbl1"
table_name2="m_tmp1"
table_name3="m_tbl1"
table_name4="n_tmp1"
table_name5="n_tbl1"
table_name6="w_tmp1"
table_name7="w_tbl1"
table_name8="au_tmp1"
table_name9="au_tbl1"
table_name10="final_tbl1"
comment_path="/home/cloudera/Desktop/kafka/DR/comment"
script_path="/home/cloudera/Desktop/kafka/DR/scripts"
dr_path="/home/cloudera/Desktop/kafka/DR"
final_path="/home/cloudera/Desktop/kafka/DR/output"
input1="input1"
output1="output1"
input2="input2"
output2="output2"
input3="input3"
output3="output3"
input4="input4"
output4="output4"
final="final"

echo "connecting to database - " $db_name
echo  "using table - " $table_name1" and "$table_name2
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME1=$table_name1 -hiveconf TABLE_NAME2=$table_name2 -f ${script_path}/hive1.hql
RF1=$?
echo $RF1
if [ $RF1 -eq 0 ]; then
	echo "hive script1 ran successfully..."
else
	echo "hive script1 failed with error message..."
	exit
fi

echo "Copying m column data from hdfs to local..."

hadoop fs -copyToLocal hdfs://quickstart.cloudera:8020/user/hive/warehouse/${db_name}.db/${table_name2}/000000_0 ${comment_path}
RF2=$?
echo $RF2
if [ $RF2 -eq 0 ]; then
	echo "m column data copied successfully to local..."
else
	echo "m column data copying failed..."
	exit
fi
mv ${dr_path}/comment/000000_0 ${dr_path}/comment/${input1}
RF3=$?
echo $RF3
if [ $RF3 -eq 0 ]; then
	echo "Renaming of m column local copy to input1 successfully done..."
else
	echo "Renaming of m column local copy failed..."
	exit
fi
echo "This script is about to run java code for sentiment generation for m column..."

#set JAVA_OPTS="-Xms2048M -Xmx4096M" 
#(exec /home/cloudera/Desktop/unix/sqoop.sh) > /home/cloudera/Desktop/unix/sqoop_job.log 2>&1
java -cp ${dr_path}/project2.jar -Xmx4096M -XX:+UseParallelGC CsvFileReaderExample ${input1} ${output1}
RF4=$?
echo $RF4
if [ $RF4 -eq 0 ]; then
	echo "Java code for m column sentiment generation ran successfully..."
else
	echo "Encountered error while m column sentiment generation.."
	exit
fi

echo "connecting to database - " $db_name
echo  "using table - " $table_name3" and "$table_name4
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME3=$table_name3 -hiveconf TABLE_NAME4=$table_name4 -hiveconf TABLE_NAME1=$table_name1 -f ${script_path}/hive2.hql
RF5=$?
echo $RF5
if [ $RF5 -eq 0 ]; then
	echo "hive script2 ran successfully..."
else
	echo "hive script2 failed with error message..."
	exit
fi

echo "Copying n column data from hdfs to local..."

hadoop fs -copyToLocal hdfs://quickstart.cloudera:8020/user/hive/warehouse/${db_name}.db/${table_name4}/000000_0 ${comment_path}
RF6=$?
echo $RF6
if [ $RF6 -eq 0 ]; then
	echo "n column data copied successfully to local..."
else
	echo "n column data copying failed..."
	exit
fi
mv ${dr_path}/comment/000000_0 ${dr_path}/comment/${input2}
RF7=$?
echo $RF7
if [ $RF7 -eq 0 ]; then
	echo "Renaming of n column local copy to input2 successfully done..."
else
	echo "Renaming of n column local copy failed..."
	exit
fi

echo "This script is about to run java code for sentiment generation for n column..."

#set JAVA_OPTS="-Xms2048M -Xmx4096M" 
#(exec /home/cloudera/Desktop/unix/sqoop.sh) > /home/cloudera/Desktop/unix/sqoop_job.log 2>&1
java -cp ${dr_path}/project2.jar -Xmx4096M -XX:+UseParallelGC CsvFileReaderExample ${input2} ${output2}
RF8=$?
echo $RF8
if [ $RF8 -eq 0 ]; then
	echo "Java code for n column sentiment generation ran successfully..."
else
	echo "Encountered error while n column sentiment generation.."
	exit
fi

echo "connecting to database - " $db_name
echo  "using table - " $table_name5" and "$table_name6
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME5=$table_name5 -hiveconf TABLE_NAME6=$table_name6 -hiveconf TABLE_NAME1=$table_name1 -f ${script_path}/hive3.hql
RF9=$?
echo $RF9
if [ $RF9 -eq 0 ]; then
	echo "hive script3 ran successfully..."
else
	echo "hive script3 failed with error message..."
	exit
fi

echo "Copying w column data from hdfs to local..."

hadoop fs -copyToLocal hdfs://quickstart.cloudera:8020/user/hive/warehouse/${db_name}.db/${table_name6}/000000_0 ${comment_path}
RF10=$?
echo $RF10
if [ $RF10 -eq 0 ]; then
	echo "w column data copied successfully to local..."
else
	echo "w column data copying failed..."
	exit
fi
mv ${dr_path}/comment/000000_0 ${dr_path}/comment/${input3}
RF11=$?
echo $RF11
if [ $RF11 -eq 0 ]; then
	echo "Renaming of w column local copy to input3 successfully done..."
else
	echo "Renaming of w column local copy failed..."
	exit
fi


echo "This script is about to run java code for sentiment generation for w column..."

#set JAVA_OPTS="-Xms2048M -Xmx4096M" 
#(exec /home/cloudera/Desktop/unix/sqoop.sh) > /home/cloudera/Desktop/unix/sqoop_job.log 2>&1
java -cp ${dr_path}/project2.jar -Xmx4096M -XX:+UseParallelGC CsvFileReaderExample ${input3} ${output3}
RF12=$?
echo $RF12
if [ $RF12 -eq 0 ]; then
	echo "Java code for w column sentiment generation ran successfully..."
else
	echo "Encountered error while w column sentiment generation.."
	exit
fi


echo "connecting to database - " $db_name
echo  "using table - " $table_name7" and "$table_name8
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME7=$table_name7 -hiveconf TABLE_NAME8=$table_name8 -hiveconf TABLE_NAME1=$table_name1 -f ${script_path}/hive4.hql
RF13=$?
echo $RF13
if [ $RF13 -eq 0 ]; then
	echo "hive script4 ran successfully..."
else
	echo "hive script4 failed with error message..."
	exit
fi


echo "Copying au column data from hdfs to local..."

hadoop fs -copyToLocal hdfs://quickstart.cloudera:8020/user/hive/warehouse/${db_name}.db/${table_name8}/000000_0 ${comment_path}
RF14=$?
echo $RF14
if [ $RF14 -eq 0 ]; then
	echo "au column data copied successfully to local..."
else
	echo "au column data copying failed..."
	exit
fi
mv ${dr_path}/comment/000000_0 ${dr_path}/comment/${input4}
RF15=$?
echo $RF15
if [ $RF15 -eq 0 ]; then
	echo "Renaming of au column local copy to input4 successfully done..."
else
	echo "Renaming of au column local copy failed..."
	exit
fi

echo "This script is about to run java code for sentiment generation for au column..."

#set JAVA_OPTS="-Xms2048M -Xmx4096M" 
#(exec /home/cloudera/Desktop/unix/sqoop.sh) > /home/cloudera/Desktop/unix/sqoop_job.log 2>&1
java -cp ${dr_path}/project2.jar -Xmx4096M -XX:+UseParallelGC CsvFileReaderExample ${input4} ${output4}
RF16=$?
echo $RF16
if [ $RF16 -eq 0 ]; then
	echo "Java code for au column sentiment generation ran successfully..."
else
	echo "Encountered error while au column sentiment generation.."
	exit
fi


echo "connecting to database - " $db_name
echo  "using table - " $table_name1", "$table_name3", "$table_name5", "$table_name7", "$table_name9" and "$table_name10
hive -hiveconf DB_NAME=$db_name -hiveconf TABLE_NAME1=$table_name1 -hiveconf TABLE_NAME3=$table_name3 -hiveconf TABLE_NAME5=$table_name5 -hiveconf TABLE_NAME7=$table_name7 -hiveconf TABLE_NAME9=$table_name9 -hiveconf TABLE_NAME10=$table_name10 -f ${script_path}/join.hql
RF17=$?
echo $RF17
if [ $RF17 -eq 0 ]; then
	echo "join script ran successfully..."
else
	echo "join script failed with error message..."
	exit
fi

echo "Copying all columns from hdfs to local..."

hadoop fs -copyToLocal hdfs://quickstart.cloudera:8020/user/hive/warehouse/${db_name}.db/${table_name10}/000000_0 ${final_path}
RF18=$?
echo $RF18
if [ $RF18 -eq 0 ]; then
	echo "all columns copied successfully to local..."
else
	echo "all columns data copying failed..."
	exit
fi
mv ${dr_path}/output/000000_0 ${dr_path}/output/${final}
RF19=$?
echo $RF19
if [ $RF19 -eq 0 ]; then
	echo "Renaming of all columns local copy to final successfully done..."
else
	echo "Renaming of all columns local copy failed..."
	exit
fi

echo "Sentiment creation task completed successfully..!!"
echo "########~~~~~~~~~Thank you for your patience~~~~~~~~~~###########"












