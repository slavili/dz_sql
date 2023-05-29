/*
Найдите количество специальностей
*/

USE lesson_3;

SELECT
	count(DISTINCT post) AS cnt_post
FROM staff;