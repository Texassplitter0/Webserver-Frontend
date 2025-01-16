# Use an official nginx image to serve static files
FROM nginx:alpine

# Copy custom nginx configuration to the correct location
COPY nginx.conf /etc/nginx/nginx.conf

# Copy frontend files to the default nginx HTML directory
COPY frontend/ /usr/share/nginx/html/

# Ensure correct permissions for static files
RUN chmod -R 755 /usr/share/nginx/html/

# (Optional) Add a health check
HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost/ || exit 1
