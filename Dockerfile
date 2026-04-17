FROM openjdk:17
WORKDIR /app
COPY target/sampleDemo.jar app.jar
EXPOSE 8080
ENTRYPOINT("java","-jar","app.jar")
