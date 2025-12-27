#!/bin/bash
set -e

WEBROOT="/usr/share/nginx/html"
APPROOT="/home/ec2-user/app"

echo "Deploying build to nginx web root..."

# Wipe current site
sudo rm -rf ${WEBROOT:?}/*

# Copy React build output
if [ -d "$APPROOT/build" ]; then
  sudo cp -r "$APPROOT/build/"* "$WEBROOT/"
else
  echo "ERROR: $APPROOT/build does not exist. Build step didn't create it."
  exit 1
fi

# Fix perms so nginx can read
sudo chown -R nginx:nginx "$WEBROOT"
sudo chmod -R 755 "$WEBROOT"

# Restart nginx
sudo systemctl restart nginx

echo "Done."
