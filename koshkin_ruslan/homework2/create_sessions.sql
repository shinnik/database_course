create table sessions( 
	session_id serial,
       	user_id int(10) not null references users(user_id),
       	begin_dttm timestamp not null,
       	end_dttm timestamp null default null);

