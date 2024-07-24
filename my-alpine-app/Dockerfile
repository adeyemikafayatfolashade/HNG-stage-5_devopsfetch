# Use the official Alpine Linux image as the base image
FROM alpine:latest

# Set the maintainer label
LABEL maintainer="adeyemikafayat64@gmail.com"

# Update the package index and install curl
RUN apk update && \
    apk add --no-cache curl

# Set the working directory
WORKDIR /app

# Copy the local files to the container
COPY . .

# Execute a simple command
CMD ["sh"]
