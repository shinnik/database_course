-- PPU – Percentage of Paying Users – доля платящей аудитории относительно DAU

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
dau_per_day AS (
    SELECT CAST(`begin_dttm` AS DATE) AS dt,
        COUNT(DISTINCT `user_id`) as users_all
    FROM `sessions`
    GROUP BY dt
)
SELECT cte.dt AS `Date`, 
       COALESCE(pu.users_paying, 0) / COALESCE(dau.users_all, 1) AS `PPU – Percentage of Paying Users`
FROM cte
LEFT JOIN pu_per_day AS pu ON cte.dt = pu.dt
LEFT JOIN dau_per_day AS dau ON cte.dt = dau.dt;
