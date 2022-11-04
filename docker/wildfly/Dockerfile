## Install i2b2 wildfly application manually to keep image size low, aid transparency
## and reduce dependancy on i2b2's images (in particular for security updates of dependencies - apache and php)
ARG i2b2_version=${i2b2_version:-1.7.13.0002}
ARG I2B2_WILDFLY_TAG=${I2B2_WILDFLY_TAG:-release-v1.7.13}
## See: https://www.wildfly.org/downloads/
# ARG wildfly_version=${wildfly_version:-17.0.1.Final}
# ARG wildfly_sha1=${wildfly_sha1:-eaef7a87062837c215e54511c4ada8951f0bd8d5}
# ARG wildfly_version=${wildfly_version:-26.1.2.Final}
# ARG wildfly_sha1=${wildfly_sha1:-3dda0f3795c00cedf8b14c83f8c341244e7cad44}
# ARG wildfly_version=${wildfly_version:-19.1.0.Final}
# ARG wildfly_sha1=${wildfly_sha1:-6883125745a62b598659ea351f5b1706aff53955}
ARG wildfly_version=${wildfly_version:-18.0.1.Final}
ARG wildfly_sha1=${wildfly_sha1:-ef0372589a0f08c36b15360fe7291721a7e3f7d9}

## Use i2b2's image to get the i2b2 ".war", but still build our own final image
FROM i2b2/i2b2-wildfly:${I2B2_WILDFLY_TAG} as pre-built-war

## Build from debian and use specific java and wildfly versions
FROM debian:11-slim

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y --no-install-recommends \
    openjdk-11-jre curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=${TZ:-'Europe/Berlin'}

## Prepare system
WORKDIR /opt/jboss
USER root
RUN groupadd -r jboss -g 1000 && \
    useradd -u 1000 -r -g jboss -m -d /opt/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod 755 /opt/jboss

## Download and extract wildfly application container
ARG wildfly_version
ARG wildfly_sha1
ENV JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/jre}
ENV JBOSS_HOME=${JBOSS_HOME:-/opt/jboss/wildfly}
## Caution: Artefact hosting server changed from ~v25.x.x onwards (jboss.org -> github.com)
RUN cd /tmp/ && \
    [[ $(echo $wildfly_version|cut -d. -f 1) -ge 25 ]] && \
    curl -OL https://github.com/wildfly/wildfly/releases/download/${wildfly_version}/wildfly-${wildfly_version}.tar.gz || \
    curl -O https://download.jboss.org/wildfly/${wildfly_version}/wildfly-${wildfly_version}.tar.gz || \
    $(echo "ERROR! Cannot find version '${wildfly_version}' of wildfly" && exit 1) && \
    echo "Should be: ${wildfly_sha1}" && echo "Is: $(sha1sum wildfly-${wildfly_version}.tar.gz)" && \
    sha1sum wildfly-${wildfly_version}.tar.gz | grep ${wildfly_sha1} && \
    tar xf wildfly-${wildfly_version}.tar.gz && \
    mv /tmp/wildfly-${wildfly_version} $JBOSS_HOME && \
    rm wildfly-${wildfly_version}.tar.gz && \
    rm -rf ${JBOSS_HOME}/standalone/configuration/standalone_xml_history && \

    cd /usr/lib/jvm/ && \
    ln -s java-11-openjdk-amd64 jre && \

    chown -R jboss:0 ${JBOSS_HOME} && \
    chmod -R g+rw ${JBOSS_HOME} && \
    chmod -R g+rwX ${JBOSS_HOME}/standalone && \
    chmod -R g+rwX ${JBOSS_HOME}/modules

ENV LAUNCH_JBOSS_IN_BACKGROUND=true
EXPOSE 8080

## Add i2b2.war from i2b2's docker image
COPY --from=pre-built-war --chown=jboss:0 /opt/jboss/wildfly/customization /opt/jboss/wildfly/customization
## Add our own bootstrap script
COPY ./bootstrap-wildfly.sh /usr/local/bin/docker-bootstrap.sh

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
