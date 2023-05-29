/*
Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания 
*/
USE lesson_3;

-- ↓
SELECT
	id
	, firstname
	, lastname
	, post
	, seniority
	, salary
	, age
FROM staff
ORDER BY salary desc;

-- ↑
SELECT
	id
	, firstname
	, lastname
	, post
	, seniority
	, salary
	, age
FROM staff
ORDER BY salary asc;