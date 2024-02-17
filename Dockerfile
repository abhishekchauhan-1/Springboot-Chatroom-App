FROM maven:3.8.4-openjdk-17 AS builder

WORKDIR /app
COPY . .
RUN mvn clean install

FROM openjdk:17

COPY --from=builder /app/target/ChatRoom-App.jar /ChatRoom-App.jar

ENTRYPOINT ["java", "-jar", "/ChatRoom-App.jar"]

EXPOSE 8080
