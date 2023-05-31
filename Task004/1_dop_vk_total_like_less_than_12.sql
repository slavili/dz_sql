USE lesson_4;
-- Подсчитать общее количество лайков, которые получили пользователи младше 12 лет включительно
SET @ageOfUser = 12;
SELECT 
	COUNT(*) AS cnt
FROM `profiles` prf
	INNER JOIN `users` usr ON usr.id = prf.user_id
    INNER JOIN media md ON md.user_id = usr.id
    INNER JOIN likes lks ON lks.media_id = md.id
WHERE YEAR(CURDATE())-YEAR(prf.birthday) <= @ageOfUser