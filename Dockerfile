# Use OpenJDK as base image
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/hello-ecommerce.jar hello-ecommerce.jar

# Expose port 8080 for application
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "hello-ecommerce.jar"]
