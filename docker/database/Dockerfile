## data_version_tag: without preceeding "v" - so it matches the path within the archive
ARG data_version_tag=1.7.13.0002

## Multi-stage build to generate dump's of the database which can be used to restore it with:
## * only the minimum structure
## * with demographics meta data - TODO
## * with demonstration meta data - TODO
## * with demonstration patient data
FROM postgres:12 AS i2b2-data-fetch
# FROM postgres:12
ARG data_version_tag
ARG DEBIAN_FRONTEND=noninteractive

## Install packages which we need
RUN apt update && \
    apt install -y --no-install-recommends \
    ant curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /i2b2-data
## Fetch the i2b2 data
RUN cd /tmp && \
    curl -ko ./i2b2-data.tar.gz https://codeload.github.com/i2b2/i2b2-data/tar.gz/refs/tags/v${data_version_tag} && \
    tar xzf ./i2b2-data.tar.gz && \
    rm -rf ./i2b2-data.tar.gz

## Populate the initdb.d dir which is processed by the container's entrypoint script
COPY --chmod=0755 ./data-build/init/* /docker-entrypoint-initdb.d/
## Add our own scipts and config files
COPY --chmod=0755 ./data-build/init-load-extract.sh /i2b2-data/
COPY ./data-build/db.properties ./config/

RUN chgrp -R postgres /i2b2-data && \
    chgrp -R postgres /docker-entrypoint-initdb.d && \
    chgrp -R postgres /tmp/i2b2-data-1.7.13.0002/edu.harvard.i2b2.data/Release_1-7/NewInstall/

## Setup directory for database data
ENV data_output_dir=/i2b2-data/db/
RUN mkdir -p ${data_output_dir} && \
    chown postgres ${data_output_dir}

## Must be set else we get 0 sized pg_dump files
ENV POSTGRES_PASSWORD=ChangeMe

## Populate and extract specific sub-sets of i2b2 data for easy restoration into a new postgres database at deployment time
RUN /i2b2-data/init-load-extract.sh


## Final image
FROM postgres:12

ENV TZ=${TZ:-'Europe/Berlin'}
ARG data_version_tag
ENV data_version_tag=${data_version_tag}
ARG DEBIAN_FRONTEND=noninteractive

# USER postgres
WORKDIR /i2b2-data
## Get the pg_dump files from the build stage so we can choose which to deploy
COPY --from=i2b2-data-fetch --chmod=0644 /i2b2-data/db/* /i2b2-data/db/
## This will be run by postgres' own entrypoint to initialise the database with data
COPY --chmod=0755 ./config/10_i2b2-setup-chooser.sh /docker-entrypoint-initdb.d/

ENV i2b2_data_level=demo_empty_project

## Standard upstream entrypoint and cmd
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["postgres"]
