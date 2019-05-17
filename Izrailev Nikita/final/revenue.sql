WITH RECURSIVE cte AS
(
   SELECT MIN(CAST(begin_dttm AS DATE)) AS dt FROM Session
        UNION ALL
   SELECT cte.dt + INTERVAL 1 DAY
        FROM cte
        WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(begin_dttm AS DATE)) AS dt FROM Session)
)
SELECT dt, SUM(Payment.payment_sum)
FROM cte LEFT JOIN Payment ON CAST(Payment.payment_dttm AS DATE) = cte.dt
GROUP BY dt