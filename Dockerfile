FROM maven
WORKDIR /work
COPY . .
RUN mvn clean package

FROM tomcat
WORKDIR /app
COPY --from=0 /work/target/*.war /usr/local/tomcat/webapps/

