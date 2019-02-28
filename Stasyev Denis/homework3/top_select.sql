-- логины трёх пользователей, которые заплатили больше всего денег

USE `technotrack_default`;

SELECT u.`login`, p.`sum`
FROM `users` AS u 
INNER JOIN (SELECT `user_id`, SUM(`payment_sum`) AS `sum`
    FROM `payments`
    GROUP BY `user_id`
    ORDER BY sum DESC) AS p
ON u.`user_id` = p.`user_id`
LIMIT 3;

> login_82
> login_38
> login_85
