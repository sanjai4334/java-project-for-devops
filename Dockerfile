# Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY . bookmydr-0.0.1-SNAPSHOT.jar

# Expose port 8080 for application
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "bookmydr-0.0.1-SNAPSHOT.jar"]
