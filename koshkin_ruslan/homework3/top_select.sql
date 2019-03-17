select login from users, 
(select user_id, sum(payment_sum) 
	from payments 
	group by user_id 
	order by sum(payment_sum) desc limit 3) as s 
where users.user_id=s.user_id;

-- login_82 
-- login_38 
-- login_85 

