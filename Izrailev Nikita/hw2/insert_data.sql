LOAD DATA LOCAL INFILE '/home/nikita/Desktop/Projects/database_course/_homeworks/homework2/users.csv'
INTO TABLE users FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' (user_id,login,reg_dttm);

LOAD DATA LOCAL INFILE '/home/nikita/Desktop/Projects/database_course/_homeworks/homework2/payments.csv'
INTO TABLE payments FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' (payment_id,user_id,payment_sum,payment_dttm);

LOAD DATA LOCAL INFILE '/home/nikita/Desktop/Projects/database_course/_homeworks/homework2/sessions.csv'
INTO TABLE sessions FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' (session_id,user_id,begin_dttm,end_dttm);