#!/bin/bash

bin="$(cd "$(dirname "$0")";pwd)"

# the table list file of tpch
export tableNameList=$bin/tableList

# the DBNAME for tpch
export TPCH_DBNAME=tpch

# the root dir of tpcs dbgen kit
export DBGEN_ROOT=$bin/dbgen

# SCALE 1 yield 1GB for the total tpch table
export TPCH_DBGEN_SCALE=1
export DATA_SLIDES_NUM=1

export SPARK_HOME=/apache/spark
export HADOOP_HOME=/apache/hadoop
export HADOOP_CONF_DIR=/apache/hadoop/etc/hadoop

export LOCAL_DATA_PATH=$bin/tpch_data_$TPCH_DBGEN_SCALE
export HDFS_DATA_PATH=hdfs://user/hive/tpch_data

export QUERY_SQL_DIR=$bin/query_sql
export QUERY_RESULT_DIR=$bin/query_result_$TPCH_DBGEN_SCALE