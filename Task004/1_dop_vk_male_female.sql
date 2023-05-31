USE lesson_4;
-- Определить кто больше поставил лайков (всего): мужчины или женщины

SELECT 
	  gender
    , COUNT(*) AS cnt
FROM `profiles` prf
	INNER JOIN `users` usr ON usr.id = prf.user_id
	INNER JOIN likes lks ON lks.user_id = usr.id
GROUP BY gender;