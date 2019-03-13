-- логины трёх пользователей, которые заплатили больше всего денег

SELECT login FROM
(
	SELECT SUM(payment_sum) psum, user_id 
	FROM payments 
	GROUP BY user_id
	ORDER BY psum DESC
	LIMIT 3
) AS res
JOIN users u
WHERE u.user_id = res.user_id;

> login_38
> login_82
> login_85
