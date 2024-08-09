echo off

rem ***path to mysql server bin folder***
cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"

rem ***credentials to connect to mysql server***
set mysql_user=username
set mysql_password=password

rem ***backup file name generation***
set backup_path=C:\Users\Administrator\Documents\dumps
set backup_name_date_time=%DATE:~10,4%_%DATE:~4,2%_%DATE:~7,2%_%DATE:~0,3%_AT_%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
set backup_name=db_backup_%backup_name_date_time%
set backup_log_name=db_backup_log_%backup_name_date_time%

rem ***backup creation***
mysqldump --user=%mysql_user% --password=%mysql_password% --routines --triggers --events database_name > "%backup_path%\%backup_name%.sql"
if %ERRORLEVEL% neq 0 (
    (echo Backup failed: error during dump creation) >> "%backup_path%\%backup_log_name%.txt"
) else (echo Backup successful) >> "%backup_path%\%backup_log_name%.txt"