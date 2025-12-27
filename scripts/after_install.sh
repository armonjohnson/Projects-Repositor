#!/bin/bash
set -e

APP_DIR="/home/ec2-user/app"

# Find the React/Vite build output (common paths)
BUILD_DIR=$(find "$APP_DIR" -type d \( -path "*/frontend/build" -o -path "*/build" -o -path "*/dist" \) 2>/dev/null | head -n 1)

echo "Using build directory: $BUILD_DIR"

if [ -z "$BUILD_DIR" ]; then
  echo "❌ Could not find a build/dist folder inside $APP_DIR"
  echo "Run: find /home/ec2-user/app -maxdepth 6 -type d -name build -o -name dist"
  exit 1
fi

# Clear nginx web root and copy ONLY the built site
sudo rm -rf /usr/share/nginx/html/*
sudo cp -r "$BUILD_DIR"/* /usr/share/nginx/html/

# Permissions
sudo chmod -R 755 /usr/share/nginx/html

# Restart nginx
sudo systemctl restart nginx

echo "✅ Deployed site to Nginx web root"
exit 0
