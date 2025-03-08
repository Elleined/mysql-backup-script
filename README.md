# mysql-backup-script
Automated Backup Scripts for you MySQL Server Databases.

## For Windows
1. Change the script variables with (...) values based on your needs
2. To use this scripts you can just double click the .bat file and everything should works fine if you configure correctly you should see the backup sql file in the targeted folder
3. To automate the backup you can run a schedule task in your Task Scheduler that will automatically execute the .bat file script to backup your database.

## For Linux
1. Change the script variables with (...) values based on your needs
2. Open linux built-in cron scheduler
```
crontab -e
```

3. Paste this command at the very end! of the file and the file should look like this.
```bash
Template
# m h  dom mon dow   command
*/1 * * * * /bin/bash /path/to/mysql-backup-script.sh 

Example
# m h  dom mon dow   command
*/1 * * * * /bin/bash $HOME/mysql-backup-script.sh 
```
*This cron will run every 1 minute. !REMINDER! that the specified CRON can be change! Use the link below to generate a new cron based on what your need*

4. After you edit the command in step 1 and run all the commands. 
The backup file should be present in target location. 
If the .sql file backup is missing you done something wrong.

# Useful Links
- Datetime naming for windows
https://youtu.be/1GUCJKmJuAo

- Backup and Restore in Linux
https://www.arubacloud.com/tutorial/how-to-schedule-a-mysql-database-backup-on-ubuntu.aspx

- CRON Generator
  - https://crontab.cronhub.io/
  - https://www.freeformatter.com/cron-expression-generator-quartz.html



