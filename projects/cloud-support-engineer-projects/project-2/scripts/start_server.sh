#!/bin/bash
set -e

# serve the static site from /var/www/html
# Amazon Linux nginx default docroot is /usr/share/nginx/html, so point it to /var/www/html
cat > /etc/nginx/conf.d/default.conf <<'EOF'
server {
  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;
  index index.html;

  location / {
    try_files $uri $uri/ =404;
  }
}
EOF

nginx -t
systemctl enable nginx
systemctl restart nginx
