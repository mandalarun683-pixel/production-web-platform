#!/bin/bash

set -e

cd "$(dirname "$0")/.."

echo "=================================="
echo " Production Web Platform Status"
echo "=================================="

echo ""
echo "Checking Docker containers..."

docker compose ps

echo ""
echo "Checking application HTTP response..."

if curl --fail --silent http://localhost:8080/ > /dev/null; then
    echo "SUCCESS: Application is responding."
else
    echo "ERROR: Application is not responding."
    exit 1
fi

echo ""
echo "Status check completed."
