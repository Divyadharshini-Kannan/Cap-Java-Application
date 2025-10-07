FROM maven
WORKDIR /work
COPY . .
RUN mvn clean package

FROM openjdk 
WORKDIR /app
COPY target/*.jar ./
CMD [ "java","-jar","app.jar" ]