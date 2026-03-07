FROM maven:3.9.9-eclipse-temurin-21-jammy AS build_img
RUN git clone https://github.com/venkatchaitu14/build.git
RUN cd build && mvn clean install -DskipTests

FROM tomcat:10-jdk21
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build_img build/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]