# Use a base image with Bash already installed
FROM ubuntu:18.04

# Copy the helloworld.sh script into the container at /app
COPY helloworld.sh /app

# Make the helloworld.sh script executable
RUN chmod +x /app/helloworld.sh

#Expose
EXPOSE 80

# Set the entry point of the container to the helloworld.sh script
CMD ["/app/helloworld.sh"]
