/*
Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности)
*/
USE lesson_3;
-- Не уверен что имею право в данном дз применять такие методы, но других не придумал.
-- 1-й способ
;WITH src AS (
	SELECT
		  post
		, salary
		, (SELECT COUNT(*) FROM staff sint WHERE sint.post = sout.post AND sint.salary >sout.salary) rnum
	FROM staff sout
)
SELECT DISTINCT 
	  post
    , salary 
FROM src
WHERE rnum <=1
ORDER BY post, salary DESC;

-- 2-й способ
;WITH src AS (
	SELECT
		  post
		, salary
		, ROW_NUMBER() OVER(PARTITION BY post ORDER BY salary DESC) AS rnumber		
	FROM staff sout
)
SELECT DISTINCT 
	  post
    , salary 
FROM src
WHERE rnumber <=2
ORDER BY post, salary DESC;
