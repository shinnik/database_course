CREATE TABLE IF NOT EXISTS payments(
	payment_id SERIAL PRIMARY KEY,
	user_id BIGINT(20) UNSIGNED REFERENCES users(id),
	payment_sum DOUBLE,
	payment_dttm TIMESTAMP
);
