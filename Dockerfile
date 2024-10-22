# Use the official Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Install tmate and a lightweight HTTP server (Nginx)
RUN apt-get update && \
    apt-get install -y tmate nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create directory for serving the HTML page
RUN mkdir -p /var/www/html

# Replace the default Nginx config with a basic one
RUN echo 'server { listen 80; location / { root /var/www/html; try_files $uri $uri/ =404; } }' > /etc/nginx/sites-available/default

# Expose port 80 for the web server
EXPOSE 80

# Create a script to start tmate and nginx
RUN echo '#!/bin/bash\n\
tmate -F | tee /var/www/html/index.html &\n\
nginx -g "daemon off;" &\n\

# Start the script
CMD ["/start.sh"]
