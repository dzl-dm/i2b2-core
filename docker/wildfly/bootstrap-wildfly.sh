#!/usr/bin/env bash
## Bootstrap will check for and load docker secrets, then specific processing for the container purpose
## such as setting configuration based on environment variables 

set -e

df="[%Y-%m-%d %H:%M:%S]"

echo >&2 "$(date +"$df") INFO: Bootstrapping container..."
## Import the secrets as env vars
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

echo -e "$(date +"$df") INFO: Processing secrets..."
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

echo >&2 "$(date +"$df") INFO: Configuring standalone wildfly config for i2b2..."
cp -a /opt/jboss/wildfly/standalone/configuration/standalone.xml{,_ORIG}
envsubst "\${wildfly_log_level} \${i2b2_database_host} \${ajp_secret}" < /docker-config/standalone_TEMPLATE.xml > /opt/jboss/wildfly/standalone/configuration/standalone.xml


echo >&2 "$(date +"$df") INFO: Starting wildfly server..."
echo >&2 "$(date +"$df") INFO: Continuing startup process (with CMD: $@)..."
## Now call the original/upstream entrypoint and append arguments
exec $@
