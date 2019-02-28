-- среднее количество сессий у пользователей

USE `technotrack_default`;

SELECT AVG(r.num) AS `Среднее количество сессий у пользователя`
FROM (SELECT u.`user_id`, IFNULL(s.num, 0) AS num
    FROM `users` u
    LEFT JOIN (SELECT `user_id`, COUNT(*) AS num
        FROM `sessions`
        GROUP BY `user_id`) AS s
    ON u.`user_id` = s.`user_id`) AS r;

> 35.9100
