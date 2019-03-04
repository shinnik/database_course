create table payments
(
  payment_id   int auto_increment,
  user_id      int       not null,
  payment_sum  double    not null,
  payment_dttm timestamp not null,
  constraint payments_payment_id_uindex
    unique (payment_id),
  constraint payments_users_user_id_fk
    foreign key (user_id) references `some database`.users (user_id)
);

alter table payments
  add primary key (payment_id);