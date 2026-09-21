#!/bin/bash
ssh pi@$HESTIA << 'EOF'
DATE=$(date +%-m-%-d-%y)
BACKUP_DIR="/home/pi/backups/$DATE"
mkdir -p "$BACKUP_DIR"
sudo tar czf "$BACKUP_DIR/scripts.backup.tar.gz" --exclude=/home/pi/scripts/oneui /home/pi/scripts/
sudo openhab-cli backup "$BACKUP_DIR/openhab.backup.zip"
ls /home/pi/scripts/oneui/js > "$BACKUP_DIR/js-builds.txt"
echo "Backend backup OK: $BACKUP_DIR"
EOF