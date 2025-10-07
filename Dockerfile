FROM maven
WORKDIR /work
COPY . .
RUN mvn clean package

FROM openjdk 
WORKDIR /app
COPY --from=builder /build/target/*.jar ./app.jar
CMD [ "java","-jar","app.jar" ]