FROM node:alpine

# Installiere den HTTP-Server
RUN npm install -g http-server

# Kopiere die HTML-Dateien ins Verzeichnis /frontend
COPY ./frontend /frontend

# Setze das Arbeitsverzeichnis
WORKDIR /frontend

# Expose Port 10100
EXPOSE 10100

# Starte den HTTP-Server auf Port 10100
CMD ["http-server", "-p", "10100"]
