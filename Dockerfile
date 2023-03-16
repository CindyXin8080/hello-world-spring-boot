# Use the official OpenJDK image as the base image
FROM openjdk:11-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven pom.xml file into the working directory
COPY pom.xml .

# Download project dependencies (this step is optional but improves build times by caching dependencies)
RUN apt-get update && \
    apt-get install -y maven && \
    mvn dependency:go-offline -B

# Copy the rest of the application source code into the working directory
COPY src src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Set the entry point to start the application using the built JAR file
ENTRYPOINT ["java", "-jar", "target/hello-world-0.0.1-SNAPSHOT.jar"]
