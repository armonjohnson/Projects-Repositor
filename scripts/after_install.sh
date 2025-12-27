#!/bin/bash

# Copy deployed app to nginx web root
sudo rm -rf /usr/share/nginx/html/*
sudo cp -r /home/ec2-user/app/* /usr/share/nginx/html/

# Fix permissions
sudo chown -R nginx:nginx /usr/share/nginx/html
sudo chmod -R 755 /usr/share/nginx/html

# Restart nginx
sudo systemctl restart nginx

exit 0
