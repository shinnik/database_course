-- WAU — Weekly Active Users — количество уникальных пользователей, которые зашли в приложение в течение недели

SELECT count(DISTINCT user_id)
FROM sessions
WHERE begin_dttm BETWEEN 
(SELECT begin_dttm 
FROM sessions
ORDER BY begin_dttm
LIMIT 1)
AND DATE_ADD((SELECT begin_dttm 
FROM sessions
ORDER BY begin_dttm
LIMIT 1), INTERVAL 7 DAY);

> 6
