#!/usr/bin/env bash
## Bootstrap will check for and load docker secrets, then specific processing for the container purpose
## such as setting configuration based on environment variables 

df="[%Y-%m-%d %H:%M:%S]"

function log_debug { [[ "${log_verbosity}" -ge 3 ]] && echo "[$(date +"$df")] DEBUG: ${@}"; }
function log_info { [[ "${log_verbosity}" -ge 2 ]] && echo "[$(date +"$df")] INFO: ${@}"; }
function log_warn { [[ "${log_verbosity}" -ge 1 ]] && echo "[$(date +"$df")] WARN: ${@}"; }
function log_error { echo "[$(date +"$df")] ERROR: ${@}"; }
function log_critical { echo "[$(date +"$df")] CRITICAL: ${@}"; }

log_info "Bootstrapping container..."
## Import the secrets as env vars - when not using secrets, this is not run
file_env() {
  local var="$1"
  local fileVar="${var}_FILE"
  local def="${2:-}"

  if ! test -f ${!fileVar} ; then
    log_warn "'${!fileVar}' not available in this container"
    return 1
  fi
  if [ "${!var:-}" ] && [ "${!fileVar:-}" ]; then
    log_error "Both '$var' and '$fileVar' are set (but are exclusive)"
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

log_info "Processing secrets..."
if test -f /run/secrets/ENV_MULTILOAD; then
  ## Check if we have a special file (ENV_MULTILOAD) with multiple "secret" variables
  log_info "Loading ENV_MULTILOAD secrets..."
  source /run/secrets/ENV_MULTILOAD
fi
while read secret_env; do
  ## Check for variables ending "_FILE" which signifies its real value is provided as a secret
  secret_var=$(echo ${secret_env} | cut -d= -f 1)
  file_env ${secret_var:0:-5};
done < <(env | grep '_FILE=')
log_info "...secrets complete"

## Map upstream ENV vars
export APP_ID=${web_fqdn}

## Ignore case for checking parameters (eg sso_enabled)
shopt -s nocasematch
## Ensure variables defined so we don't have to check later
sso_enabled=${sso_enabled:-false}
show_demo_login=${show_demo_login:-false}
saml_login_label=${saml_login_label:-"I2B2 SSO"}
login_dropdown_label=${login_dropdown_label:-"Login method"}
## We use apache to proxy /i2b2/ to the wildfly backend, so we can use that in configs here
pmURL="http://localhost/i2b2/rest/PMService/getServices"

## If we've set log_verbosity to 3/debug, then we might want some extra tools installed in the image
[[ "${log_verbosity}" -ge 3 ]] && { apt update && apt install -y vim less procps; }
## Setup
export website_scheme="http"
[[ $ssl_proxy = "true" ]] && export website_scheme="https"
log_debug "website_scheme set to '${website_scheme}' because ssl_proxy: ${ssl_proxy}"
if [[ $sso_enabled == "true" ]]; then
  log_info "Configuring apache to support SSO..."
  log_debug "sso_enabled: ${sso_enabled}"
  envsubst "\${wildfly_scheme} \${wildfly_host} \${wildfly_port} \${web_fqdn} \${ajp_secret} \${website_scheme}" < /docker-config/i2b2_sso.conf > /etc/apache2/sites-available/i2b2.conf
  a2enmod proxy
  a2enmod proxy_ajp
  a2enmod rewrite
  a2enmod shib
  a2enconf shib
  a2ensite i2b2
  a2dissite 000-default
else
  log_info "Configuring apache to for only local logins..."
  log_debug "sso_enabled: ${sso_enabled}"
  envsubst "\${wildfly_scheme} \${wildfly_host} \${wildfly_port} \${web_fqdn} \${website_scheme}" < /docker-config/i2b2_standalone.conf > /etc/apache2/sites-available/i2b2.conf
  a2enmod proxy
  a2enmod rewrite
  a2ensite i2b2
  a2dissite 000-default
  a2dismod shib
  a2disconf shib
fi

## Customisation
log_info "Customising web interface..."
log_debug "Backing up files which will be changed..."
cd /var/www/html/
## Edit image file directly
cp -a webclient/proxy.php{,_IMAGE}
cp -a webclient/js-i2b2/i2b2_ui_config.js{,_IMAGE}
cp -a webclient/js-i2b2/cells/LEGACYPLUGIN/legacy_plugin/js-i2b2/i2b2_loader.js{,_IMAGE}
cp -a webclient/i2b2_config_cells.json{,_IMAGE}
cp -a webclient/i2b2_config_domains.json{,_IMAGE}
cp -a webclient/js-i2b2/i2b2_ui_config.js{,_IMAGE}
## Reference correct wildfly backend
log_debug "Setting backend to: '${pmURL}' (accessible from the web server, not user's browser)"
sed -i -re "s|([$]pmURL[[:blank:]]*=[[:blank:]]*).*|\1\"${pmURL}\";|" webclient/proxy.php
log_debug "Setting new, relaxed regex for automatically whitelisting pmURL"
sed -i -e 's|\(\$regex[[:blank:]]*=[[:blank:]]*\).*|\1\"/\(http\|https\)\\\:\\\/\\\/\[a-zA-Z0-9\\-\\.\]\+\(\\\:\[0-9\]{2,5})\*\\/\?/\";|g'  webclient/proxy.php

if [[ ${show_demo_login} != "true" ]] ; then
    log_info "Disabling the default demo user credentials"
    sed -i -re 's/(loginDefaultUsername[[:blank:]]*:[[:blank:]]*).*,/\1"",/g' -re 's/(loginDefaultPassword[[:blank:]]*:[[:blank:]]*).*,/\1"",/g' webclient/js-i2b2/i2b2_ui_config.js
fi
if [[ $sso_enabled == "true" ]]; then
  log_error "NOT YET IMPLEMENTED - cannot setup SSO logins" && exit 1
  log_debug "Update config data for SSO logins"
  cp -a webclient/i2b2_config_domains.json{,.bak} && \
  cat webclient/i2b2_config_domains.json.bak | jq 'del(.lstDomains[] | select(.name=="i2b2 (builtin)"))' > webclient/i2b2_config_domains.json
else
  log_debug "Update config data for local logins - disable SSO logins"
  jqoutput="$(jq 'del(.lstDomains[] | select(.name!="i2b2.org Demo"))' webclient/i2b2_config_domains.json)"
  echo ${jqoutput} > webclient/i2b2_config_domains.json
  jqoutput="$(jq "(.lstDomains[] | select(.name==\"i2b2.org Demo\")).name = \"${i2b2_host_display_name}\"" webclient/i2b2_config_domains.json)"
  echo ${jqoutput} | jq '' > webclient/i2b2_config_domains.json
fi

cd -

if [[ $sso_enabled == "true" ]]; then
  log_error "NOT YET IMPLEMENTED - cannot setup SSO logins" && exit 1
  log_info "Configuring shibboleth and apache for SSO..."
  cp -a /etc/shibboleth/shibboleth2.xml{,_BAK}
  envsubst "\${app_entity_id} \${sso_entity_id} \${handle_ssl} \${admin_email}" < /docker-config/shibboleth/shibboleth2_TEMPLATE.xml > /etc/shibboleth/shibboleth2.xml
  ## No environmental config required
  cp /docker-config/shibboleth/attribute-map.xml /etc/shibboleth/
  ## Check for precence of shibboleth data
  if [[ ! -f "/etc/shibboleth/idp-metadata.xml" ]] ; then
      log_error "Please ensure '/etc/shibboleth/idp-metadata.xml' is provided (perhaps via a docker mount?)"
  fi
  if [[ ! -f "/etc/shibboleth/sp-signing-cert.pem" ]] ; then
      log_error "Please ensure '/etc/shibboleth/sp-signing-cert.pem' is provided (perhaps via a docker mount?)"
  fi
  if [[ ! -f "/etc/shibboleth/sp-signing-key.pem" ]] ; then
      log_error "Please ensure '/etc/shibboleth/sp-signing-key.pem' is provided (perhaps via a docker mount?)"
  fi

  log_info "Starting shibboleth daemon..."
  service shibd start
fi

## Manage plugin availability (if we're showing demo login, just leave all plugins available)
if [[ $show_demo_login == "false" ]]; then
  log_debug "Removing sample/demo plugins"
  removeKey="edu.harvard.catalyst.example"
  jqoutput="$(jq "del(.[] | select(.==\"${removeKey}\"))" webclient/plugins/plugins.json)"
  echo ${jqoutput} | jq '' > webclient/plugins/plugins.json
  ## More complex for a js object in .js file - extract variable, parse as JSON, then replace the updated variable
  jsonPlugins="$(printf '['; awk '/i2b2\.hive\.tempCellsList[[:blank:]]*=/{flag=1;next}/\]\;/{flag=0}flag' webclient/js-i2b2/cells/LEGACYPLUGIN/legacy_plugin/js-i2b2/i2b2_loader.js | sed -re 's/(\S*):/"\1": /' -re 's/forceLoading:/"forceLoading":/' -re 's/params:/"params":/'; printf ']')"
  selectedPlugins="$(echo ${jsonPlugins} | jq 'del(.[] | select(.code as $a | ["WISEsearcher", "CAREcncptDem", "CAREobsTally", "ExportXLS", "ExampComm"] | index($a)))')"
  escaped1=$(printf '%s\n' "${selectedPlugins}" | sed -e 's/[\/&]/\\&/g')
  escapedPlugins=$(echo "${escaped1}" | sed '$!s@$@\\@g')
  sed -i -re "/i2b2.hive.tempCellsList[[:blank:]]*=[[:blank:]]*/,/^[[:blank:]]*\]\;/{s/(i2b2.hive.tempCellsList[[:blank:]]*=[[:blank:]]*).*/\1${escapedPlugins};/p;d}" webclient/js-i2b2/cells/LEGACYPLUGIN/legacy_plugin/js-i2b2/i2b2_loader.js
fi

## Now continue the startup process with the remaining ENTRYPOINT and CMD parameters
log_info "Continuing startup process (with CMD: $@)..."
sleep 0.5 ## Let commands complete (eg a2enmod)
exec "$@"
