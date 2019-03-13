CREATE TABLE IF NOT EXISTS payments( 
	payment_id  INT, 
	user_id INT NOT NULL, 
	FOREIGN KEY (user_id) REFERENCES homework_1.users(user_id), 
	payment_sum DOUBLE, 
	payment_dttm TIMESTAMP
) ENGINE = InnoDB;
