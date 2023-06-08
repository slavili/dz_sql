use vk;

-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро",
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".


DROP PROCEDURE IF EXISTS hello;
DELIMITER //

CREATE PROCEDURE hello()
BEGIN

	SET @userTime = time(now());

	SELECT CASE
		WHEN @userTime BETWEEN '06:00:00' AND '11:59:59' THEN 'Доброе утро'
		WHEN @userTime BETWEEN '12:00:00' AND '17:59:59' THEN 'Добрый день'
		WHEN @userTime BETWEEN '18:00:00' AND '23:59:59' THEN 'Добрый вечер'
		WHEN @userTime BETWEEN '00:00:00' AND '05:59:59' THEN 'Доброй ночи'
	END AS TimesOfDay;

END
//

DELIMITER ;

CALL hello();
