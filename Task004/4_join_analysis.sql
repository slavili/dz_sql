USE sql_dz_vvs;
-- Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
SET @userDate = '2020-02-05';
SELECT 
	  a.an_name
    , a.an_price
    , o.ord_datetime
FROM analysis a
	INNER JOIN orders o ON o.ord_an = a.an_id
WHERE datediff(ord_datetime, @userDate) BETWEEN 0 AND 7
ORDER BY ord_datetime;
