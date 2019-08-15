# 执行步骤：

## 1. 设置环境变量
```shell
vi tpch-env.sh
```
- 数据量
- 环境变量


## 2. 生成测试数据

```shell
cd dbgen
make clean
make
cd ../..
./gen-data.sh
```

## 3. 创建hdfs数据目录

```shell
./hdfs-mkdirs.sh
```

## 4. 上传数据到hdfs

```shell
./upload-data.sh
```

## 5. 创建外部表
```shell
create-external-tables.sh
```

## 6. 创建对应的分区表、并对事实表进行格式化、压缩

```shell
create-parquet-partition-tables.sh
```

## 7. Spark Sql 方式执行测试
```shell
./spark-query-tpch.sh
```

## 8. Beeline方式执行测试
```shell
./spark-query-tpch-beeline.sh
```
注意需要先启动对应的thrift server

