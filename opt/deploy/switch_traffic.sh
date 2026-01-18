#!/bin/bash
set -e

TARGET=$1

if [[ "$TARGET" != "blue" && "$TARGET" != "green" ]]; then
  echo "Usage: switch_traffic.sh blue|green"
  exit 1
fi

PORT=5000
[[ "$TARGET" == "blue" ]] && PORT=5001

echo "About to switch traffic to $TARGET (port $PORT)"
read -p "Type YES to confirm: " CONFIRM

if [[ "$CONFIRM" != "YES" ]]; then
  echo "Aborted"
  exit 0
fi

sed -i "s/{{APP_PORT}}/$PORT/" /etc/nginx/sites-enabled/app.conf
nginx -t
systemctl reload nginx

echo "Traffic successfully switched to $TARGET"