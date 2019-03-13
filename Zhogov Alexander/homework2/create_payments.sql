CREATE TABLE IF NOT EXISTS payments (
	payment_id SERIAL PRIMARY KEY,
    user_id BIGINT(20) UNSIGNED,
    payment_sum DECIMAL(15, 4) NOT NULL,
    payment_dttm TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE RESTRICT
) ENGINE = InnoDB;
