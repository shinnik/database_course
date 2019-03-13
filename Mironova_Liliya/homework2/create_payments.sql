CREATE TABLE IF NOT EXISTS payments(
payment_id INT NOT NULL,
user_id INT NOT NULL,
payment_sum DOUBLE NOT NULL,
payment_dttm TIMESTAMP NOT NULL);
