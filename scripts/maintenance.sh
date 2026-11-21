#!/bin/bash

set -e

cd "$(dirname "$0")/.."

echo "=================================="
echo " Production Web Platform Maintenance"
echo "=================================="

echo ""
echo "1. Docker Resource Usage"
docker stats --no-stream

echo ""
echo "2. Recent Application Logs"
docker compose logs --tail=20 app

echo ""
echo "3. Recent Nginx Logs"
docker compose logs --tail=20 nginx

echo ""
echo "Maintenance check completed."
