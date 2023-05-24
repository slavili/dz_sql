create schema if not exists sql_dz_vvs;
use sql_dz_vvs;

DROP TABLE IF EXISTS phones;
 
CREATE TABLE  phones(
	  ID INT UNSIGNED NOT NULL AUTO_INCREMENT
	, manufacturer  varchar(100) NOT NULL -- название производителя
	, `name` varchar(100) NOT NULL -- название аппарата
    , quantity INT NOT NULL DEFAULT 0 -- колличество (на складе)
    , price float NOT NULL -- цена
    , CONSTRAINT UX_name UNIQUE KEY (`name`) -- обеспечиваем униальность, чтобы 2 раза не добавить одно и тоже
	, CONSTRAINT PK_phones PRIMARY KEY (ID) -- навешиваем первичный ключ
) engine=innodb default charset=utf8mb4 collate=utf8mb4_general_ci;

INSERT IGNORE INTO  phones (manufacturer, `name`, quantity, price) VALUES
('Apple','iPhone 14 Pro Max',8,169299),
('Apple','iPhone 14 Pro',4,156399),
('Apple','iPhone 13 Pro Max 512',1,135699),
('Apple','iPhone 13 Pro',2,128799),
('Apple','iPhone 11',7,53349),
(' Apple','iPhone SE 2022',15,38499),
('Apple','iPhone 12',5,66199),
('Apple','iPhone 13 mini',9,64199),
('Apple','iPhone 8',1,10000),
('Samsung','Galaxy S21 FE',13,44999),
('Samsung','Galaxy S23 Ultra',23,119999),
('Samsung','Galaxy A73 5G',6,39999),
('Samsung','Galaxy A13',20,10999),
('Samsung','Galaxy A54 5G',9,35999);