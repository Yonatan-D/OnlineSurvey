#!/bin/bash
nginx
if test -z "${MYSQL_PORT}";then
    export MYSQL_PORT=3306
fi
java -jar onlinesurvey-v1.0.0.jar --spring-config-location=application.properties