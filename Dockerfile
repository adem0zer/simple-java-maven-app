FROM eclipse-temurin:latest
EXPOSE 8092
COPY target/my-app-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]