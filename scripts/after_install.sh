#!/bin/bash
set -e

rm -rf /usr/share/nginx/html/*
cp -r /opt/app/frontend/* /usr/share/nginx/html/
systemctl restart nginx
