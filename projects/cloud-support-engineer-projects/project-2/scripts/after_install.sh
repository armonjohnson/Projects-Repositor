#!/bin/bash
set -e

WEB_ROOT="/usr/share/nginx/html"

rm -rf "$WEB_ROOT"/*

if [ -d /opt/app/frontend/build ]; then
  cp -R /opt/app/frontend/build/* "$WEB_ROOT"/
elif [ -d /opt/app/frontend ]; then
  cp -R /opt/app/frontend/* "$WEB_ROOT"/
else
  echo "ERROR: /opt/app/frontend not found. Listing /opt/app:"
  ls -la /opt/app || true
  exit 1
fi

systemctl restart nginx
