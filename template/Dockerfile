FROM maven:3.9.9-eclipse-temurin-21-jammy AS build_img
RUN cd /root/template/2151_winter_gallery && mvn install

FROM tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build_img /root/template/2151_winter_gallery/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]

