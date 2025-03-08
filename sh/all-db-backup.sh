#!/bin/bash

MYSQL_USERNAME=...
MYSQL_PASSWORD=...
BACKUP_PATH=...
BACKUP_FILE="$BACKUP_PATH/all_databases_backup_$(date +%F_%H-%M-%S).sql"

mkdir -p "$BACKUP_PATH"
/usr/bin/mysqldump -u "$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --all-databases --routines --triggers --events > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!" >&2
fi
