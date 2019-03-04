create table users ( 
	user_id int(10) primary key,
       	login varchar(32) not null unique,
	reg_dttm timestamp not null);

