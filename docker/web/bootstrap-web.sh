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

## Setup
echo >&2 "$(date +"$df") INFO: Configuring apache proxy to wildfly backend"
envsubst "\${wildfly_scheme} \${wildfly_host} \${wildfly_port} \${web_fqdn} \${ajp_secret}" < /docker-config/i2b2.conf > /etc/apache2/sites-available/i2b2.conf
a2enmod proxy
a2enmod proxy_ajp
a2ensite i2b2
a2dissite 000-default

## Customisation
echo >&2 "$(date +"$df") INFO: Customising interface..."
cd /var/www/html/
cp -a webclient/login.php{,_ORIG}
cp -a webclient/index.php{,_ORIG}
cp -a webclient/i2b2_config_data.js{,_ORIG}
## Display custom organisation name
find  . -maxdepth 2 -type f -name i2b2_config_data.js -exec sed -i "s|name: \"i2b2 Demo\",|name: \"${i2b2_host_display_name}\",|g" {} \;
## Reference correct backend
sed -i -re "s|([$]pmURL = ).*|\1\"${wildfly_scheme}://${wildfly_host}:${wildfly_port}/i2b2/rest/PMService/getServices\";|" webclient/index.php
sed -i -re "/[$]WHITELIST.=.array.*/a\    \"${wildfly_scheme}:\/\/${wildfly_host}:${wildfly_port}\"," webclient/index.php
# sed -i -re "s|(urlCellPM: ).*|\1\"${wildfly_scheme}://${wildfly_host}:${wildfly_port}/i2b2/services/PMService/\",|" webclient/i2b2_config_data.js
envsubst "\${wildfly_scheme} \${wildfly_host} \${wildfly_port} \${ajp_proxy_url}" < /docker-config/i2b2_config_data_TEMPLATE.js > webclient/i2b2_config_data.js
## Disable analysis and debugging for production
sed -i -re 's|(debug: ).*|\1false,|g' -e 's|(allowAnalysis: ).*|\1false,|g' webclient/i2b2_config_data.js
## Use compatible php for the login page (ensure AssertionConsumerServiceURL uses correct scheme)
cp /docker-config/login.php webclient/login.php
cp /docker-config/logout.php webclient/logout.php

shopt -s nocasematch
if [[ ${show_demo_login} != "true" ]] ; then
  echo >&2 "$(date +"$df") INFO: Disabling the default demo user credentials"
    find  . -maxdepth 3 -type f -name i2b2_ui_config.js -exec sed -i -e 's/loginDefaultUsername: "demo"/loginDefaultUsername: ""/g' -e 's/loginDefaultPassword: "demouser"/loginDefaultPassword: ""/g' {} \;
fi
cd -

echo >&2 "$(date +"$df") INFO: Configuring shibboleth and apache for SSO..."
cp -a /etc/shibboleth/shibboleth2.xml{,_ORIG}
envsubst "\${app_entity_id} \${sso_entity_id} \${handle_ssl} \${admin_email}" < /docker-config/shibboleth/shibboleth2_TEMPLATE.xml > /etc/shibboleth/shibboleth2.xml
## No environmental config required
cp /docker-config/shibboleth/attribute-map.xml /etc/shibboleth/
## Check for precence of shibboleth data
if [! -f "/etc/shibboleth/idp-metadata.xml" ] ; then
     echo >&2 "$(date +"$df") ERROR: Please ensure '/etc/shibboleth/idp-metadata.xml' is provided (perhaps via a docker mount?)"
fi
if [! -f "/etc/shibboleth/sp-signing-cert.pem" ] ; then
     echo >&2 "$(date +"$df") ERROR: Please ensure '/etc/shibboleth/sp-signing-cert.pem' is provided (perhaps via a docker mount?)"
fi
if [! -f "/etc/shibboleth/sp-signing-key.pem" ] ; then
     echo >&2 "$(date +"$df") ERROR: Please ensure '/etc/shibboleth/sp-signing-key.pem' is provided (perhaps via a docker mount?)"
fi

echo >&2 "$(date +"$df") INFO: Starting shibboleth daemon..."
sleep 1 ## Let commands complete (eg a2enmod)
service shibd start

## Now continue the startup process with the remaining ENTRYPOINT and CMD parameters
sleep 1 ## Let commands complete (eg a2enmod)
echo >&2 "$(date +"$df") INFO: Continuing startup process (with CMD: $@)..."
exec "$@"
