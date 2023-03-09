FROM openjdk:8-jdk-slim
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.73.tar.gz
RUN mv apache-tomcat-9.0.73/* /opt/tomcat
RUN rm -rf apache-tomcat-9.0.73.tar.gz apache-tomcat-9.0.73
COPY ./poc-0.0.1-SNAPSHOT.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
