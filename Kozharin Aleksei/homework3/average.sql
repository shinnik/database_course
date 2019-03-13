USE hw1;
SELECT AVG(total_sessions) AS "Average sessions" FROM (
  SELECT u.user_id, IFNULL(sess.num, 0) as total_sessions
  FROM users u LEFT JOIN
  (SELECT user_id, COUNT(*) AS num FROM sessions GROUP BY user_id) AS sess ON u.user_id=sess.user_id) AS r;