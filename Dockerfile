# Use the official Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages including tmate
RUN apt-get update && apt-get install -y \
    tmate \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Default command to run tmate
CMD ["tmate"]
