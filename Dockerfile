FROM maven:3.8.6-eclipse-temurin-8-alpine as build
RUN apk add git && \
    git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR boxfuse-sample-java-war-hello
RUN mvn package
#
# run tomcat
FROM tomcat:9.0.20-jre8-alpine
COPY --from=build /boxfuse-sample-java-war-hello/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080