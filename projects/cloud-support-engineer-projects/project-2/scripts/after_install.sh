cat > scripts/after_install.sh <<'EOF'
#!/bin/bash
set -e

WEB_ROOT="/usr/share/nginx/html"

echo "PWD=$(pwd)"
echo "Listing bundle contents:"
ls -la

rm -rf "$WEB_ROOT"/*

# Prefer React build output if it exists
if [ -d "frontend/build" ]; then
  cp -R frontend/build/* "$WEB_ROOT/"
elif [ -d "frontend" ]; then
  cp -R frontend/* "$WEB_ROOT/"
else
  echo "ERROR: frontend folder not found in the deployment bundle"
  exit 1
fi

systemctl restart nginx
EOF
