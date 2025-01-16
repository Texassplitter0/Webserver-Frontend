# Static Webserver in Docker

This project provides a simple static web server running in a Docker container using Nginx. It serves HTML files from the `/frontend` directory.

## Project Structure
```
static-webserver/
├── frontend/                # Directory containing HTML files
│   ├── index.html       # Home page
│   └── about.html       # Example secondary page
├── nginx.conf           # Nginx configuration file
├── Dockerfile           # Dockerfile to build the Nginx image
├── docker-compose.yml   # Docker Compose configuration
└── README.md            # This documentation file
```

## Prerequisites
- Docker installed on your machine.
- Docker Compose installed (optional, but recommended).

## Setup Instructions

### 1. Clone the Repository
Clone or download this repository to your local machine.

### 2. Add Your HTML Files
Place your HTML files in the `html/` directory. Ensure there is an `index.html` file as the entry point.

### 3. Update Configuration (Optional)
If necessary, modify the `nginx.conf` file to customize the server configuration.

### 4. Build and Run the Docker Container

#### Using Docker Only
1. Build the Docker image:
   ```bash
   docker build -t static-webserver .
   ```
2. Run the container:
   ```bash
   docker run -d -p 10100:80 --name webserver static-webserver
   ```

#### Using Docker Compose
1. Start the server:
   ```bash
   docker-compose up -d
   ```

### 5. Access the Webserver
Open a browser and go to:
```
http://localhost:10100
```

## File Locations in the Container
- HTML files: `/frontend`
- Nginx configuration: `/app/nginx/nginx.conf`

## Customization
### Changing the Root Directory
To use a different directory for your HTML files, update the `root` directive in `nginx.conf` and the `volumes` section in `docker-compose.yml`.

### Adding Error Pages
To add a custom 404 error page, place a `404.html` file in the `html/` directory.

## Stopping and Removing the Container
1. Stop the container:
   ```bash
   docker-compose down
   ```
2. Remove the container:
   ```bash
   docker rm -f webserver
   ```

## License
This project is available under the MIT License. Feel free to use and adapt it for your needs.

