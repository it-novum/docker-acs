#!/bin/bash

## Adding JAVA_OPTS
echo 'JAVA_OPTS="-XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -Djava.awt.headless=true -XX:ReservedCodeCacheSize=128m ${JAVA_OPTS}"' >> /etc/default/tomcat7
echo 'JAVA_OPTS=" ${JAVA_OPTS} -Xms512M -Xmx2048M "' >> /etc/default/tomcat7

sed -i 's/^shared.loader=.*/shared.loader=${catalina.home}\/shared\/classes,${catalina.home}\/shared\/*.jar,${catalina.base}\/shared\/classes/' /etc/tomcat7/catalina.properties