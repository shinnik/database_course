-- ARPPU — Average Revenue Per Paying User — средний доход с одного платящего пользователя

SELECT
(SELECT SUM(payment_sum)
FROM payments) /
(SELECT count(DISTINCT user_id)
FROM payments);

>  2868.4897959183672
