FROM tomcat:10.0

# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR as ROOT
COPY target/sampleDemo.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]

 

