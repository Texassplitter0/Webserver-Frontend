FROM node:alpine

# Entfernt /docker-entrypoint und nginx überbleibsel
RUN rm -rf /docker-entrypoint.d/ /etc/nginx/

# Installiere den HTTP-Server
RUN npm install -g http-server

# Kopiere die HTML-Dateien ins Verzeichnis /frontend
COPY ./frontend /frontend

# Setze das Arbeitsverzeichnis
WORKDIR /frontend

# Setze Berechtigungen für das /frontend-Verzeichnis
RUN chmod -R 755 /frontend && chown -R node:node /frontend

# Expose Port 10100
EXPOSE 10100

# Starte den HTTP-Server auf Port 10100
CMD ["sh", "-c", "find / -name '*.html' && http-server -p 10100"]

