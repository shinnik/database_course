-- среднее количество сессий у пользователей

SELECT AVG(c) avg_sessions
FROM
(
	SELECT count(*) c, user_id 
	FROM sessions 
	GROUP BY user_id
) s;

>  67.7547
