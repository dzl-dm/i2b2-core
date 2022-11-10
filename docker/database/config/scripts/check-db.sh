#!/bin/bash
## Check database status - is it running, is it hosting an i2b2 database (try to init if not)

df="[%Y-%m-%d %H:%M:%S]"

echo >&2 "$(date +"$df") INFO: Running check-db..."
test_postgres='psql -U postgres -lqt | cut -d \| -f 1 | grep -qw "postgres"'
## This test is more or less the first thing the setup/init scrip will do
test_i2b2_started='psql -U postgres -lqt | cut -d \| -f 1 | grep -qw "i2b2"'
## This test is more or less the last thing the setup/init scrip will do - so it'll be safe to load the wildfly container
test_i2b2_complete='sudo -u postgres psql -Ui2b2workdata -lqt -c "SELECT COUNT(1) FROM WORKPLACE;" i2b2'
test_i2b2_complete='./healthcheck.sh'

while ! eval ${test_postgres} ; do
    ## Postgres should come up on its own, nothing we can do
    echo >&2 "$(date +"$df") INFO: Waiting for postgres to start..."
    sleep 3;
done

while ! eval ${test_i2b2_complete} ; do
    ## If postgres is running, but there is no i2b2 database, we must try to initialise it
    if ! eval ${test_i2b2_started} ; then
        echo >&2 "$(date +"$df") INFO: Initialising i2b2 database..."
        /docker-entrypoint/init-db.sh
    fi
    sleep 3;
done
echo "$(date +"$df") INFO: Everything working..."
