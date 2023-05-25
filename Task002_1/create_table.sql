CREATE SCHEMA IF NOT EXISTS sql_dz_vvs;
use sql_dz_vvs;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales(
	  ID INT UNSIGNED NOT NULL AUTO_INCREMENT
    , order_date date not null
    , count_product int not null
    , CONSTRAINT PK_sales_id PRIMARY KEY (ID)
) engine=innodb default charset=utf8mb4 collate=utf8mb4_general_ci;

INSERT IGNORE INTO sales (order_date, count_product) VALUES
('2022-01-01',156),
('2022-01-02',180),
('2022-01-03',21),
('2022-01-04',124),
('2022-01-05',341);