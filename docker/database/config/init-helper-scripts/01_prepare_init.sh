#!/usr/bin/env bash
## Ensure everything is setup for the ant scripts to be run

df="[%Y-%m-%d %H:%M:%S]"

## Update the db.properties for our postgres env
## Ant will use this to connect and upload i2b2 data
echo >&2 "$(date +"$df") INFO: Updating db.properties for each schema"
echo >&2 "$(date +"$df") INFO: Running as user: $(whoami)"
base_data_dir="/tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall/"

sed -r 's/db.username=i2b2demodata/db.username=i2b2demodata/g' /i2b2-data/initdb.d/db.properties > ${base_data_dir}Crcdata/db.properties
sed -r 's/db.username=i2b2demodata/db.username=i2b2metadata/g' /i2b2-data/initdb.d/db.properties > ${base_data_dir}Metadata/db.properties
sed -r 's/db.username=i2b2demodata/db.username=i2b2pm/g' /i2b2-data/initdb.d/db.properties > ${base_data_dir}Pmdata/db.properties
sed -r 's/db.username=i2b2demodata/db.username=i2b2imdata/g' /i2b2-data/initdb.d/db.properties > ${base_data_dir}Imdata/db.properties
sed -r 's/db.username=i2b2demodata/db.username=i2b2workdata/g' /i2b2-data/initdb.d/db.properties > ${base_data_dir}Workdata/db.properties
sed -r 's/db.username=i2b2demodata/db.username=i2b2hive/g' /i2b2-data/initdb.d/db.properties > ${base_data_dir}Hivedata/db.properties

