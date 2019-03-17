-- ARPPU — Average Revenue Per Paying User — средний доход с одного платящего пользователя

USE `technotrack_default`;

WITH RECURSIVE cte AS (
    SELECT MIN(CAST(`payment_dttm` AS DATE)) AS dt FROM `payments`
        UNION ALL
    SELECT dt + INTERVAL 1 DAY
    FROM cte
    WHERE dt + INTERVAL 1 DAY <= (SELECT MAX(CAST(`payment_dttm` AS DATE)) FROM `payments`)
),
pu_per_day AS (
    SELECT CAST(`payment_dttm` AS DATE) AS dt,
        COUNT(DISTINCT `user_id`) as users_paying
    FROM `payments`
    GROUP BY dt
),
payments_per_day AS (
    SELECT CAST(`payment_dttm` AS DATE) AS dt,
        SUM(`payment_sum`) as payments_sum
    FROM `payments`
    GROUP BY dt
)
SELECT cte.dt AS `Date`,
    COALESCE(payments.payments_sum, 0) / COALESCE(pu.users_paying, 1) AS `ARPPU — Average Revenue Per Paying User`
FROM cte
LEFT JOIN pu_per_day AS pu ON cte.dt = pu.dt
LEFT JOIN payments_per_day AS payments ON cte.dt = payments.dt;
