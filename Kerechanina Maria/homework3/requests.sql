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

SELECT (SELECT sum(count) 
    FROM (SELECT user_id, count(*) AS count 
          FROM sessions 
          GROUP BY user_id
    ) AS sum_sessions) / 
    (SELECT count(*) 
    FROM (SELECT user_id, count(*) AS count 
          FROM sessions 
          GROUP BY user_id
    ) AS count_users) 
AS average_sessions;

+------------------+
| average_sessions |
+------------------+
|          67.7547 |
+------------------+

