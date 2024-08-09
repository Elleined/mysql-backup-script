# mysql-backup-script
This MySQL Automatic Backup scripts for your MySQL server databases you can copy and paste the code and make sure to watch the reference video to fully understand the code then try to modify for your needs.

## For Windows
- !!! DONT FORGET TO MODIFY THE FILES BASED ON YOUR NEEDS OR ELSE IT WILL NOT WORK !!! 
- To use this scripts you can just double click the .bat file and everything should works fine if you configure correctly you should see the backup sql file in the targeted folder
- To automate the backup you can run a schedule task in your Task Scheduler that will automatically 
execute the .bat file script to backup your database.

## For Linux
1. Install first the gzip for backup compression because sometimes backup we might may lose data when we copy or paste the .sql raw file itself
```
sudo apt install gzip
```

2. Create folder
- Go first inside the /opt folder then run this command
```bash
sudo mkdir mysqlBackup
```

3. Open the built in CRON in linux
```
sudo crontab -e
```

4. Add this CRON at the end of the file
```bash
*/5 * * * * mysqldump -u [username] -p[password] [database] --routines --triggers --events | gzip > /opt/mysqlBackup/backup_$(date +%F.%H%M%S).sql.gz
```
This cron will run every 5 minute REMINDER that the specified CRON can be change!
Use the link below to generate a new cron based on what your need

# Useful Links
- Datetime naming
https://youtu.be/1GUCJKmJuAo

- Backup and Restore in Linux
https://www.arubacloud.com/tutorial/how-to-schedule-a-mysql-database-backup-on-ubuntu.aspx

- CRON Generator
https://crontab.cronhub.io/



