@ECHO off
SETLOCAL
SET SONAR_SERVER=%1

IF [%SONAR_SERVER%] == [] (
    echo Sonar server must be provided!
    exit /b
)

CALL mvnw.cmd install -DskipTests
CALL mvnw.cmd org.sonarsource.scanner.maven:sonar-maven-plugin:3.2:sonar -Dsonar.host.url="%SONAR_SERVER%" -Dsonar.scm.disabled=true -Dsonar.projectName=apache-hive
