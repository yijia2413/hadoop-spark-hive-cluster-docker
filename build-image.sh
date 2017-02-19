#!/bin/bash

set -ex

# set your hadoop/spark/hive versions here
hadoop_tar='https://archive.apache.org/dist/hadoop/core/hadoop-2.6.4/hadoop-2.6.4.tar.gz'
spark_tar='https://www.apache.org/dist/spark/spark-1.6.2/spark-1.6.2-bin-hadoop2.6.tgz'
hive_tar='https://www.apache.org/dist/hive/hive-1.2.1/apache-hive-1.2.1-bin.tar.gz'

# download hadoop, spark, hive and so on
cd hadoop-base/files
wget $hadoop_tar
tar zxvf $(basename $hadoop_tar)
rm -f $(basename $hadoop_tar)

wget $spark_tar
tar zxvf $(basename $spark_tar)
rm -f $(basename $spark_tar)

wget $hive_tar
tar zxvf $(basename $hive_tar)
rm -f $(basename $hive_tar)

cd ../../

docker build -t serf-dnsmasq:1.0 serf-dnsmasq/
docker build -t hive-mysql:1.0 hive-mysql/
docker build -t hadoop-base:1.0 hadoop-base/
docker build -t hadoop-master:1.0 hadoop-master/
docker build -t hadoop-slave:1.0 hadoop-slave/
