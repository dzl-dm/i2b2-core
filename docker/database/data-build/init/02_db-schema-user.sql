-- Initial setup - Prepare database for i2b2 data
CREATE DATABASE i2b2;

\connect i2b2

CREATE USER i2b2demodata WITH PASSWORD 'demouser' ;
CREATE USER i2b2hive WITH PASSWORD 'demouser' ;
CREATE USER i2b2imdata WITH PASSWORD 'demouser' ;
CREATE USER i2b2metadata WITH PASSWORD 'demouser' ;
CREATE USER i2b2pm WITH PASSWORD 'demouser' ;
CREATE USER i2b2workdata WITH PASSWORD 'demouser' ; 

CREATE SCHEMA i2b2demodata AUTHORIZATION i2b2demodata ;
CREATE SCHEMA i2b2hive AUTHORIZATION i2b2hive ;
CREATE SCHEMA i2b2imdata AUTHORIZATION i2b2imdata; 
CREATE SCHEMA i2b2metadata AUTHORIZATION i2b2metadata ;
CREATE SCHEMA i2b2pm AUTHORIZATION i2b2pm ;
CREATE SCHEMA i2b2workdata AUTHORIZATION i2b2workdata;

GRANT ALL PRIVILEGES ON DATABASE i2b2 to i2b2demodata;
GRANT ALL PRIVILEGES ON DATABASE i2b2 to i2b2hive;
GRANT ALL PRIVILEGES ON DATABASE i2b2 to i2b2imdata;
GRANT ALL PRIVILEGES ON DATABASE i2b2 to i2b2metadata;
GRANT ALL PRIVILEGES ON DATABASE i2b2 to i2b2pm;
GRANT ALL PRIVILEGES ON DATABASE i2b2 to i2b2workdata;

GRANT ALL ON SCHEMA i2b2demodata TO i2b2demodata;
GRANT ALL ON SCHEMA i2b2hive TO i2b2hive;
GRANT ALL ON SCHEMA i2b2imdata TO i2b2imdata;
GRANT ALL ON SCHEMA i2b2metadata TO i2b2metadata;
GRANT ALL ON SCHEMA i2b2pm TO i2b2pm;
GRANT ALL ON SCHEMA i2b2workdata TO i2b2workdata;
