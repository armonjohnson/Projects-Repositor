#!/bin/bash
set -e

# folder where this script lives: .../project-2/scripts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# project root: .../project-2
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Nginx web root (adjust if yours is different)
WEB_ROOT="/usr/share/nginx/html"

echo "PROJECT_ROOT=$PROJECT_ROOT"
echo "Copying build to $WEB_ROOT"

sudo rm -rf "$WEB_ROOT"/*
sudo cp -R "$PROJECT_ROOT/frontend/build/"* "$WEB_ROOT/"

sudo systemctl restart nginx
