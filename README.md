# Node.js Static Webserver in Docker

Dieses Projekt stellt einen einfachen statischen Webserver bereit, der HTML-Dateien mit Node.js und dem Paket `http-server` bedient. Der Webserver läuft in einem Docker-Container und nutzt den Port **10100**.

## Projektstruktur
```
static-webserver/
├── frontend/           # Ordner mit HTML-Dateien
├── Dockerfile          # Dockerfile für den Node.js-Webserver
├── docker-compose.yml  # Docker Compose Konfigurationsdatei
├── README.md           # Diese Dokumentation
```

## Voraussetzungen
- **Docker** installiert
- **Docker Compose** installiert (optional, für die Nutzung der `docker-compose.yml`)

## Anleitung

### 1. HTML-Dateien vorbereiten
Füge deine HTML-Dateien und andere statischen Inhalte (z. B. CSS, Bilder) in den Ordner `frontend/` ein. Stelle sicher, dass mindestens eine `index.html` vorhanden ist.

### 2. Docker-Image erstellen
Baue das Docker-Image mit folgendem Befehl:
```bash
docker build -t node-static-server .
```

### 3. Container starten

#### Mit Docker direkt
Starte den Container:
```bash
docker run -d -p 10100:10100 --name static-webserver node-static-server
```

#### Mit Docker Compose
Starte den Webserver über Docker Compose:
```bash
docker-compose up -d
```

### 4. Zugriff auf die Website
Öffne deinen Browser und gehe zu:
```
http://localhost:10100
```

## Konfiguration

### Port ändern
Um den Port zu ändern, bearbeite die folgenden Dateien:
- In der `Dockerfile` ändere den Port im Befehl:
  ```dockerfile
  CMD ["http-server", "-p", "10100"]
  ```
- In der `docker-compose.yml` aktualisiere den `ports`-Abschnitt:
  ```yaml
  ports:
    - "NEUER_PORT:10100"
  ```

### Volumes
Wenn du deine Dateien außerhalb des Containers live bearbeiten möchtest, überprüfe den `volumes`-Eintrag in der `docker-compose.yml`. Hierdurch wird der Ordner `frontend/` direkt eingebunden.

## Container stoppen
Um den Webserver zu stoppen, verwende:

#### Mit Docker direkt
```bash
docker stop static-webserver
```

#### Mit Docker Compose
```bash
docker-compose down
```

## Fehlerbehebung

### Keine Inhalte angezeigt
- Stelle sicher, dass sich eine `index.html` im Ordner `frontend/` befindet.
- Überprüfe die Berechtigungen des Ordners `frontend/` und setze sie gegebenenfalls:
  ```bash
  chmod -R 755 frontend
  ```

### Port wird bereits verwendet
Ändere den Host-Port in der `docker-compose.yml` oder beim Startbefehl:
```bash
docker run -d -p NEUER_PORT:10100 --name static-webserver node-static-server
```

## Lizenz
Dieses Projekt steht unter der MIT-Lizenz. Du kannst es frei verwenden, anpassen und teilen.

