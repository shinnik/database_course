USE hw1;

-- WAU
WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 MONTH
      FROM cte
     WHERE dt + INTERVAL 1 MONTH <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt, COUNT(DISTINCT sessions.user_id)
  FROM sessions RIGHT JOIN cte ON MONTH(CAST(sessions.begin_dttm AS DATE)) = MONTH(cte.dt)
 GROUP BY cte.dt
 ORDER BY cte.dt;