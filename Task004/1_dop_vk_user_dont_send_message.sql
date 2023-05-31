USE lesson_4;
--  Вывести всех пользователей, которые не отправляли сообщения.

SELECT DISTINCT
	  usr.id
    , usr.firstname
    , usr.lastname
FROM users usr
	LEFT JOIN messages msg ON msg.to_user_id = usr.id
WHERE msg.to_user_id IS NULL