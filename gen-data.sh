#!/bin/bash
bin=`dirname $0`
bin=`cd $bin;pwd`

source $bin/tpch-env.sh

echo $LOCAL_DATA_PATH

if [ ! -d "$LOCAL_DATA_PATH" ];then
   mkdir $LOCAL_DATA_PATH
fi
# clear the existed data
\rm -rf $LOCAL_DATA_PATH/*

cd $DBGEN_ROOT
./dbgen -s $TPCH_DBGEN_SCALE -C $DATA_SLIDES_NUM -vf 

cat $tableNameList | while read tblName
do
	mkdir -p $LOCAL_DATA_PATH/$tblName
	mv $tblName.tbl* $LOCAL_DATA_PATH/$tblName/
done