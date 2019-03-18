SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE '%path_to_file%/users.csv'
INTO TABLE users
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '%path_to_file%/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '%path_to_file%/sessions.csv'
INTO TABLE sessions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';