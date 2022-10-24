## Install i2b2 wildfly application manually to keep image size low, aid transparency
## and reduce dependancy on i2b2's images (in particular for security updates of dependencies - apache and php)
ARG i2b2_version=${i2b2_version:-1.7.13.0002}
ARG I2B2_WILDFLY_TAG=${I2B2_WILDFLY_TAG:-release-v1.7.13}
ARG wildfly_version=${wildfly_version:-17.0.1.Final}
ARG wildfly_sha1=${wildfly_sha1:-eaef7a87062837c215e54511c4ada8951f0bd8d5}

## Use i2b2's image to get the i2b2 ".war", but still build our own final image
FROM i2b2/i2b2-wildfly:${I2B2_WILDFLY_TAG} as pre-built-war

## Build from centos to use specific java and wildfly versions
FROM centos:7.9.2009

RUN yum update -y && yum -y install java-11-openjdk && yum clean all  

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
RUN cd /tmp/ && \
    curl -O https://download.jboss.org/wildfly/${wildfly_version}/wildfly-${wildfly_version}.tar.gz && \
    sha1sum wildfly-${wildfly_version}.tar.gz | grep ${wildfly_sha1} && \
    tar xf wildfly-${wildfly_version}.tar.gz && \
    mv /tmp/wildfly-${wildfly_version} $JBOSS_HOME && \
    rm wildfly-${wildfly_version}.tar.gz && \
    chown -R jboss:0 ${JBOSS_HOME} && \
    chmod -R g+rw ${JBOSS_HOME}
ENV LAUNCH_JBOSS_IN_BACKGROUND=true
USER jboss
EXPOSE 8080

## Add i2b2.war from i2b2's docker image
COPY --from=pre-built-war /opt/jboss/wildfly/customization /opt/jboss/wildfly/customization

## Setup default environment for i2b2
ENV jdbc_pg_driver_version=42.2.8 jdbc_pg_driver_download_url=https://jdbc.postgresql.org/download/postgresql-.jar
ENV JBOSS_HTTP_PORT=8080
ENV DEBUG_ENABLED=false
## Default env's for postgres database
ENV DS_TYPE=postgres DS_IP=i2b2-database DS_PORT=5432
## Default login data
ENV DS_CRC_USER=i2b2demodata DS_ONT_USER=i2b2metadata DS_PM_USER=i2b2pm DS_IM_USER=i2b2imdata DS_WD_USER=i2b2workdata DS_HIVE_USER=i2b2hive
ENV DS_CRC_DB=i2b2demodata DS_ONT_DB=i2b2metadata DS_PM_DB=i2b2pm DS_IM_DB=i2b2imdata DS_WD_DB=i2b2workdata DS_HIVE_DB=i2b2hive

## Tidy up history and permissions
USER root
RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history
RUN chgrp -R 0 /opt/jboss/wildfly/standalone && \
    chmod -R g+rwX /opt/jboss/wildfly/standalone && \
    chgrp -R 0 /opt/jboss/wildfly/modules && \
    chmod -R g+rwX /opt/jboss/wildfly/modules && \
    chmod +x /opt/jboss/wildfly/customization/execute.sh
USER jboss

## Add our own bootstrap script
COPY ./bootstrap-wildfly.sh /usr/local/bin/docker-bootstrap.sh

## Override entrypoint for custom initialization...
ENTRYPOINT ["docker-bootstrap.sh"]
## From upstream (must be repeated)...
CMD ["/opt/jboss/wildfly/customization/execute.sh"]
