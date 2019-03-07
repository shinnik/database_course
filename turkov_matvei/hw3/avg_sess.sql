select count(sessions.session_id) div count(distinct sessions.user_id) as average_for_users
from sessions