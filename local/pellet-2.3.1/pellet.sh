#!/bin/sh

if [ -n "${JAVA_HOME}" -a -x "${JAVA_HOME}/bin/java" ]; then
  java="${JAVA_HOME}/bin/java"
else
  java=java
fi

if [ -z "${pellet_java_args}" ]; then
  pellet_java_args="-Xmx512m"
fi

exec ${java} ${pellet_java_args} -jar lib/pellet-cli.jar "$@"
