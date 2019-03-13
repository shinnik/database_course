# ARPPU
WITH RECURSIVE cte AS
(
    SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
        UNION ALL
	SELECT dt + INTERVAL 1 DAY
      FROM cte
     WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) FROM payments)
)
SELECT cte.dt, COALESCE(SUM(payments.payment_sum)/COUNT(DISTINCT payments.user_id), 0) as ARPPU
  FROM payments RIGHT JOIN cte ON CAST(payments.payment_dttm AS DATE) = cte.dt
 GROUP BY cte.dt
 ORDER BY cte.dt