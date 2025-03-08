#!/bin/bash

# Define variables
MYSQL_USERNAME=...
MYSQL_PASSWORD=...
DATABASE_NAME=...
BACKUP_PATH=...

# Ensure backup directory exists
mkdir -p "$BACKUP_PATH"

# Generate timestamped backup filename
BACKUP_FILE="$BACKUP_PATH/${DATABASE_NAME}_backup_$(date +%F_%H-%M-%S).sql"

# Perform the backup
/usr/bin/mysqldump -u "$MYSQL_USERNAME" -p"$MYSQL_PASSWORD" --routines --triggers --events "$DATABASE_NAME" > "$BACKUP_FILE"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_FILE"
else
    echo "Backup failed!" >&2
fi
