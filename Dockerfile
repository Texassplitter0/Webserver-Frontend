FROM nginx:alpine

# Berechtigungen erteilen
RUN chmod -R 755 /frontend && chown -R nginx:nginx /frontend

# Kopiere die HTML-Dateien ins Standardverzeichnis von Nginx
COPY ./frontend /frontend
COPY ./nginx.conf /app/nginx/nginx.conf

# Standard-Port für Nginx
EXPOSE 80

# Starte den Nginx-Server
CMD ["nginx", "-g", "daemon off;"]
