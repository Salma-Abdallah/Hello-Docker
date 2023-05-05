
FROM maven:3-openjdk-17-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package


###

FROM openjdk:17-jdk-alpine AS run
ARG SMT=default_value
ENV SMT=${SMT}
COPY --from=build /home/app/target/*.jar /usr/local/lib/service.jar
WORKDIR /usr/local/lib
ENTRYPOINT ["java", "-jar", "service.jar"]
#ENTRYPOINT java -jar /usr/local/lib/service.jar $SMT
CMD ["${SMT}"]