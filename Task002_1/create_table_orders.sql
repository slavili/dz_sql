CREATE SCHEMA IF NOT EXISTS sql_dz_vvs;
use sql_dz_vvs;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
	  ID INT UNSIGNED NOT NULL AUTO_INCREMENT
    , employee_id CHAR(3) NOT NULL
    , amount DECIMAL(10,2) NOT NULL
    , order_status VARCHAR(10) not null
    , CONSTRAINT PK_orders_id PRIMARY KEY (ID)
)  engine=innodb default charset=utf8mb4 collate=utf8mb4_general_ci;

INSERT INTO orders (employee_id, amount, order_status) VALUES
('e03',15.00,'OPEN'),
('e01',25.50,'OPEN'),
('e05',100.70,'CLOSED'),
('e02',22.18,'OPEN'),
('e04',9.50,'CANCELLED');