
CREATE TABLE IF NOT EXISTS payments (
	payment_id INT,
	user_id INT REFERENCES users(user_id),
	payment_sum DOUBLE,
	payment_dttm TIMESTAMP
);