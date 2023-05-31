USE sql_dz_vvs;
-- Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)
-- 1-й способ
SELECT 
	  shopname
FROM shops s
	INNER JOIN cats c ON c.shops_id = s.id
WHERE c.`name` = 'Murzik';

-- 2-й способ
SELECT 
	  shopname
FROM shops s
WHERE EXISTS (SELECT * FROM cats c where c.shops_id = s.id AND c.`name` = 'Murzik');