use vk;
-- Создать функцию, вычисляющей коэффициент популярности пользователя (по количеству друзей)

DROP FUNCTION IF EXISTS popularity_coefficient;
DELIMITER //

CREATE FUNCTION popularity_coefficient(idUser INT)
RETURNS INT DETERMINISTIC
BEGIN
	
    DECLARE tempCoefficint INT DEFAULT 0;
	SET tempCoefficint = (
		WITH src AS (
		SELECT fr.target_user_id AS id
		FROM friend_requests fr
		WHERE fr.initiator_user_id = idUser
			AND fr.status = "approved"
		UNION ALL
		SELECT fr.initiator_user_id
		FROM friend_requests fr
		WHERE fr.target_user_id = idUser
			AND fr.status = "approved"
		)
		SELECT count(*) AS coefficient
		FROM src
	);
	
	RETURN tempCoefficint;
    
END
//

DELIMITER ;

SELECT 
	  id
    , firstname
    , lastname
    , popularity_coefficient(id) AS coefficient
FROM users
ORDER BY coefficient DESC;
