## Install apache and proxy manually to keep image size low, aid transparency
## and reduce dependancy on i2b2's images (in particular for security updates of dependencies - apache and php)
ARG i2b2_version=${i2b2_version:-1.7.13.0002}
ARG WEB_TAG=${I2B2_WEB_TAG:-'release-v1.7.13'}
## php:8.1.11-apache-bullseye uses apache 2.4.54
FROM php:8.1.11-apache-bullseye

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt install -y \
    curl gettext-base unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ARG i2b2_version
## System env
ENV TZ=${TZ:-'Europe/Berlin'}

# ADD https://codeload.github.com/i2b2/i2b2-webclient/zip/refs/tags/v1.7.13.0002 ~32mb
RUN curl -o /tmp/i2b2-webclient.zip https://codeload.github.com/i2b2/i2b2-webclient/zip/refs/tags/v${i2b2_version} && \
    mkdir -p /var/www/html/webclient/ && \
    unzip /tmp/i2b2-webclient.zip -d /tmp/ && \
    mv -T /tmp/i2b2-webclient-1.7.13.0002 /var/www/html/webclient && \
    rm -rf /tmp/i2b2-webclient*

## App defaults
ENV i2b2_host_display_name='Local i2b2 data warehouse'
ENV web_fqdn='localhost'
ENV wildfly_scheme='http'
ENV wildfly_url='i2b2-wildfly'
ENV wildfly_port='8080'
ENV show_demo_login='false'

COPY ./assets/favicon.ico /var/www/html/

COPY ./config /docker-config/
COPY ./bootstrap-web.sh /usr/local/bin/docker-bootstrap.sh

## Override entrypoint for custom initialisation...
ENTRYPOINT ["docker-bootstrap.sh", "docker-php-entrypoint"]
## From upstream (must be repeated)...
CMD ["apache2-foreground"]
