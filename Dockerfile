# Base image
FROM node:alpine

# Remove unnecessary files
RUN rm -rf /docker-entrypoint.d/ /etc/nginx/

# Install HTTP-Server
RUN npm install -g http-server

# Copy frontend files
COPY ./frontend /frontend

# Add SSL certificates
COPY ./certs /certs

# Set working directory
WORKDIR /frontend

# Set permissions
RUN chmod -R 755 /frontend && chown -R node:node /frontend

# Expose port for HTTPS
EXPOSE 10100

# Start HTTP-Server with HTTPS enabled
CMD ["http-server", "-S", "-C", "/certs/cert.pem", "-K", "/certs/key.pem", "-p", "10100"]s
