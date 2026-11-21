#!/bin/bash
set -e
trap 'echo "ERROR: Deployment failed at $(date "+%Y-%m-%d %H:%M:%S")"' ERR
LOG_FILE="logs/deploy.log"

mkdir -p logs

exec > >(tee -a "$LOG_FILE") 2>&1
# Production Web Platform Deployment Script

echo "=================================="
echo " Production Web Platform Deploy"
echo "=================================="

echo "Deployment started at: $(date '+%Y-%m-%d %H:%M:%S')"

docker compose pull

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to pull Docker images."
    exit 1
fi

docker compose up -d --wait --wait-timeout 60

if [ $? -ne 0 ]; then
    echo "ERROR: Deployment failed."
    exit 1
fi

echo "Deployment command completed successfully."


echo "Checking application health..."
echo "Deployment finished at: $(date '+%Y-%m-%d %H:%M:%S')"

docker compose ps
