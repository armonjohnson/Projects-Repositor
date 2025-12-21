#!/bin/bash
set -e

echo "AfterInstall started"

# Move to the directory where CodeDeploy unpacked the artifact
cd /opt/codedeploy-agent/deployment-root/*/*/deployment-archive/project-2

# Ensure nginx web root exists
mkdir -p /var/www/html

# Copy built frontend files
cp -r frontend/build/* /var/www/html/

# Fix permissions
chmod -R 755 /var/www/html

echo "AfterInstall completed successfully"
