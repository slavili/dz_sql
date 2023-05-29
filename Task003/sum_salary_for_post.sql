/*
Посчитайте суммарную зарплату (salary) по каждой специальности (роst)
*/

USE lesson_3;

SELECT
	  post
	, sum(salary) as total_salary
FROM staff
GROUP BY post;