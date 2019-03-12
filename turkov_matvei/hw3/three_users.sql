select users.login, sum(payments.payment_sum) as user_sum
from payments,users
where payments.user_id = users.user_id
group by payments.user_id
order by user_sum desc limit 3