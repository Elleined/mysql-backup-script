#!/bin/bash

MYSQL_HOST_NAME_OR_IP_ADDRESS=...
MYSQL_USERNAME=...
MYSQL_PASSWORD=...
DATABASE_NAME=...
BACKUP_PATH=...
BACKUP_FILE="$BACKUP_PATH/${DATABASE_NAME}_backup_$(date +%F_%H-%M-%S).sql"

mkdir -p "$BACKUP_PATH"
docker exec "$MYSQL_HOST_NAME_OR_IP_ADDRESS" /usr/bin/mysqldump -u "$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --routines --triggers --events "$DATABASE_NAME" > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!" >&2
fi
