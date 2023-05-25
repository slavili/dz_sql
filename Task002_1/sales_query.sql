/*
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 
	и больше 300.
*/
use sql_dz_vvs;

SELECT 
	ID
    , CASE
		WHEN count_product < 100 THEN "Маленький заказ"
		WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
		WHEN count_product > 300 THEN "Большой заказ"
        ELSE "Статус неопределён"
	END as `type_order`
FROM sales;