select users.user_id, sum(payment_sum)
from users JOIN payments ON users.user_id = payments.user_id
group by users.user_id
order by 2 desc
limit 3;