#!/bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

source $bin/tpch-env.sh

for fileName in `ls ${LOCAL_DATA_PATH}`
do
 tmp=${fileName%_*}
 echo $tmp
 tableName=${tmp%_*}
 echo $tableName

 #file update to hdfs
  $HADOOP_HOME/bin/hadoop fs -put -f $LOCAL_DATA_PATH/$fileName/*  ${HDFS_DATA_PATH}/$tableName/
done
