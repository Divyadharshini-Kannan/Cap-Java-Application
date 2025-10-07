FROM maven
WORKDIR /work
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM tomcat:10.1.46
COPY --from=0 /work/target/*.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
