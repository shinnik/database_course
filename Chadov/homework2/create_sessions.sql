CREATE TABLE IF NOT EXISTS sessions (
	session_id INT,
	user_id INT REFERENCES users(user_id),
	begin_dttm TIMESTAMP,
	end_dttm TIMESTAMP
);