SELECT column_names FROM table_name
INTO OUTFILE 'C://ProgramData//MySQL//MySQL Server 8.0//Uploads//csv_name.csv'
FIELDS ENCLOSED BY '"'
TERMINATED BY ';'
ESCAPED BY '"'
LINES TERMINATED BY '\r\n';     