FROM maven:3.8.3-openjdk-22 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:22-jdk-slim
COPY --from=build /target/EstoqueAPI-0.0.1-SNAPSHOT app.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "app.jar" ]