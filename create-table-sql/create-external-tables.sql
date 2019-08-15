CREATE DATABASE IF NOT EXISTS ${env:TPCH_DBNAME};

use ${env:TPCH_DBNAME};

create external table IF NOT EXISTS et_supplier(
S_SUPPKEY int,
S_NAME string,
S_ADDRESS string,
S_NATIONKEY int,
S_PHONE string,
S_ACCTBAL decimal,
S_COMMENT string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/supplier'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_partsupp(
PS_PARTKEY   int,
PS_SUPPKEY   int,
PS_AVAILQTY  int,
PS_SUPPLYCOST  decimal,
PS_COMMENT  string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/partsupp'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_customer(                                                          
C_CUSTKEY   int,
C_NAME      string,
C_ADDRESS   string,
C_NATIONKEY int,
C_PHONE     string,
C_ACCTBAL   decimal,
C_MKTSEGMENT string,
C_COMMENT   string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/customer'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_orders(                                                          
O_ORDERKEY int,
O_CUSTKEY  int,
O_ORDERSTATUS string,
O_TOTALPRICE decimal,
O_ORDERDATE  date,
O_ORDERPRIORITY string,
O_CLERK         string,
O_SHIPPRIORITY  int,
O_COMMENT       string                                                                 
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/orders'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_lineitem(                                                          
L_ORDERKEY int,
L_PARTKEY  int,
L_SUPPKEY  int,
L_LINENUMBER int,
L_QUANTITY decimal,
L_EXTENDEDPRICE decimal,
L_DISCOUNT decimal,
L_TAX      decimal,
L_RETURNFLAG string,
L_LINESTATUS string,
L_SHIPDATE   date,
L_COMMITDATE date,
L_RECEIPTDATE date,
L_SHIPINSTRUCT string,
L_SHIPMODE string,
L_COMMENT  string                                        
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/lineitem'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_nation (                                                          
N_NATIONKEY int,
N_NAME string,
N_REGIONKEY int,
N_COMMENT  string                                                             
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/nation'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_part(
P_PARTKEY     int,
P_NAME        string,
P_MFGR        string,
P_BRAND       string,
P_TYPE        string,
P_SIZE        int,
P_CONTAINER   string,
P_RETAILPRICE decimal,
P_COMMENT     string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/part'
tblproperties ('serialization.null.format'='')
;

create external table IF NOT EXISTS et_region(
R_REGIONKEY int,
R_NAME string,
R_COMMENT string
)ROW FORMAT DELIMITED FIELDS TERMINATED BY '|' LINES TERMINATED BY '\n'
location '${env:HDFS_DATA_PATH}/region'
tblproperties ('serialization.null.format'='')
;

show tables;
