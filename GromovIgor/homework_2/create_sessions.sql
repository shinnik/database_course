CREATE TABLE IF NOT EXISTS sessions( 
	session_id  INT, 
	user_id INT, 
	FOREIGN KEY (user_id) REFERENCES homework_1.users(user_id), 
	begin_dttm TIMESTAMP, 
	end_dttm TIMESTAMP
) ENGINE = InnoDB;
