# Docker multi-stage build

# 1. Building the App with Maven and Temurin 17
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /springbootvuejs
COPY . .

# Run Maven build (skip tests for faster container build)
RUN mvn clean install -DskipTests

# 2. Lightweight Temurin JRE runtime image (with patched Linux cgroups v2 support)
FROM eclipse-temurin:17-jre-jammy

LABEL maintainer="Jonas Hecht"

VOLUME /tmp

# Add Spring Boot app.jar to Container
COPY --from=build /springbootvuejs/backend/target/backend-*.jar app.jar

ENV JAVA_OPTS=""

# Fire up our Spring Boot app by default
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
