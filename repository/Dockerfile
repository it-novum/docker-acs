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


## prepate tomcat configuration



## adding JAVA_OPTS settings to /etc/default/tomcat7

## copy alfresco Configuration to /var/lib/tomcat7/shared/classes


## Run additional configuration scripts
RUN /bin/bash /tmp/source_upload/setEnvironment.sh

## cleanup temp files
RUN rm /tmp/source_upload/alfresco-community-distribution-201707.zip


## start tomcat and connect
RUN service tomcat7 start
#