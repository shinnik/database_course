create table payments(
     payment_id serial,
     user_id int(10) not null references users(user_id),
     payment_sum decimal(10, 2) not null,
     payment_dttm timestamp not null);

