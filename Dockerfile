FROM maven
WORKDIR /work
COPY . .
RUN mvn clean package

FROM openjdk 
WORKDIR /app
COPY --from=0 /work/target/*.jar .
CMD [ "java","-jar","app.jar" ]