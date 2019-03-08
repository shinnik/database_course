# WA
WITH RECURSIVE cte AS
(
  SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
    UNION ALL
	SELECT dt + INTERVAL 1 DAY
    FROM cte
    WHERE (dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) FROM payments))
)
SELECT cte.dt, COUNT(DISTINCT payments.user_id)
  FROM payments JOIN cte ON CAST(payments.payment_dttm AS DATE) = cte.dt
  GROUP BY cte.dt
  ORDER BY cte.dt;

# PPU
WITH RECURSIVE cte AS
(
  SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
    UNION ALL
	SELECT dt + INTERVAL 1 DAY
    FROM cte
    WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) FROM payments)
)
SELECT cte.dt, COUNT(DISTINCT payments.user_id) / COUNT(DISTINCT sessions.user_id)
    FROM payments
    JOIN cte ON CAST(payments.payment_dttm AS DATE) = cte.dt
    JOIN sessions ON CAST(sessions.begin_dttm AS DATE) = cte.dt
    GROUP BY cte.dt
    ORDER BY cte.dt;

# ARPPU
WITH RECURSIVE cte AS
(
  SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM payments
    UNION ALL
	SELECT dt + INTERVAL 1 DAY
    FROM cte
    WHERE (dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) FROM payments))
)
SELECT cte.dt, SUM(payments.payment_sum) / COUNT(DISTINCT payments.user_id)
  FROM payments JOIN cte ON CAST(payments.payment_dttm AS DATE) = cte.dt
  GROUP BY cte.dt
  ORDER BY cte.dt;