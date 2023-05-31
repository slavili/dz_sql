USE sql_dz_vvs;
-- Вывести на экран марку авто и количество AUTO не этой марки

;WITH src AS (
	SELECT 
		mark
	FROM auto
)
SELECT 
	  mark
    , (SELECT COUNT(*) FROM src s_in WHERE s_in.mark <> s_out.mark) AS cnt
FROM src s_out
GROUP BY mark;