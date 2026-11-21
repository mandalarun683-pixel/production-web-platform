# Production Web Platform

A containerized web application deployment platform built using Linux, Docker, Docker Compose, Nginx, Git, and GitHub Actions.

This project demonstrates practical DevOps skills, including containerization, reverse proxy configuration, deployment automation, health monitoring, security hardening, and CI/CD.

## Architecture

```text
             User / Browser
                   |
                   | HTTP :8080
                   v
          Nginx Reverse Proxy
          (production-proxy)
                   |
                   | Internal port 80
                   v
             Web Application
              (production-app)
                   |
                   v
             HTML Web Page
```

## Technologies Used

- **Linux (Ubuntu WSL2):** Development and deployment environment.
- **Docker:** Containerization.
- **Docker Compose:** Multi-container orchestration.
- **Nginx:** Web server and reverse proxy.
- **Git & GitHub:** Version control and source-code hosting.
- **GitHub Actions:** Continuous Integration and deployment pipeline.
- **Docker Hub:** Container image registry.
- **Bash:** Deployment and maintenance automation.

## Project Structure

```text
production-web-platform/
├── .github/
│   └── workflows/
│       └── ci.yml
├── app/
│   └── index.html
├── nginx/
│   └── default.conf
├── scripts/
│   ├── deploy.sh
│   ├── status.sh
│   ├── maintenance.sh
│   └── test-error.sh
├── logs/
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## Application Services

| Service | Purpose | Port |
|---|---|---|
| app | Hosts the web application | 80 |
| nginx | Reverse proxy | 8080 (host) |

The Nginx proxy forwards incoming requests to the application through Docker's internal network.

## Getting Started

### Prerequisites

- Docker Engine or Docker Desktop
- Docker Compose
- Git

### Clone the Repository

```bash
git clone https://github.com/mandalarun683-pixel/production-web-platform.git

cd production-web-platform
```

### Start the Application

```bash
docker compose up -d
```

### Check Container Status

```bash
docker compose ps
```

### Access the Application

Open:

http://localhost:8080

### Stop the Application

```bash
docker compose down
```

## CI/CD Pipeline

GitHub Actions automatically performs the following steps when code is pushed to the `main` branch:

1. Checks out the repository.
2. Builds the Docker image.
3. Starts a test container.
4. Performs an HTTP smoke test.
5. Cleans up the test container.
6. Authenticates with Docker Hub using GitHub Secrets.
7. Publishes the Docker image with `latest` and commit-specific tags.

Pull requests also trigger the build and smoke-test stages.

## Docker Security Hardening

The project implements several container security controls:

- **Drop all capabilities:** Uses `cap_drop: ALL`.
- **Selected capabilities:** Adds `CHOWN`, `NET_BIND_SERVICE`, `SETGID`, and `SETUID`.
- **Privilege escalation protection:** Uses `no-new-privileges:true`.
- **Read-only configuration:** Mounts the Nginx configuration file as read-only.
- **Health checks:** Monitors application and proxy container health.
- **Restart policies:** Uses `unless-stopped` for container recovery.

These controls follow the principle of least privilege.

## Deployment and Monitoring Scripts

| Script | Purpose |
|---|---|
| `deploy.sh` | Pulls the latest image and deploys services |
| `status.sh` | Checks container status and HTTP response |
| `maintenance.sh` | Displays resource usage and recent logs |
| `test-error.sh` | Tests Bash error handling |

## Verification

The deployment was tested using:

```bash
docker compose ps
curl -I http://localhost:8080
docker stats --no-stream
docker compose logs --tail=20
```

The application returned HTTP `200 OK`, and both containers reached a healthy state during verification.

## Skills Demonstrated

- Linux command-line operations
- Bash scripting and error handling
- Git and GitHub workflows
- Docker image creation and management
- Docker Compose orchestration
- Nginx reverse proxy configuration
- Container health checks
- Docker security hardening
- CI/CD with GitHub Actions
- Docker Hub image publishing
- Application deployment and troubleshooting

## Author

**Arun Mandal**

Junior Cloud Specialist | Cloud and DevOps Enthusiast

- GitHub: https://github.com/mandalarun683-pixel
- LinkedIn: https://www.linkedin.com/in/arun-mandal-710a993bb/
