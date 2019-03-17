SELECT login
FROM users
INNER JOIN(
    SELECT user_id
           , SUM(payment_sum) LTV 
    FROM payments 
    GROUP BY user_id 
    ORDER BY LTV DESC 
    LIMIT 3) LTV on LTV.user_id = users.user_id;
