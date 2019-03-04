CREATE TABLE IF NOT EXISTS payments (
	payment_id INT NOT NULL, 	
	user_id INT NOT NULL REFERENCES users(user_id),
	payment_sum DOUBLE,
	payment_dttm TIMESTAMP DEFAULT CURRENT_TIMESTAMP);