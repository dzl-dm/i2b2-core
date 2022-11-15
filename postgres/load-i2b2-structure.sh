#!/usr/bin/env bash
## Initialise database, not with data, but with i2b2 uesrs and privileges
## Script will check if database has i2b2 schema and exit,
## or configure it based on the environment variables to include meta and/or demonstration data

## To override variables (eg passwords), run me like so:
## PG_I2B2_DM_PASS=admin PGI2B2USERPASS=user ./init-db.sh

## Run as user "root" on system with postgres installed

df="[%Y-%m-%d %H:%M:%S]"
i2b2_initial_data_level=$1

## Check database exists
if su postgres -c "psql i2b2 -c '' 2>&1"; then
    echo >&2 "$(date +"$df") WARNING: Database 'i2b2' already exists! Nothing to do. Exiting..."
    exit 0
fi

echo >&2 "$(date +"$df") INFO: Initializing i2b2 database based on 'i2b2_initial_data_level' = ${i2b2_initial_data_level:-Not provided}..."

data_dir=./i2b2-data/
## Map the data initialization level to the filename
declare -A data_level
data_level[no_project]=dumpall-no-project.sql
data_level[demo_empty_project]=dumpall-demo-empty-project.sql
## Not available in local script as dump is too big ~25Mb
# data_level[demo_full_project]=dumpall-demo-full-project.sql
default_data_level=demo_empty_project

if [[ ! ${!data_level[*]} =~ (^|[[:space:]])${i2b2_initial_data_level}($|[[:space:]]) ]] ; then
    echo >&2 "$(date +"$df") ERROR: You should set 'i2b2_initial_data_level' (= ${i2b2_initial_data_level}) to one of: ${!data_level[*]}"
    echo >&2 "$(date +"$df") WARNING: Using default: ${default_data_level}"
    i2b2_initial_data_level=${default_data_level}
fi

## Prime the database for i2b2 data, then load what the user has chosen
su postgres -c "psql -f ${data_dir}/db-schema-user.sql" && \
    su postgres -c "psql -f ${data_dir}/${data_level[${i2b2_initial_data_level}]}" && \
    echo >&2 "$(date +"$df") INFO: Initialization complete using sql file: ${data_dir}/${data_level[${i2b2_initial_data_level}]}" || \
    echo >&2 "$(date +"$df") ERROR: Something went wrong trying to initialise (as user: $(whoami)) with data from file: ${data_level[${i2b2_initial_data_level}]}"
