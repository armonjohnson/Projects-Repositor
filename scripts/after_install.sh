#!/bin/bash
set -e

WEB_DIR="/home/ec2-user/app/projects/cloud-support-engineer-projects/project-3/globalmart-catalog/build"

sudo rm -rf /usr/share/nginx/html/*
sudo cp -r "$WEB_DIR"/* /usr/share/nginx/html/

sudo chown -R nginx:nginx /usr/share/nginx/html
sudo chmod -R 755 /usr/share/nginx/html

sudo systemctl restart nginx
