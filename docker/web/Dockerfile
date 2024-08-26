## Install apache and proxy manually to keep image size low, aid transparency
## and reduce dependancy on i2b2's images (in particular for security updates of dependencies - apache and php)
ARG i2b2_version=${i2b2_version:-v1.8.1.0001}
ARG WEB_TAG=${I2B2_WEB_TAG:-'release-v1.8.1'}

FROM alpine AS download-git
## Multi-stage build to add remote archive is more efficient than wget/curl from the main image - at least for the end image size
ARG i2b2_version
RUN apk add git

RUN cd /tmp && \
    git clone --branch ${i2b2_version} --depth 1 https://github.com/i2b2/i2b2-webclient.git && \
    rm i2b2-webclient/README.md i2b2-webclient/external-site-example.html

## Fix generic bugs
# Don't fail when there is no query string (always the case at logon as its via POST)
# RUN sed -i "s/if ($sec_fix['query'] != null) {/if (array_key_exists('query', $sec_fix) and $sec_fix['query'] != null) {/g" /tmp/i2b2-webclient/proxy.php
RUN sed -i "s/if (\$sec_fix\['query'\] != null) {/if (array_key_exists('query', \$sec_fix) and \$sec_fix\['query'\] != null) {/g" /tmp/i2b2-webclient/proxy.php

# CMD tail -F any

# FROM php:8.3.9-alpine
## php:8.3.9-apache-bullseye uses apache 2.4.59
FROM php:8.3.9-apache-bullseye

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
    gettext-base \
    jq \
    libapache2-mod-shib \
    shibboleth-sp-utils \
    xmlstarlet \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN a2enmod proxy && \
    a2enmod proxy_ajp && \
    a2enmod rewrite

## Copy the main application from the 1st stage
COPY --from=download-git --chown=0:0 /tmp/i2b2-webclient /var/www/html/webclient

## Add an i2b2 icon for the browser tab
COPY --chmod=0644 ./assets/favicon.ico /var/www/html/webclient/
## Add our configs
COPY ./config /docker-config/
COPY --chmod=0755 ./bootstrap-web.sh /usr/local/bin/docker-bootstrap.sh

## Fix legacy plugin use of proxy
RUN sed -i -re 's|(urlProxy[[:blank:]]*:[[:blank:]]*).*|\1"/webclient/proxy.php",|g' webclient/js-i2b2/cells/LEGACYPLUGIN/legacy_plugin/i2b2_config_data.js

## Update some i2b2 config for our docker environment
COPY --chmod=0644 ./config/i2b2_config_domains.json /var/www/html/webclient/i2b2_config_domains.json
## Also update proxy
RUN sed -i 's|"http://services.i2b2.org",|"http://i2b2-wildfly:8080",\n    "http://i2b2.wildfly:8080",\n    "http://services.i2b2.org",|g' /var/www/html/webclient/proxy.php


## System env
ENV TZ=${TZ:-'Europe/Berlin'}
## App defaults
ENV i2b2_host_display_name='Central i2b2 data warehouse'
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
# ENTRYPOINT ["docker-php-entrypoint"]
## From upstream (must be repeated)...
CMD ["apache2-foreground"]
