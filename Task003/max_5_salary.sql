/*
Выведите 5 максимальных заработных плат (saraly)
*/
-- Не совсем понял задание: 5 топ максимальных неповторящихся или просто 5 топ максимальных
-- , поэтому сделал оба варианта.
USE lesson_3;

SELECT DISTINCT
	salary
FROM staff
ORDER BY salary DESC
LIMIT 5;

SELECT 
	salary
FROM staff
ORDER BY salary DESC
LIMIT 5;