FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /usr/src/myapp
COPY . .
RUN mvn clean package

FROM openjdk:17.0.2
WORKDIR /usr/src/myapp
COPY --from=build /usr/src/myapp/target/*.jar ./app.jar
CMD ["java", "-jar", "app.jar"]
