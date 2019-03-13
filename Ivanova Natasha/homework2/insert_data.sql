LOAD DATA LOCAL INFILE '/home/charlie/Загрузки/users.csv'
INTO TABLE service.users FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' (user_id,login,reg_dtm);


LOAD DATA LOCAL INFILE '/home/charlie/Загрузки/payments.csv'
INTO TABLE service.payments FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' (payment_id,user_id,payment_sum,payment_dttm);


LOAD DATA LOCAL INFILE '/home/charlie/Загрузки/sessions.csv'
INTO TABLE service.sessions FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n' (session_id,user_id,begin_dttm,end_dttm);