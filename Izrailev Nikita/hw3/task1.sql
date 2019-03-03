SELECT login FROM users AS u JOIN (
SELECT user_id FROM (SELECT user_id, sum(payment_sum) AS money FROM payments GROUP BY user_id ORDER BY money DESC LIMIT 3) AS t) AS p
ON u.user_id = p.user_id;
