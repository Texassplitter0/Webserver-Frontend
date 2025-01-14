
# Use an official nginx image to serve static files
FROM nginx:alpine

# Copy custom nginx configuration
COPY frontend/nginx.conf /etc/nginx/nginx.conf

# Copy frontend files
COPY frontend/ /usr/share/nginx/html/
