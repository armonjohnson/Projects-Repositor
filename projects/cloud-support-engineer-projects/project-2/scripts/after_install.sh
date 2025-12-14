#!/bin/bash
set -e

rm -rf /usr/share/nginx/html/*
cp -r /opt/app/build/* /usr/share/nginx/html/
systemctl restart nginx
