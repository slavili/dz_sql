/*
Выведите специальности, у которых средний возраст сотрудников меньше 30 лет 
*/

USE lesson_3;

SELECT
	post
FROM staff
GROUP BY post
HAVING AVG(age) <= 30;