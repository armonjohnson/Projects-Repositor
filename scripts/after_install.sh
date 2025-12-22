#!/bin/bash
set -e

rm -rf /usr/share/nginx/html/*
cp -r * /usr/share/nginx/html/
systemctl restart nginx
