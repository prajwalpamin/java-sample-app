FROM maven:3.8-openjdk-11-slim AS build

WORKDIR /app

COPY ./pom.xml ./pom.xml

COPY ./src ./src

RUN mvn clean install


FROM openjdk:11-jre-slim

WORKDIR /app

COPY --from=build /app/target/spring-boot-2-hello-world-1.0.2-SNAPSHOT ./app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
