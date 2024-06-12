# Use the AdoptOpenJDK base image with OpenJDK 8
FROM adoptopenjdk/openjdk8

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the target directory of your Maven build to the /app directory in the container
COPY target/*.jar /app/helloworld-1.1.jar
#expose 8080
EXPOSE  8080

# Command to run the application
CMD ["java", "-cp", "/app/helloworld-1.1.jar", "com.coveros.demo.helloworld.HelloWorld"]

