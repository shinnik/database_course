CREATE TABLE IF NOT EXISTS users( 
	user_id  INT, 
	login VARCHAR(50), 
	reg_dttm TIMESTAMP,
	INDEX user_id_idx (user_id ASC)
)ENGINE = InnoDB;
