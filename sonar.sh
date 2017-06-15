#!/bin/bash

declare -r SONAR_SERVER="${1}"

if [[ -z "${SONAR_SERVER}" ]]; then
    echo "Sonar server must be provided!"
    exit 1
fi

./mvnw install -DskipTests
./mvnw org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar -Dsonar.host.url=${SONAR_SERVER} -Dsonar.scm.disabled=true -Dsonar.projectName=apache-hive

