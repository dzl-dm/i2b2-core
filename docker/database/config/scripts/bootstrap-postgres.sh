#!/usr/bin/env bash
## Import the secrets as env vars and check database status, then call upstream docker-entrypoint.sh

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
    echo >&2 "$(date +"$df") ERROR: both $var and $fileVar are set (but are exclusive)"
    exit 1
  fi
  local val="$def"
  if [ "${!var:-}" ]; then
    val="${!var}"
  elif [ "${!fileVar:-}" ]; then
    val="$(< "${!fileVar}")"
  fi
  echo >&2 "$(date +"$df") INFO: exporting ${var}=${val}"
  ## The scope of this export is only this script (but this is what runs the container, so generally its enough)
  export "${var}"="${val}"
  ## Put the variables into the profile so a new shell will also have them
  if test -f "/etc/profile.d/docker.sh"; then
    sed -i "/export ${var}=/d" /etc/profile.d/docker.sh
  fi
  echo -e "export ${var}=${val}" >> /etc/profile.d/docker.sh
  unset "$fileVar"
}

echo -e >&2 "$(date +"$df") INFO: Processing secrets..."
if test -f /run/secrets/ENV_MULTILOAD; then
    echo >&2 -e "Loading ENV_MULTILOAD secrets..."
    source /run/secrets/ENV_MULTILOAD
fi
while read secret_env; do
  secret_var=$(echo ${secret_env} | cut -d= -f 1)
  file_env ${secret_var:0:-5};
done < <(env | grep '_FILE=')
echo >&2 "$(date +"$df") INFO: ...secrets complete"

## Run check-db script in the background.
## It will wait for the database to start, check for a database named "i2b2" and run the init-database script if needed
/bin/bash -c '/docker-entrypoint/check-db.sh' &

## Now call the original/upstream entrypoint and append arguments
echo -e >&2 "$(date +"$df") INFO: Starting postgres server as per upstream image..."
exec $@
