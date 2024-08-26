#!/usr/bin/env bash
## Bootstrap will check for and load docker secrets, then specific processing for the container purpose
## such as setting configuration based on environment variables 

set -e

df="[%Y-%m-%d %H:%M:%S]"

echo >&2 "$(date +"$df") INFO: Bootstrapping container..."
## Import the secrets as env vars - when not using secrets, this is not run
file_env() {
  local var="$1"
  local fileVar="${var}_FILE"
  local def="${2:-}"

  if ! test -f ${!fileVar} ; then
    echo >&2 "$(date +"$df") WARNING: '${!fileVar}' not available in this container"
    return 1
  fi
  if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
    echo >&2 "$(date +"$df") ERROR: Both '$var' and '$fileVar' are set (but are exclusive)"
    exit 1
  fi
  local val="$def"
  if [ "${!var:-}" ]; then
    val="${!var}"
  elif [ "${!fileVar:-}" ]; then
    val="$(< "${!fileVar}")"
  fi
  export "$var"="$val"
  ## Put the variables into the profile so a new shell will also have them
  sed -i "/export ${var}=/d" /etc/profile.d/docker.sh
  echo -e "export ${var}=${val}" >> /etc/profile.d/docker.sh
  unset "$fileVar"
}

echo >&2 "$(date +"$df") INFO: Processing secrets..."
if test -f /run/secrets/ENV_MULTILOAD; then
  ## Check if we have a special file (ENV_MULTILOAD) with multiple "secret" variables
  echo >&2 "$(date +"$df") INFO: Loading ENV_MULTILOAD secrets..."
  source /run/secrets/ENV_MULTILOAD
fi
while read secret_env; do
  ## Check for variables ending "_FILE" which signifies its real value is provided as a secret
  secret_var=$(echo ${secret_env} | cut -d= -f 1)
  file_env ${secret_var:0:-5};
done < <(env | grep '_FILE=')
echo >&2 "$(date +"$df") INFO: ...secrets complete"

## Map upstream ENV vars
export APP_ID=${web_fqdn}

## Ignore case for checking parameters (eg sso_enabled)
shopt -s nocasematch
## Ensure variables defined so we don't have to check later
sso_enabled=${sso_enabled:-false}
show_demo_login=${show_demo_login:-false}
saml_login_label=${saml_login_label:-"I2B2 SSO"}
login_dropdown_label=${login_dropdown_label:-"Login method"}
## We proxy /i2b2/ to the wildfly backend, so we can use that in configs after apache
pmURL="http://localhost/i2b2/rest/PMService/getServices"

## Setup
export website_scheme="http"
[[ $ssl_proxy = "true" ]] && export website_scheme="https"
echo >&2 "$(date +"$df") DEBUG: website_scheme set to '${website_scheme}' because ssl_proxy: ${ssl_proxy}"
if [[ $sso_enabled == "true" ]]; then
  echo >&2 "$(date +"$df") INFO: Configuring apache to support SSO..."
  echo >&2 "$(date +"$df") DEBUG: sso_enabled: ${sso_enabled}"
  envsubst "\${wildfly_scheme} \${wildfly_host} \${wildfly_port} \${web_fqdn} \${ajp_secret} \${website_scheme}" < /docker-config/i2b2_sso.conf > /etc/apache2/sites-available/i2b2.conf
  a2enmod proxy
  a2enmod proxy_ajp
  a2enmod rewrite
  a2enmod shib
  a2enconf shib
  a2ensite i2b2
  a2dissite 000-default
else
  echo >&2 "$(date +"$df") INFO: Configuring apache to for only local logins..."
  echo >&2 "$(date +"$df") DEBUG: sso_enabled: ${sso_enabled}"
  envsubst "\${wildfly_scheme} \${wildfly_host} \${wildfly_port} \${web_fqdn} \${website_scheme}" < /docker-config/i2b2_standalone.conf > /etc/apache2/sites-available/i2b2.conf
  a2enmod proxy
  a2enmod rewrite
  a2ensite i2b2
  a2dissite 000-default
  a2dismod shib
  a2disconf shib
fi

## Customisation
echo >&2 "$(date +"$df") INFO: Customising web interface..."
echo >&2 "$(date +"$df") DEBUG: Backing up files which will be changed..."
cd /var/www/html/
cp -a webclient/proxy.php{,_IMAGE}
cp -a webclient/i2b2_config_cells.json{,_IMAGE}
cp -a webclient/i2b2_config_domains.json{,_IMAGE}
cp -a webclient/js-i2b2/i2b2_ui_config.js{,_IMAGE}
## Reference correct wildfly backend
echo >&2 "$(date +"$df") DEBUG: Setting backend to: '${pmURL}' (accessible from the web server, not user's browser)"
sed -i -re "s|([$]pmURL[[:blank:]]*=[[:blank:]]*).*|\1\"${pmURL}\";|" webclient/proxy.php
echo >&2 "$(date +"$df") DEBUG: Setting new, relaxed regex for automatically whitelisting pmURL"
sed -i -e 's|\(\$regex[[:blank:]]*=[[:blank:]]*\).*|\1\"/\(http\|https\)\\\:\\\/\\\/\[a-zA-Z0-9\\-\\.\]\+\(\\\:\[0-9\]{2,5})\*\\/\?/\";|g'  webclient/proxy.php

if [[ $sso_enabled == "true" ]]; then
  echo >&2 "$(date +"$df") DEBUG: Update config data for SSO logins"
  cp -a webclient/i2b2_config_domains.json{,.bak} && \
  cat webclient/i2b2_config_domains.json.bak | jq 'del(.lstDomains[] | select(.name=="i2b2 (builtin)"))' > webclient/i2b2_config_domains.json
else
  echo >&2 "$(date +"$df") DEBUG: Update config data for local logins - disable SSO logins"
  cp -a webclient/i2b2_config_domains.json{,.bak} && \
  cat webclient/i2b2_config_domains.json.bak | jq 'del(.lstDomains[] | select(.name=="*sso*"))' > webclient/i2b2_config_domains.json
fi

if [[ ${show_demo_login} != "true" ]] ; then
    echo >&2 "$(date +"$df") INFO: Disabling the default demo user credentials"
    find  . -maxdepth 3 -type f -name i2b2_ui_config.js -exec sed -i -e 's/loginDefaultUsername: "demo"/loginDefaultUsername: ""/g' -e 's/loginDefaultPassword: "demouser"/loginDefaultPassword: ""/g' {} \;
fi
## Musing: what if there is a comma/escaped quote in the variable? Why not use real JSON so we can use jq!?
sed -i -e "s/\(loginIdp[[:blank:]]*:[[:blank:]]*\"\).*\(\".*\)/\1${saml_login_label}\2/g" -e "s/\(loginHostText[[:blank:]]*:[[:blank:]]*\).*\(,.*\)/\1\"${login_dropdown_label}\"\2/g" webclient/js-i2b2/i2b2_ui_config.js
cd -

if [[ $sso_enabled == "true" ]]; then
  echo >&2 "$(date +"$df") INFO: Configuring shibboleth and apache for SSO..."
  cp -a /etc/shibboleth/shibboleth2.xml{,_BAK}
  envsubst "\${app_entity_id} \${sso_entity_id} \${handle_ssl} \${admin_email}" < /docker-config/shibboleth/shibboleth2_TEMPLATE.xml > /etc/shibboleth/shibboleth2.xml
  ## No environmental config required
  cp /docker-config/shibboleth/attribute-map.xml /etc/shibboleth/
  ## Check for precence of shibboleth data
  if [[ ! -f "/etc/shibboleth/idp-metadata.xml" ]] ; then
      echo >&2 "$(date +"$df") ERROR: Please ensure '/etc/shibboleth/idp-metadata.xml' is provided (perhaps via a docker mount?)"
  fi
  if [[ ! -f "/etc/shibboleth/sp-signing-cert.pem" ]] ; then
      echo >&2 "$(date +"$df") ERROR: Please ensure '/etc/shibboleth/sp-signing-cert.pem' is provided (perhaps via a docker mount?)"
  fi
  if [[ ! -f "/etc/shibboleth/sp-signing-key.pem" ]] ; then
      echo >&2 "$(date +"$df") ERROR: Please ensure '/etc/shibboleth/sp-signing-key.pem' is provided (perhaps via a docker mount?)"
  fi

  echo >&2 "$(date +"$df") INFO: Starting shibboleth daemon..."
  service shibd start
fi

## Now continue the startup process with the remaining ENTRYPOINT and CMD parameters
sleep 1 ## Let commands complete (eg a2enmod)
echo >&2 "$(date +"$df") INFO: Continuing startup process (with CMD: $@)..."
exec "$@"
