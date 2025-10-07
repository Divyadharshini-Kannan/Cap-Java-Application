FROM maven
WORKDIR /work
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM tomcat:10.1.46
COPY --from=0 /work/target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]
