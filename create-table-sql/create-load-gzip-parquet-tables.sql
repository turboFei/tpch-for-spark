use ${env:TPCH_DBNAME};

set spark.sql.parquet.compression.codec=gzip;

drop table if exists supplier;
create table IF NOT EXISTS supplier(
S_SUPPKEY int,
S_NAME string,
S_ADDRESS string,
S_NATIONKEY int,
S_PHONE string,
S_ACCTBAL decimal,
S_COMMENT string
)
stored as parquet;
insert overwrite table supplier select * from et_supplier;


drop table if exists partsupp;
create table IF NOT EXISTS partsupp(
PS_PARTKEY   int,
PS_SUPPKEY   int,
PS_AVAILQTY  int,
PS_SUPPLYCOST  decimal,
PS_COMMENT  string
)
stored as parquet;
insert overwrite table partsupp select * from et_partsupp;

drop table if exists customer;
create table IF NOT EXISTS customer(                                                          
C_CUSTKEY   int,
C_NAME      string,
C_ADDRESS   string,
C_NATIONKEY int,
C_PHONE     string,
C_ACCTBAL   decimal,
C_MKTSEGMENT string,
C_COMMENT   string)
stored as parquet;
insert overwrite table customer select * from et_customer;

drop table if exists orders;
create table IF NOT EXISTS orders(                                                          
O_ORDERKEY int,
O_CUSTKEY  int,
O_ORDERSTATUS string,
O_TOTALPRICE decimal,
O_ORDERDATE  date,
O_ORDERPRIORITY string,
O_CLERK         string,
O_SHIPPRIORITY  int,
O_COMMENT       string                                                                 
)
stored as parquet;
insert overwrite table orders select * from et_orders;

drop table if exists lineitem;
create table IF NOT EXISTS lineitem(                                                          
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
)
stored as parquet;
insert overwrite table lineitem select * from et_lineitem;

drop table if exists nation;
create table IF NOT EXISTS nation (                                                          
N_NATIONKEY int,
N_NAME string,
N_REGIONKEY int,
N_COMMENT  string                                                             
)
stored as parquet;
insert overwrite table nation select * from et_nation;

drop table if exists part;
create table IF NOT EXISTS part(
P_PARTKEY     int,
P_NAME        string,
P_MFGR        string,
P_BRAND       string,
P_TYPE        string,
P_SIZE        int,
P_CONTAINER   string,
P_RETAILPRICE decimal,
P_COMMENT     string
)
stored as parquet;
insert overwrite table part select * from et_part;

drop table if exists region;
create table IF NOT EXISTS region(
R_REGIONKEY int,
R_NAME string,
R_COMMENT string
)
stored as parquet;
insert overwrite table region select * from et_region;

show tables;