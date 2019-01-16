#!/usr/bin/env bash

set -e

if [ "${1:0:1}" != '-' ]; then
  exec "$@"
fi

# Parse Docker env vars to customize SonarQube
#
# e.g. Setting the env var sonar.jdbc.username=foo
#
# will cause SonarQube to be invoked with -Dsonar.jdbc.username=foo

declare -a sq_opts

while IFS='=' read -r envvar_key envvar_value
do
    if [[ "$envvar_key" =~ sonar.* ]]; then
        sq_opts+=("-D${envvar_key}=${envvar_value}")
    fi
done < <(env)

exec java -jar lib/sonar-application-$SONAR_VERSION.jar \
  -Dsonar.log.console=true \
  -Dsonar.jdbc.username="sonar" \
  -Dsonar.jdbc.password="sonar.abcd.1234" \
  -Dsonar.jdbc.url="jdbc:mysql://mysql01.ucex.corp:3306/sonar?useUnicode=true&characterEncoding=utf8&rewriteBatchedStatements=true&useConfigs=maxPerformance&useSSL=false" \
  -Dsonar.web.javaAdditionalOpts="$SONARQUBE_WEB_JVM_OPTS -Djava.security.egd=file:/dev/./urandom" \
  "${sq_opts[@]}" \
  "$@"

