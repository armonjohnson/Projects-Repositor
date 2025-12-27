#!/bin/bash
set -e

# make sure hook scripts can run
chmod +x projects/cloud-support-engineer-projects/project-2/scripts/*.sh || true

# install nginx only if missing
if ! command -v nginx >/dev/null 2>&1; then
  yum install -y nginx
fi

systemctl enable nginx
systemctl restart nginx

mkdir -p /opt/app
