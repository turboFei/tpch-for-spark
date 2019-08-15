#!/bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

source $bin/tpch-env.sh

#mkdir the root dir of HDFS
$HADOOP_HOME/bin/hadoop fs -test -e ${HDFS_DATA_PATH}
if [ $? -eq 0 ] ;then
    echo 'exist'
else
    $HADOOP_HOME/bin/hadoop fs -mkdir ${HDFS_DATA_PATH}
fi

#mkdir for each table
cat $tableNameList | while read table
do
$HADOOP_HOME/bin/hadoop fs -test -e ${HDFS_DATA_PATH}/$table

if [ $? -eq 0 ] ;then
    echo 'exist'
else
  echo "making HDFS directory ${HDFS_DATA_PATH}/${table}"
 $HADOOP_HOME/bin/hadoop fs -mkdir ${HDFS_DATA_PATH}/$table
fi
done


echo "HDFS directories:"
$HADOOP_HOME/bin/hadoop fs -ls ${HDFS_DATA_PATH}