#!/bin/bash
set -e

WEB_ROOT="/usr/share/nginx/html"
SRC="/var/www/html"

echo "Copying from $SRC to $WEB_ROOT"
ls -la "$SRC"

rm -rf "$WEB_ROOT"/*
cp -r "$SRC"/* "$WEB_ROOT"/
systemctl restart nginx
