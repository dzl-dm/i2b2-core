#!/usr/bin/env bash
## The postgres entrypoint manages if/when this script is run - only when the db is not already initialised
## We use an env variable to choose how much data to initialise with
## - the administrator deploying the system can select it with "i2b2_data_level"

set -e

df="[%Y-%m-%d %H:%M:%S]"

echo >&2 "$(date +"$df") INFO: Initializing i2b2 database based on 'i2b2_data_level' = ${i2b2_data_level}..."

data_dir=/i2b2-data/db/
## Map the data initialization level to the filename
declare -A data_level
data_level[no_project]=dumpall-no-project.sql
data_level[demo_empty_project]=dumpall-demo-empty-project.sql
data_level[demo_full_project]=dumpall-demo-full-project.sql
default_data_level=demo_empty_project

if [[ ! ${!data_level[*]} =~ (^|[[:space:]])${i2b2_data_level}($|[[:space:]]) ]] ; then
    echo >&2 "$(date +"$df") ERROR: You should set 'i2b2_data_level' (= ${i2b2_data_level}) to one of: ${!data_level[*]}"
    echo >&2 "$(date +"$df") WARNING: Using default: ${default_data_level}"
    i2b2_data_level=${default_data_level}
fi

psql -f ${data_dir}/${data_level[${i2b2_data_level}]} && \
    echo >&2 "$(date +"$df") INFO: Initialization complete using sql file: ${data_dir}/${data_level[${i2b2_data_level}]}" || \
    echo >&2 "$(date +"$df") ERROR: Something went wrong trying to initialise (as user: $(whoami)) with data from file: ${data_level[${i2b2_data_level}]}"
