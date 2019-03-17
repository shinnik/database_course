-- WAU — Weekly Active Users — количество уникальных пользователей, которые зашли в приложение в течение недели

USE `technotrack_default`;

WITH RECURSIVE cte AS (
    SELECT MIN(CAST(`begin_dttm` AS DATE)) AS dt FROM `sessions`
        UNION ALL
    SELECT dt + INTERVAL 1 WEEK
    FROM cte
    WHERE dt + INTERVAL 1 WEEK <= (SELECT MAX(CAST(`begin_dttm` AS DATE)) FROM `sessions`)
)
SELECT cte.dt AS `First day of the week`,
    COUNT(DISTINCT `sessions`.`user_id`) AS `WAU — Weekly Active Users`
FROM cte
LEFT JOIN `sessions`
ON (cte.dt <= CAST(`sessions`.`begin_dttm` AS DATE))
AND (cte.dt + INTERVAL 7 DAY > CAST(`sessions`.`begin_dttm` AS DATE))
GROUP BY cte.dt
ORDER BY cte.dt;
