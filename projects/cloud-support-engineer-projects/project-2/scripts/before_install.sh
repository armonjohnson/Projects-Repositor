#!/bin/bash
set -e

yum install -y nginx
systemctl start nginx
systemctl enable nginx
