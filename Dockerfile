# Pull a lightweight version of Ubuntu
FROM maven:3.8.6-openjdk-17-slim AS base

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the user service project files into the container
COPY . /usr/src/app

# Build the project using Maven
RUN mvn clean package -Dmaven.test.skip=true

# Expose the port that the user service will run on
EXPOSE 8081

# Run the user service
CMD ["java", "-jar", "target/UserService-0.0.1-SNAPSHOT.jar"]