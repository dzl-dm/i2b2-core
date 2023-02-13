#!/usr/bin/env bash
## This script will run postgres, add data via ant scripts and extract it via pg_dump
## so we have a format easy to distribute and control at deployment time without too many dependancies

df="[%Y-%m-%d %H:%M:%S]"
data_output_dir=${data_output_dir:-/i2b2-data/db/}

## We have to run "postgres" as a param to the upstream entrypoint in order to setup postgres correctly
## So we'll manage all the stages of initialisation, loading and extracting i2b2 data in this script...
echo >&2 "$(date +"$df") INFO: Running postgres in init mode to setup database, users and schema before launching fully"
/usr/local/bin/docker-entrypoint.sh postgres &
pg_pid=$!
sleep 1
echo >&2 "$(date +"$df") INFO: Postgres running fully with PID: ${pg_pid}"
echo >&2 "$(date +"$df") INFO: Running as user: $(whoami) (should be 'postgres')"
## Wait for postgres to be fully running and accepting connections (see entrypoint for wait command)
sleep 4

## Load and extract...

## Run ant scripts to build up the database
echo >&2 "$(date +"$df") INFO: Runing overall ant build script 'create_database' to create schema and basic project setup, but without meta or patient data - this should take only a few seconds"
cd /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall
sleep 0.1
ant -f build.xml create_database
## Extract data
echo >&2 "$(date +"$df") INFO: Extracting data after 'create_database'..."
su postgres -c "pg_dumpall --clean | sed -e 's/^DROP ROLE postgres/--&/' -e 's/^CREATE ROLE postgres/--&/' -e 's/^ALTER ROLE postgres/--&/' -e 's/^CREATE DATABASE postgres/--&/' -e 's/^DROP DATABASE postgres/--&/' -e 's/^ALTER DATABASE postgres/--&/' -e 's/^COMMENT ON DATABASE postgres/--&/' > ${data_output_dir}/dumpall-no-project.sql"

## Run extra SQL scripts on top of "create_database" in order to have a functioning, but empty, demo project
echo >&2 "$(date +"$df") INFO: Adding minimal demo-project without data..."
export PGPASSWORD=demouser
cd /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall

## Workdata:
# scripts/workplace_access_demo_insert_data.sql
su postgres -c "psql -h localhost -Ui2b2workdata -d i2b2 -f ./Workdata/scripts/workplace_access_demo_insert_data.sql"

## Hivedata:
cd Hivedata/scripts
# scripts/work_db_lookup_postgresql_insert_data.sql
# - Remove ACT project path and fix schema reference
awk 'NR==FNR{if (/ACT/) del[NR] del[NR-1]; next} !(FNR in del)' work_db_lookup_postgresql_insert_data.sql work_db_lookup_postgresql_insert_data.sql > work_db_lookup_postgresql_insert_data_EDIT.sql
sed -i 's/public/i2b2workdata/' work_db_lookup_postgresql_insert_data_EDIT.sql
su postgres -c "psql -h localhost -Ui2b2hive -d i2b2 -f work_db_lookup_postgresql_insert_data_EDIT.sql"
# scripts/ont_db_lookup_postgresql_insert_data.sql
# - Remove ACT project path and fix schema reference
awk 'NR==FNR{if (/ACT/) del[NR] del[NR-1]; next} !(FNR in del)' ont_db_lookup_postgresql_insert_data.sql ont_db_lookup_postgresql_insert_data.sql > ont_db_lookup_postgresql_insert_data_EDIT.sql
sed -i 's/public/i2b2metadata/' ont_db_lookup_postgresql_insert_data_EDIT.sql
su postgres -c "psql -h localhost -Ui2b2hive -d i2b2 -f ont_db_lookup_postgresql_insert_data_EDIT.sql"
# scripts/crc_db_lookup_postgresql_insert_data.sql
# - Remove ACT project path and fix schema reference
awk 'NR==FNR{if (/ACT/) del[NR] del[NR-1]; next} !(FNR in del)' crc_db_lookup_postgresql_insert_data.sql crc_db_lookup_postgresql_insert_data.sql > crc_db_lookup_postgresql_insert_data_EDIT.sql
sed -i 's/public/i2b2demodata/' crc_db_lookup_postgresql_insert_data_EDIT.sql
su postgres -c "psql -h localhost -Ui2b2hive -d i2b2 -f crc_db_lookup_postgresql_insert_data_EDIT.sql"
# scripts/im_db_lookup_postgresql_insert_data.sql
su postgres -c "psql -h localhost -Ui2b2hive -d i2b2 -f im_db_lookup_postgresql_insert_data.sql"
cd ../../

## Pmdata:
cd Pmdata/scripts/demo
# scripts/demo/pm_access_insert_data.sql
# - localhost:9090 -> i2b2-wildfly:8080
# - Change PROJECT_NAME to a nicer name than "i2b2 demo" - or just document how to change it
sed 's/localhost:9090/i2b2-wildfly:8080/' pm_access_insert_data.sql > pm_access_insert_data_EDIT.sql
su postgres -c "psql -h localhost -Ui2b2pm -d i2b2 -f pm_access_insert_data_EDIT.sql"
cd ../../../
## Extract data
echo >&2 "$(date +"$df") INFO: Extracting data after 'create_database' and minimal demo project setup..."
su postgres -c "pg_dumpall --clean | sed -e 's/^DROP ROLE postgres/--&/' -e 's/^CREATE ROLE postgres/--&/' -e 's/^ALTER ROLE postgres/--&/' -e 's/^CREATE DATABASE postgres/--&/' -e 's/^DROP DATABASE postgres/--&/' -e 's/^ALTER DATABASE postgres/--&/' -e 's/^COMMENT ON DATABASE postgres/--&/' > ${data_output_dir}/dumpall-demo-empty-project.sql"

## Drop i2b2 database and users and restart with whole demo-data...
echo >&2 "$(date +"$df") INFO: Removing all i2b2 data to start a fresh..."
su postgres -c "psql -h localhost -Upostgres -d postgres -c 'DROP DATABASE i2b2;'"
su postgres -c "psql -h localhost -Upostgres -d postgres -c '
    DROP OWNED BY i2b2demodata; DROP USER i2b2demodata;
    DROP OWNED BY i2b2hive; DROP USER i2b2hive;
    DROP OWNED BY i2b2imdata; DROP USER i2b2imdata;
    DROP OWNED BY i2b2metadata; DROP USER i2b2metadata;
    DROP OWNED BY i2b2pm; DROP USER i2b2pm;
    DROP OWNED BY i2b2workdata; DROP USER i2b2workdata;
'"

## Run ant scripts to build up the demo-data
echo >&2 "$(date +"$df") INFO: Running overall ant build script 'load_demodata' to load the full demo data - this can take several minutes..."
su postgres -c "psql -f /docker-entrypoint-initdb.d/02_db-schema-user.sql"
cd /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall/Hivedata/scripts
sed -i 's/public/i2b2workdata/' work_db_lookup_postgresql_insert_data.sql
sed -i 's/public/i2b2metadata/' ont_db_lookup_postgresql_insert_data.sql
sed -i 's/public/i2b2demodata/' crc_db_lookup_postgresql_insert_data.sql
cd ../../Pmdata/scripts/demo
## Change URL references to cells - it should be proxied via apache and is called from the server-side web component
sed -i 's/localhost:9090/i2b2-wildfly:8080/' pm_access_insert_data.sql
# sed -i 's/localhost:9090/localhost/' pm_access_insert_data.sql
cd /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall
sleep 0.1
ant -f build.xml create_database
ant -f build.xml load_demodata
## Extract data
echo >&2 "$(date +"$df") INFO: Extracting data after 'load_demodata'..."
su postgres -c "pg_dumpall --clean | sed -e 's/^DROP ROLE postgres/--&/' -e 's/^CREATE ROLE postgres/--&/' -e 's/^ALTER ROLE postgres/--&/' -e 's/^CREATE DATABASE postgres/--&/' -e 's/^DROP DATABASE postgres/--&/' -e 's/^ALTER DATABASE postgres/--&/' -e 's/^COMMENT ON DATABASE postgres/--&/' > ${data_output_dir}/dumpall-demo-full-project.sql"


echo >&2 "$(date +"$df") INFO: Ending database process ($pg_pid)..."
kill "${pg_pid}"

echo >&2 "$(date +"$df") INFO: Extraction script complete, find data under: '${data_output_dir}'"
sleep 5
