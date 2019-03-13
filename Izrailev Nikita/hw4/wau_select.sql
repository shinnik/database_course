WITH RECURSIVE cte AS
(
   SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
        UNION ALL
   SELECT cte.dt + INTERVAL 1 DAY
        FROM cte
        WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) AS dt FROM payments)
)
SELECT cte.dt AS start_day,
       COUNT(DISTINCT sessions.user_id) AS wau
FROM cte
LEFT JOIN sessions ON (cte.dt <= CAST(sessions.begin_dttm AS DATE)) AND (cte.dt + INTERVAL 7 DAY > CAST(sessions.begin_dttm AS DATE))
GROUP BY cte.dt
ORDER BY cte.dt;


     +----------------+-----+
     | start_day      | wau |
     +----------------+-----+
     | 2018-08-02     |   6 |
     | 2018-08-09     |  11 |
     | 2018-08-16     |  17 |
     | 2018-08-23     |  22 |
     | 2018-08-30     |  30 |
     | 2018-09-06     |  35 |
     | 2018-09-13     |  41 |
     | 2018-09-20     |  49 |
     | 2018-09-27     |  51 |
     +----------------+-----+
