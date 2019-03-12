-- логины трёх пользователей, которые заплатили больше всего денег

SELECT u.login, r.s 
FROM users AS u 
JOIN 
(
	SELECT p.user_id, sum(p.payment_sum) as s 
	FROM payments AS p 
	GROUP BY user_id 
	ORDER BY s DESC LIMIT 3
) AS r 
ON u.user_id=r.user_id;

> login_82
> login_38
> login_85