# Use the official Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update and install tmate in one step
RUN apt-get update && \
    apt-get install -y tmate && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Start tmate session and output session info
CMD tmate -F > /var/log/tmate.log 2>&1 && tail -f /var/log/tmate.log
