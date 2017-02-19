#!/bin/bash
#first run hive should run schematool
schematool -dbType mysql -initSchema

$HIVE_INSTALL/bin/hive --service metastore -p 10000 &> /var/log/hive.log &
$HIVE_INSTALL/bin/hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10008 --hiveconf hive.root.logger=INFO,console &>> /var/log/hive.log &
$HIVE_INSTALL/bin/hive --service hwi &>> /var/log/hive.log &
