USE sql_dz_vvs;
-- Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”
;WITH src as (
SELECT DISTINCT
	  s.id
FROM shops s
	INNER JOIN cats c ON c.shops_id = s.id
WHERE c.`name` IN ('Murzik','Zuza')
)
SELECT shopname 
FROM shops
WHERE id NOT IN (SELECT id FROM src);
