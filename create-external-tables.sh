#!/bin/bash
bin="$(cd "$(dirname "$0")";pwd)"
source $bin/tpch-env.sh

$SPARK_HOME/bin/spark-sql $@ -f $bin/create-table-sql/create-external-tables.sql
