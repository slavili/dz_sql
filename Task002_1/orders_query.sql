/*
Выберите все заказы.
В зависимости от поля order_status выведите столбец full_order_status:
OPEN – «Order is in open state»;
CLOSED - «Order is closed»;
CANCELLED -  «Order is cancelled»
*/
use sql_dz_vvs;

SELECT
	  ID
    , employee_id
    , amount
    , order_status
    , CASE
		WHEN order_status = 'Open' THEN 'Order is in open state'
		WHEN order_status = 'CLOSED' THEN 'Order is closed'
		WHEN order_status = 'CANCELLED' THEN 'Order is cancelled'
        ELSE "Order has unknown state"
      END as full_order_status
FROM orders;