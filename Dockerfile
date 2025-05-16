# Pull a lightweight version of Ubuntu
FROM  maven:3.8.3-openjdk-17 AS base

# Set the working directory in the container
WORKDIR /app

# Copy the user service project files into the container
COPY pom.xml .

COPY src ./src
# Build the project using Maven
RUN mvn clean package -Dmaven.test.skip=true


# New Stage

FROM  maven:3.9.9-eclipse-temurin-21-alpine AS runtime

WORKDIR /app

COPY --from=base /app/target/UserService-0.0.1-SNAPSHOT.jar ./UserService-0.0.1-SNAPSHOT.jar

# Expose the port that the user service will run on
EXPOSE 8081

# Run the user service
CMD ["java", "-jar", "UserService-0.0.1-SNAPSHOT.jar"]