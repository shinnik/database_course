-- среднее количество сессий у пользователей


SELECT avg(r.num) AS average 
FROM 
(
	SELECT u.user_id, s.num 
	FROM users AS u 
	JOIN 
	(
		SELECT sessions.user_id, count(*) AS num 
		FROM sessions GROUP BY user_id
	) as s
	ON u.user_id=s.user_id
) as r;


> 67.7547