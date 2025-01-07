echo off

rem ***credentials to connect to mysql server***
set mysql_user=${USERNAME}
set mysql_password=${PASSWORD}

rem ***backup file name generation***
set backup_path=${BACKUP_PATH}
if not exist "%backup_path%" mkdir "%backup_path%"
set backup_name_date_time=%DATE:~10,4%_%DATE:~4,2%_%DATE:~7,2%_%DATE:~0,3%_AT_%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
set backup_name=${BACKUP_NAME}_db_backup_%backup_name_date_time%
set backup_log_name=${BACKUP_NAME}_db_backup_log_%backup_name_date_time%

rem ***backup creation***
docker exec ${MYSQL_HOST_NAME_OR_IP_ADDRESS} /usr/bin/mysqldump --user=%mysql_user% --password=%mysql_password% --routines --triggers --events ${DATABASE_NAME} > "%backup_path%\%backup_name%.sql"
if %ERRORLEVEL% neq 0 (
    (echo Backup failed: error during dump creation) >> "%backup_path%\%backup_log_name%.txt"
) else (echo Backup successful) >> "%backup_path%\%backup_log_name%.txt"