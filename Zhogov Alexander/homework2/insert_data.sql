LOAD DATA INFILE '/Users/zogovaleksandr/DB/_homeworks/homework2/users.csv' 
INTO TABLE users 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/Users/zogovaleksandr/DB/_homeworks/homework2/payments.csv' 
INTO TABLE payments 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE '/Users/zogovaleksandr/DB/_homeworks/homework2/sessions.csv' 
INTO TABLE sessions 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';
