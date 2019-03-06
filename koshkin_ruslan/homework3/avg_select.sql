select avg(num) from
(select user_id, count(session_id) as num
	from sessions
	group by user_id) as n;
