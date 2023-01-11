FROM maven:3.6.3-jdk-11-slim AS build
RUN mvn -B -f pom.xml clean package -DskipTests

FROM openjdk:11-jdk-slim
COPY --from=/target/*.jar demowar2.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","demowar2.war"]
