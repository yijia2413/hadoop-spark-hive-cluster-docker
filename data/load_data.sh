#!/bin/bash

set -ex

hive -e "create database if not exists test"
hive -e "create table IF NOT EXISTS test.cust (id Int, name String, gender Int, address String, zip Int,signdate String, status Int,level Int,campaign Int,linkedwithapps Int) ROW FORMAT delimited fields terminated by ',' LINES TERMINATED BY '\n' STORED AS textfile"

hive -e "load data local inpath '/root/data/csv/cust1.csv' into table test.cust"
