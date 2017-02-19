#!/bin/bash

set -ex

cp vimrc ~/.vimrc
rm -rf /usr/local/hadoop-2.6.4/share/hadoop/common/lib/slf4j-log4j12-1.7.5.jar

../start-hadoop.sh

../start-hive.sh

../start-spark.sh
