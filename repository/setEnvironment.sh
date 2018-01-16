#!/bin/bash

## Adding JAVA_OPTS
echo 'JAVA_OPTS="-XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -Djava.awt.headless=true -XX:ReservedCodeCacheSize=128m ${JAVA_OPTS}"' >> /etc/default/tomcat7
echo 'JAVA_OPTS=" ${JAVA_OPTS} -Xms512M -Xmx2048M "' >> /etc/default/tomcat7





