FROM ubuntu
MAINTAINER it-novum
RUN apt-get update 
RUN apt-get install wget -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install tomcat7 -y
RUN apt-get install htop -y
RUN apt-get install vim -y
RUN apt-get install less -y
RUN apt-get install unzip -y

## Copy Alfresco Sources
RUN mkdir -p /tmp/source_upload
COPY alfresco-community-distribution-201707.zip /tmp/source_upload
RUN unzip /tmp/source_upload/alfresco-community-distribution-201707.zip -d /tmp/source_upload/alfresco_extracted

## Copy Alfresco configuration files
COPY assets/shared/classes/* /var/lib/tomcat7/shared/classes/
RUN chown -R tomcat7:tomcat7 /var/lib/tomcat7/shared/classes/*

## Copy additional configuration shell scripts
COPY setEnvironment.sh /tmp/source_upload
RUN chmod +x /tmp/source_upload/setEnvironment.sh

## make sure tomcat is stopped before doing configuration
RUN  service tomcat7 stop

## Remove existing ROOT Webapps from tomcat
RUN rm -rf /var/lib/tomcat7/webapps/ROOT

## copy war files to /var/lib/tomcat/webapps
RUN cp /tmp/source_upload/alfresco_extracted/alfresco-community-distribution-201707/web-server/webapps/alfresco.war /var/lib/tomcat7/webapps
RUN cp /tmp/source_upload/alfresco_extracted/alfresco-community-distribution-201707/web-server/webapps/share.war /var/lib/tomcat7/webapps
RUN cp /tmp/source_upload/alfresco_extracted/alfresco-community-distribution-201707/web-server/webapps/ROOT.war /var/lib/tomcat7/webapps

## setting permissions to tomcat user
RUN chown tomcat7:tomcat7 /var/lib/tomcat7/webapps/alfresco.war
RUN chown tomcat7:tomcat7 /var/lib/tomcat7/webapps/share.war
RUN chown tomcat7:tomcat7 /var/lib/tomcat7/webapps/ROOT.war


## Copy alf_data directory
RUN mkdir /srv/alfresco
RUN cp -R /tmp/source_upload/alfresco_extracted/alfresco-community-distribution-201707/alf_data /srv/alfresco
RUN chown -R tomcat7:tomcat7 /srv/alfresco/alf_data

## Copy postgres JDBC library (ToDo: make dynamically)
RUN cp /tmp/source_upload/alfresco_extracted/alfresco-community-distribution-201707/web-server/lib/*.jar /usr/share/tomcat7/lib


## prepate tomcat configuration



## adding JAVA_OPTS settings to /etc/default/tomcat7

## copy alfresco Configuration to /var/lib/tomcat7/shared/classes


## Run additional configuration scripts
RUN /bin/bash /tmp/source_upload/setEnvironment.sh

## cleanup temp files
RUN rm /tmp/source_upload/alfresco-community-distribution-201707.zip




CMD [ "/usr/share/tomcat7/bin/catalina.sh", "run"]