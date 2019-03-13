USE hw1;
# top_3
SELECT users.login, sum(payments.payment_sum) AS sum
FROM payments, users WHERE payments.user_id = users.user_id
GROUP BY payments.user_id ORDER BY sum DESC LIMIT 3;