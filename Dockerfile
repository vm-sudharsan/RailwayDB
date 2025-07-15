# ✅ Build Stage with Maven + JDK 21
FROM maven:3.9.4-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# ✅ Run Stage with JDK 21
FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar springbootfirst.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "springbootfirst.jar"]
