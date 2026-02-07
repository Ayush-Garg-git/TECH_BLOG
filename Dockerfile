# ---------- Build stage ----------
FROM maven:3.9.6-eclipse-temurin-11 AS builder

WORKDIR /app
COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

# ---------- Run stage ----------
FROM tomcat:9.0-jdk11

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
