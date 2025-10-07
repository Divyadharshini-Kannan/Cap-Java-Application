FROM maven
WORKDIR /work
COPY . .
RUN mvn clean package

FROM openjdk 
WORKDIR /app
COPY --from=0 /work/target/*.jar ./app.jar
CMD [ "java","-jar","app.jar" ]