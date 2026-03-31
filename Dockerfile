FROM eclipse-temurin:latest
WORKDIR /app
COPY target/*.jar app.jar

CMD ["sh", "-c", "java -jar app.jar && tail -f /dev/null"]