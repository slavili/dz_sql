USE sql_dz_vvs;
-- Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
-- не однозначно понял задание, поэтому сделал 2 варианта решения.
-- 1-й вариант
SELECT 
	  color
	, count(*) AS cnt
FROM auto
WHERE mark IN ('BMW','LADA')
GROUP BY color;

-- 2-й вариант
;WITH src AS (
SELECT 
	  mark
	, color
    , count(*) AS cnt
FROM auto
GROUP BY mark, color
)
SELECT 
	  mark
    , color
    , cnt
FROM src
WHERE mark IN ('BMW','LADA');
