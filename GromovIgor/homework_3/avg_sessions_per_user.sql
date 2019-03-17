SELECT AVG(a.sessions_per_user)
FROM (
    SELECT COUNT(*) sessions_per_user
    FROM sessions
    GROUP BY user_id
    )a;
