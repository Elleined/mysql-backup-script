# mysql-backup-script
This MySQL Automatic Backup scripts for your MySQL server databases you can copy and paste the code and make sure to watch the reference video to fully understand the code then try to modify for your needs.

## For Windows
- !!! DONT FORGET TO MODIFY THE FILES BASED ON YOUR NEEDS OR ELSE IT WILL NOT WORK !!! 
- To use this scripts you can just double click the .bat file and everything should works fine if you configure correctly you should see the backup sql file in the targeted folder
- To automate the backup you can run a schedule task in your Task Scheduler that will automatically 
execute the .bat file script to backup your database.

## For Linux
1. Create a .sh file. 
   - Open the text editor
   - Paste this command (!!! DONT FORGET TO MODIFY THE FILES BASED ON YOUR NEEDS OR ELSE IT WILL NOT WORK !!!)
   - Save it with .sh as file extension
```bash
Template

7
/usr/bin/mysqldump -u [username] -p[password] [database] --routines --triggers --events > /path/to/backup/backup_$(date +%F.%H%M%S).sql

Example

#!/bin/bash
/usr/bin/mysqldump -u root -pp455w0rd abs_db --routines --triggers --events > $HOME/backup_$(date +%F.%H%M%S).sql
```
*This cron will run every 1 minute. !REMINDER! that the specified CRON can be change! Use the link below to generate a new cron based on what your need*

2. Make the .sh file executable
   - When doing this first open files
   - Locate the folder where you save the .sh file 
   - Right click > Open in terminal
```bash
Template
chmod +x ./{fileName.sh}

Example
chmod +x ./mysql-backup-script.sh
```

3. Open the built in CRON in linux
```
crontab -e
```

4. Paste this command at the very end! of the file and the file should look like this.
```bash
Template
# m h  dom mon dow   command
*/1 * * * * /bin/bash /path/to/mysql-backup-script.sh 

Example
# m h  dom mon dow   command
*/1 * * * * /bin/bash $HOME/mysql-backup-script.sh 
```

5. After you edit the command in step 1 and run all the commands. 
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



