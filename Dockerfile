# Use the official Hugo image to build the site
FROM klakegg/hugo:latest AS build

WORKDIR /src
COPY . .
RUN hugo

# Use a minimal web server to serve the generated files
FROM nginx:alpine

# Copy the generated site from the Hugo build step
COPY --from=build /src/public /usr/share/nginx/html

# Expose port 80 for Railway
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
