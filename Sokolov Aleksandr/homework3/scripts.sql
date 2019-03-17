SELECT login, sum(payment_sum) as sum
from users
JOIN payments on users.user_id = payments.user_id
GROUP BY users.user_id
order by sum desc
limit 3;

#login_82	7248
#login_38	6214
#login_85	5508


SELECT avg(COALESCE(t.session_count, 0)) FROM (
   SELECT count(sessions.session_id) AS session_count
   FROM users
   JOIN sessions ON sessions.user_id = users.user_id
   GROUP BY users.user_id)
AS t;

#67.7547