create table users
(
  user_id  int auto_increment,
  login    varchar(20) not null,
  reg_dttm timestamp   not null,
  constraint users_login_uindex
    unique (login),
  constraint users_user_id_uindex
    unique (user_id)
);

alter table users
  add primary key (user_id);

