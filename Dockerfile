FROM openjdk:17
WORKDIR /app
COPY target/sampleDemo-0.0.1-SNAPSHOT.war app.war
EXPOSE 8081
ENTRYPOINT ["java","-jar","app.war"]
