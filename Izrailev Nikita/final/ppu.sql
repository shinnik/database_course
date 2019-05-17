WITH RECURSIVE cte AS
(
   SELECT MIN(CAST(payment_dttm AS DATE)) AS dt FROM Payment
        UNION ALL
   SELECT cte.dt + INTERVAL 1 DAY
        FROM cte
        WHERE cte.dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(payment_dttm AS DATE)) AS dt FROM Payment)
)
SELECT cte.dt as day, COALESCE(puPerDay.c, 0) / COALESCE(dauPerDay.c, 1) AS ppu
    FROM cte
    LEFT JOIN (SELECT CAST(payment_dttm AS DATE) AS dt, COUNT(DISTINCT Payment.owner_id) AS c FROM Payment GROUP BY dt)
      AS puPerDay ON cte.dt = puPerDay.dt
    LEFT JOIN (SELECT CAST(begin_dttm AS DATE) AS dt, COUNT(DISTINCT Session.owner_id) AS c FROM Session GROUP BY dt)
      AS dauPerDay ON cte.dt = dauPerDay.dt;