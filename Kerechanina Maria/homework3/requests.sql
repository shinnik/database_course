1) Логины трех пользователей, которые заплатили больше всего денег

SELECT login FROM users AS u JOIN(
	SELECT user_id, sum(payment_sum) AS money 
	FROM payments 
	GROUP BY user_id 
	ORDER BY money DESC 
	LIMIT 3
) AS p ON p.user_id = u.user_id;

+----------+
| login    |
+----------+
| login_82 |
| login_38 |
| login_85 |
+----------+

2) Среднее количество сессий у пользователей

SELECT avg(COALESCE(count_sessions, 0)) AS average_sessions 
FROM users u 
LEFT JOIN (
        SELECT s.user_id, count(*) AS count_sessions 
        FROM sessions s  GROUP BY user_id) AS t 
ON u.user_id=t.user_id;

+------------------+
| average_sessions |
+------------------+
|          35.9100 |
+------------------+

