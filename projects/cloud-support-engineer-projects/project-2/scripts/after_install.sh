#!/bin/bash
set -e

WEB_ROOT="/usr/share/nginx/html"
SRC="/opt/app/frontend/build"

echo "Copying $SRC to $WEB_ROOT"

rm -rf "$WEB_ROOT"/*
cp -R "$SRC"/* "$WEB_ROOT"/

systemctl restart nginx
