-- PPU – Percentage of Paying Users – доля платящей аудитории относительно DAU

-- Я на лекции не был, поэтому не уверен, что правильно понял смысл этой метрики >.>
-- Написал как дословно в описании) Но "доля", которая сильно больше единицы меня всё же смущает :\

SELECT
(SELECT count(DISTINCT user_id)
FROM payments)/
(SELECT count(DISTINCT user_id)
FROM sessions
WHERE begin_dttm BETWEEN 
(SELECT begin_dttm 
FROM sessions
ORDER BY begin_dttm
LIMIT 1)
AND DATE_ADD((SELECT begin_dttm 
FROM sessions
ORDER BY begin_dttm
LIMIT 1), INTERVAL 1 DAY));

> 49
