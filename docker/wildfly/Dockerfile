## Install i2b2 wildfly application manually to keep image size low, aid transparency
## and reduce dependancy on i2b2's images (in particular for security updates of dependencies - apache and php)
ARG i2b2_version=${i2b2_version:-1.7.13.0002}
ARG I2B2_WILDFLY_TAG=${I2B2_WILDFLY_TAG:-release-v1.7.13}
ARG wildfly_version=${wildfly_version:-18.0.1.Final}
ARG wildfly_sha1=${wildfly_sha1:-ef0372589a0f08c36b15360fe7291721a7e3f7d9}

FROM debian:11-slim as build-i2b2-core
# FROM debian:11-slim
## Multi-stage build to add remote archive is more efficient than wget/curl from the main image - at least for the end image size
## We build from source because we don't know of a reliable binary download link
## Build from source could have its benefits too...
ARG i2b2_version
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y --no-install-recommends \
    ant curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \
    git clone --branch v${i2b2_version} --depth 1 https://github.com/i2b2/i2b2-core-server.git
RUN cd /tmp/i2b2-core-server/edu.harvard.i2b2.server-common && \
    ant clean dist war
## Now the i2b2.war is in: /tmp/i2b2-core-server/edu.harvard.i2b2.server-common/dist/i2b2.war
## ...and the jdbc drivers are in: /tmp/i2b2-core-server/edu.harvard.i2b2.server-common/lib/jdbc/

## Prepare JBoss Wildfly container...
## Prepare system
WORKDIR /opt/jboss
RUN groupadd -r jboss -g 1000 && \
    useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss
## Download and extract wildfly application container
ARG wildfly_version
ARG wildfly_sha1
## Caution: Artefact hosting server changed from ~v25.x.x onwards (jboss.org -> github.com)
RUN cd /tmp/ && \
    # curl -OL https://github.com/wildfly/wildfly/releases/download/${wildfly_version}/wildfly-${wildfly_version}.tar.gz && \
    curl -O https://download.jboss.org/wildfly/${wildfly_version}/wildfly-${wildfly_version}.tar.gz && \
    echo "Should be: ${wildfly_sha1}" && echo "Is: $(sha1sum wildfly-${wildfly_version}.tar.gz)" && \
    sha1sum wildfly-${wildfly_version}.tar.gz | grep ${wildfly_sha1} && \
    tar xf wildfly-${wildfly_version}.tar.gz
## Wildfly is now available at: /tmp/wildfly-${wildfly_version}


## Build from debian and use specific java and wildfly versions
FROM debian:11-slim

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y --no-install-recommends \
    openjdk-11-jre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=${TZ:-'Europe/Berlin'}

## Prepare system
WORKDIR /opt/jboss
USER root
RUN groupadd -r jboss -g 1000 && \
    useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss

ENV JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/jre}
ENV JBOSS_HOME=${JBOSS_HOME:-/opt/jboss/wildfly}
## Add wildfly from the build stage
ARG wildfly_version
COPY --from=build-i2b2-core --chown=jboss:0 /tmp/wildfly-${wildfly_version} ${JBOSS_HOME}
RUN mkdir -p ${JBOSS_HOME}/customization ${JBOSS_HOME}/standalone ${JBOSS_HOME}/modules && \
    cd /usr/lib/jvm/ && \
    ln -s java-11-openjdk-amd64 jre && \

    chown -R jboss:0 ${JBOSS_HOME} && \
    chmod -R g+rw ${JBOSS_HOME} && \
    chmod -R g+rwX ${JBOSS_HOME}/standalone ${JBOSS_HOME}/modules


ENV LAUNCH_JBOSS_IN_BACKGROUND=true
EXPOSE 8080

## Add i2b2.war and jdbc driver(s) from the build stage
COPY --from=build-i2b2-core --chown=jboss:0 /tmp/i2b2-core-server/edu.harvard.i2b2.server-common/dist/i2b2.war  /opt/jboss/wildfly/customization/
COPY --from=build-i2b2-core --chown=jboss:0 /tmp/i2b2-core-server/edu.harvard.i2b2.server-common/lib/jdbc/postgresql*.jar /opt/jboss/wildfly/customization/
## Add our own bootstrap script
COPY ./bootstrap-wildfly.sh /usr/local/bin/docker-bootstrap.sh
## ...and the execute.sh which i2b2 use in their docker image
COPY ./execute.sh ${JBOSS_HOME}/customization/execute.sh

## Tidy up history and permissions
RUN chmod a+rx ${JBOSS_HOME}/customization/execute.sh /usr/local/bin/docker-bootstrap.sh
USER jboss

## Setup default environment for i2b2
ENV jdbc_pg_driver_version=42.2.8 jdbc_pg_driver_download_url=https://jdbc.postgresql.org/download/postgresql-.jar
ENV JBOSS_HTTP_PORT=8080
ENV DEBUG_ENABLED=false
## Default env's for postgres database
ENV DS_TYPE=postgres DS_IP=i2b2-database DS_PORT=5432
## Default login data
ENV DS_CRC_USER=i2b2demodata DS_ONT_USER=i2b2metadata DS_PM_USER=i2b2pm DS_IM_USER=i2b2imdata DS_WD_USER=i2b2workdata DS_HIVE_USER=i2b2hive
ENV DS_CRC_DB=i2b2demodata DS_ONT_DB=i2b2metadata DS_PM_DB=i2b2pm DS_IM_DB=i2b2imdata DS_WD_DB=i2b2workdata DS_HIVE_DB=i2b2hive

## Override entrypoint for custom initialization...
ENTRYPOINT ["docker-bootstrap.sh"]
## From upstream (must be repeated)...
CMD ["/opt/jboss/wildfly/customization/execute.sh"]
