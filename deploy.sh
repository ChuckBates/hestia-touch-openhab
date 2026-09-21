#!/bin/bash
set -e
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

./backup.sh || { echo "Backup failed, aborting deploy"; exit 1; }

scp -q -r "$REPO_DIR/home/pi/scripts/." pi@$HESTIA:/tmp/scripts-deploy/
ssh pi@$HESTIA 'sudo cp -r /tmp/scripts-deploy/. /home/pi/scripts/ && \
  sudo chmod +x /home/pi/scripts/*.sh && \
  rm -rf /tmp/scripts-deploy && \
  echo "Backend deploy OK"'