echo off

rem ***credentials to connect to mysql server***
set MYSQL_HOST_NAME_OR_IP_ADDRESS=...
set MYSQL_USERNAME=...
set MYSQL_PASSWORD=...
set BACKUP_PATH=...

rem ***backup file name generation***
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"
set DATETIME=%DATE:~10,4%_%DATE:~4,2%_%DATE:~7,2%_%DATE:~0,3%_AT_%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
set BACKUP_NAME=all_db_backup_%DATETIME%
set BACKUP_LOG_NAME=all_db_backup_log_%DATETIME%

rem ***backup creation***
docker exec MYSQL_HOST_NAME_OR_IP_ADDRESS /usr/bin/mysqldump --user=%MYSQL_USERNAME% --password=%MYSQL_PASSWORD% --all-databases --routines --triggers --events --result-file="%BACKUP_PATH%\%BACKUP_NAME%.sql"
if %ERRORLEVEL% neq 0 (
    (echo Backup failed: error during dump creation) >> "%BACKUP_PATH%\%BACKUP_LOG_NAME%.txt"
) else (echo Backup successful) >> "%BACKUP_PATH%\%BACKUP_LOG_NAME%.txt"