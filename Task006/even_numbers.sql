USE sql_dz_vvs;
-- Выведите только четные числа от 1 до 10 (Через цикл).
-- Пример: 2,4,6,8,10

DROP FUNCTION IF EXISTS EvenNumbers;
DELIMITER //

CREATE FUNCTION EvenNumbers(userNumber INT)
RETURNS VARCHAR(255) DETERMINISTIC
BEGIN

	DECLARE resultValue VARCHAR(255);
    
	WHILE (userNumber > 0) DO
		
        IF userNumber%2=0 THEN
                IF resultValue IS NULL THEN SET resultValue = userNumber;
				ELSE SET resultValue = concat(userNumber, ', ', resultValue);
				END IF;
        END IF;
		
        SET userNumber = userNumber - 1;
        
	END WHILE;
    
    RETURN resultValue;
    
END
//

DELIMITER ;

SELECT EvenNumbers(10);