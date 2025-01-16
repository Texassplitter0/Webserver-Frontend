FROM nginx:alpine

# Kopiere die HTML-Dateien ins Standardverzeichnis von Nginx
COPY ./frontend /frontend
COPY ./nginx.conf /etc/nginx/nginx.conf

# Standard-Port für Nginx
EXPOSE 80

# Starte den Nginx-Server
CMD ["nginx", "-g", "daemon off;"]
