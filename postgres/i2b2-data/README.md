# I2B2-data
Data for initialising a postgres database

The `load-i2b2-structure.sh` script in the parent directory can execute these sql files for you in the correct order to initialize the database with ease. However here we outline some details about each file for comepleteness. You could run them manually with the following commands:
```sh
## As postgres user:
psql -f filename.sql
## As root user:
su postgres -c "psql -f filename.sql"
```

## db-schema-user.sql
This file is used by the docker build process.

It creates the i2b2 database with its schema and i2b2 users.

It is taken from the [i2b2 documenation](https://community.i2b2.org/wiki/display/getstarted/3.3.2+Create+User+Accounts+in+PostgreSQL).

## dumpall-no-project.sql
This file can be run on a fresh postgres database management system. Please be cautious running it if you have existing databases.

It drops existing databases and re-creates a new i2b2 database with the users (with default passwords 'demouser') and structure for a functioning i2b2 system with no projects and only the admin user "i2b2" (default password 'demouser'). 

It is generated during the build stage of the database docker container. The `init-load-extract.sh` script initializes the database and takes a _'pg_dumpall'_ at the appropriate stage.

## dumpall-demo-empty-project.sql
This file can be run on a fresh postgres database management system. Please be cautious running it if you have existing databases.

It drops existing databases and re-creates a new i2b2 database with the users (with default passwords 'demouser') and structure for a functioning i2b2 system with the demo project and its default users. See the main [README](https://github.com/dzl-dm/i2b2-core/blob/main/README.md#common-adjustments) for details on how to manage these users. 

It is generated during the build stage of the database docker container. The `init-load-extract.sh` script initializes the database and takes a _'pg_dumpall'_ at the appropriate stage.

