FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY target/demo-0.0.1-SNAPSHOT.war app.war

EXPOSE 9000

ENTRYPOINT ["java","-jar","app.war","--server.port=9000"]
