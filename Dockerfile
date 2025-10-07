FROM maven
WORKDIR /work
COPY . .
RUN mvn clean package

FROM tomcat:10.1
COPY --from=0 /work/target/*.war /usr/local/tomcat/webapps/


