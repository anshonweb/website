# Use Alpine as base image
FROM alpine:latest

# Install Hugo and Nginx
RUN apk add --update --no-cache hugo nginx

# Set working directory
WORKDIR /app

# Copy Hugo project files
COPY . .

# Build the Hugo site
RUN hugo --minify

# Configure Nginx
COPY nginx.conf /etc/nginx/http.d/default.conf

# Remove default nginx welcome page
RUN rm -rf /var/www/localhost/htdocs/*

# Copy built site to Nginx serve directory
RUN cp -r /app/public/* /var/www/localhost/htdocs/

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]