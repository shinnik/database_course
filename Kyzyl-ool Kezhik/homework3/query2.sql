select t1.session_amount/t2.users_amount as average_sessions_for_user from
    (select count(0) as session_amount from sessions) as t1 join
    (select count(1) as users_amount from users) as t2 on true;