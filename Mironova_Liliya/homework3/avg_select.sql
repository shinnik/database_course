SELECT AVG(cnt) FROM (SELECT COUNT(session_id) AS cnt FROM sessions group by user_id) CntTable;

+----------+
| AVG(cnt) |
+----------+
|  67.7547 |
+----------+
