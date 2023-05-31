USE sql_dz_vvs;
-- Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)
SELECT 
	  shopname
	, `name` AS cat_name 
FROM shops s
	INNER JOIN cats c ON c.shops_id = s.id;