#!/bin/bash
set -e

yum clean all
yum makecache fast

if ! systemctl is-active --quiet nginx; then
  yum install -y nginx
  systemctl enable nginx
  systemctl start nginx
fi
