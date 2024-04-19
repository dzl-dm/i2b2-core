## Install apache and proxy manually to keep image size low, aid transparency
## and reduce dependancy on i2b2's images (in particular for security updates of dependencies - apache and php)
ARG i2b2_version=${i2b2_version:-1.7.13.0002}
ARG WEB_TAG=${I2B2_WEB_TAG:-'release-v1.7.13'}

FROM alpine as download-web
## Multi-stage build to add remote archive is more efficient than wget/curl from the main image - at least for the end image size
ARG i2b2_version
RUN apk add curl unzip

## web component has received a "refresh", so this is called "classic" now
# ADD https://codeload.github.com/i2b2/i2b2-webclient/zip/refs/tags/v1.7.13.0002 ~32mb
# RUN curl -o /tmp/i2b2-webclient.zip https://codeload.github.com/i2b2/i2b2-webclient/zip/refs/tags/v${i2b2_version} && \
RUN curl -o /tmp/i2b2-webclient.zip https://codeload.github.com/i2b2/i2b2-webclient-classic/zip/refs/tags/v${i2b2_version} && \
    mkdir -p /var/www/html/webclient/ && \
    unzip /tmp/i2b2-webclient.zip -d /tmp/ && \
    mv -T /tmp/i2b2-webclient-1.7.13.0002 /tmp/webclient && \
    rm -rf /tmp/i2b2-webclient*


## php:8.1.11-apache-bullseye uses apache 2.4.54
FROM php:8.1.11-apache-bullseye
# FROM php:5.6-apache-stretch

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
    gettext-base \
    libapache2-mod-shib \
    shibboleth-sp-utils \
    xmlstarlet \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY --from=download-web --chown=0:0 /tmp/webclient /var/www/html/webclient

## Add an i2b2 icon for the browser tab
COPY ./assets/favicon.ico /var/www/html/
## Add our configs
COPY ./config /docker-config/
COPY --chmod=0755 ./bootstrap-web.sh /usr/local/bin/docker-bootstrap.sh

## System env
ENV TZ=${TZ:-'Europe/Berlin'}
## App defaults
ENV i2b2_host_display_name='Local i2b2 data warehouse'
ENV web_fqdn='localhost'
ENV wildfly_scheme='http'
ENV wildfly_host='i2b2-wildfly'
ENV wildfly_port='8080'
ENV show_demo_login='false'
## Var's for sso
ENV sso_enabled='false'
ENV ajp_proxy_url='http://127.0.0.1/i2b2/services/PMService/'
ENV ajp_secret='not_set'
ENV app_entity_id='http://localhost/idp'
ENV sso_entity_id='http://localhost/idp'
## Proxy will handle ssl, not us
ENV handle_ssl='false'
ENV admin_email='noreply@example.com'
ENV ssl_proxy='false'

## Override entrypoint for custom initialisation...
ENTRYPOINT ["docker-bootstrap.sh", "docker-php-entrypoint"]
## From upstream (must be repeated)...
CMD ["apache2-foreground"]
