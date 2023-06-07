USE sql_dz_vvs;
-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней, часов, минут и секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

DROP FUNCTION IF EXISTS count_of_dhm;
DELIMITER //

CREATE FUNCTION count_of_dhm(countOfSecond INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN

	DECLARE tempResult VARCHAR(255);
    DECLARE temp  INT;
    DECLARE named VARCHAR(8);
    SET tempResult = "";
    SET temp = 86400;-- количество секунд в сутках
    WHILE (temp>=1) DO
		
        IF temp = 86400 THEN SET named = " days";
        ELSEIF temp = 3600 THEN SET named = " hours";
        ELSEIF temp = 60 THEN SET named = " minutes";
        ELSE SET named = " seconds";
        END IF;
        
		SET tempResult = concat(tempResult, " ", floor(countOfSecond/temp), " days");  
		SET countOfSecond = countOfSecond%temp;
        
        IF temp = 86400 THEN SET temp=temp/24;
        ELSE SET temp=temp/60;
        END IF;
        
    END WHILE;
	
	RETURN tempResult;

END
//

DELIMITER ;

SELECT count_of_dhm(123456) AS countDHMS;