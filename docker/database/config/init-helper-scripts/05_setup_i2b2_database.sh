#!/usr/bin/env bash
## Run the ant scripts which setup the database, users, schema, procedures etc, but not any data

df="[%Y-%m-%d %H:%M:%S]"

echo >&2 "$(date +"$df") INFO: Initialisting database, users and schema with custom script"
echo >&2 "$(date +"$df") INFO: Running as user: $(whoami)"
## Create "i2b2" database as its not created by ant scripts
# psql -c 'CREATE DATABASE i2b2;'
psql -f /i2b2-data/initdb.d/db-schema-user.sql

## Run ant scripts to build up the database
echo >&2 "$(date +"$df") INFO: Run overall ant build script 'create_database' to create schema and basic project setup, but without meta or patient data"

cd /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall
sleep 0.1
ant -f build.xml create_database
