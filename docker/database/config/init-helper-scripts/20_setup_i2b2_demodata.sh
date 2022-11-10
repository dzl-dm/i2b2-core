#!/usr/bin/env bash
## Run the ant scripts which load the demo data

df="[%Y-%m-%d %H:%M:%S]"

echo >&2 "$(date +"$df") INFO: Run overall ant build script 'load_demodata' to provide some data for the user to test i2b2 with"
cd /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall
# ant -f data_build.xml load_demodata
