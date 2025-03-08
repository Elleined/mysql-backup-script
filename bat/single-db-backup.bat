echo off

rem ***path to mysql server bin folder***
set MYSQL_PATH_BIN_PATH=C:\Program Files\MySQL\MySQL Server 8.0\bin
set MYSQL_USERNAME=...
set MYSQL_PASSWORD=...
set BACKUP_PATH=...
set DATABASE_NAME=...

cd "%MYSQL_PATH_BIN_PATH%"
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"
set DATETIME=%DATE:~10,4%_%DATE:~4,2%_%DATE:~7,2%_%DATE:~0,3%_AT_%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
set BACKUP_NAME=%DATABASE_NAME%_db_backup_%DATETIME%
set BACKUP_LOG_NAME=%DATABASE_NAME%_db_backup_log_%DATETIME%

rem ***backup creation***
mysqldump --user=%MYSQL_USERNAME% --password=%MYSQL_PASSWORD% --routines --triggers --events %DATABASE_NAME% > "%BACKUP_PATH%\%BACKUP_NAME%.sql"
if %ERRORLEVEL% neq 0 (
    (echo Backup failed: error during dump creation) >> "%BACKUP_PATH%\%BACKUP_LOG_NAME%.txt"
) else (echo Backup successful) >> "%BACKUP_PATH%\%BACKUP_LOG_NAME%.txt"