USE `technotrack_default`;

LOAD DATA INFILE '/var/lib/mysql-files/technotrack_default/users.csv'
INTO TABLE `users`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/technotrack_default/payments.csv'
INTO TABLE `payments`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/var/lib/mysql-files/technotrack_default/sessions.csv'
INTO TABLE `sessions`
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
