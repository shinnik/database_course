CREATE TABLE service.users (
user_id SERIAL PRIMARY KEY,
login VARCHAR(50) NOT NULL UNIQUE,
reg_dtm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);