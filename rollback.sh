#!/bin/bash
ssh pi@$HESTIA << 'EOF'
DATE=$(date +%-m-%-d-%y)
BACKUP_DIR="/home/pi/backups/$DATE"
sudo tar xzf "$BACKUP_DIR/scripts.backup.tar.gz" -C /
sudo systemctl stop openhab2
sudo openhab-cli restore "$BACKUP_DIR/openhab.backup.zip"
sudo systemctl start openhab2
echo "Backend rollback complete from: $BACKUP_DIR"
EOF