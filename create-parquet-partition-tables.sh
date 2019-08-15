#!/bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

source $bin/tpch-env.sh

$SPARK_HOME/bin/spark-sql $@ -f $bin/create-table-sql/create-load-gzip-parquet-tables.sql
