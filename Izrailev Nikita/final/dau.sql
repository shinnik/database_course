WITH RECURSIVE cte AS
(
   SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM Session
        UNION ALL
   SELECT cte.dt + INTERVAL 1 DAY
        FROM cte
        WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) AS dt FROM Session)
)
SELECT cte.dt as day, dau.c as DAU
FROM cte
LEFT JOIN (SELECT CAST(begin_dttm AS DATE) AS dt, COUNT(DISTINCT owner_id) AS c FROM Session GROUP BY dt) AS dau
ON cte.dt = dau.dt;

