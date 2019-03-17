-- WAU
WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM sessions
        UNION ALL
	SELECT dt + INTERVAL 1 WEEK
      FROM cte
     WHERE dt + INTERVAL 1 WEEK <= (SELECT MAX(CAST(begin_dttm AS DATE)) FROM sessions)
)
SELECT cte.dt, COUNT(DISTINCT sessions.user_id) as wu
  FROM sessions RIGHT JOIN cte ON WEEK(CAST(sessions.begin_dttm AS DATE)) = WEEK(cte.dt)
 GROUP BY cte.dt
 ORDER BY cte.dt;