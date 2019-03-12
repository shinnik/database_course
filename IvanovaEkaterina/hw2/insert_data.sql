LOAD DATA INFILE '/usr/local/mysql/data/users.csv' INTO TABLE users FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/usr/local/mysql/data/payments.csv' INTO TABLE payments FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

LOAD DATA INFILE '/usr/local/mysql/data/sessions.csv' INTO TABLE sessions FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';