

create table sessions
(
  session_id int auto_increment,
  user_id    int       not null,
  begin_dttm timestamp not null,
  end_dttm   timestamp not null,
  constraint sessions_session_id_uindex
    unique (session_id),
  constraint sessions_users_user_id_fk
    foreign key (user_id) references `some database`.users (user_id)
);

alter table sessions
  add primary key (session_id);