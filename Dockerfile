FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar", "--spring.datasource.url=jdbc:mariadb://localhost:3306/task", "--spring.datasource.username=root", "--spring.datasource.password=password", "--spring.datasource.driverClassName=org.mariadb.jdbc.Driver"]
