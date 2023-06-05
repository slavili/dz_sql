USE vk;
-- Получите список медиафайлов пользователя с количеством лайков(media m, likes l ,users u)

SELECT 
	u.firstname
    , u.lastname
    , m.filename
    , COUNT(*) as count_of_likes
FROM users u
	INNER JOIN media m ON m.user_id = u.id
	INNER JOIN likes l ON l.media_id = m.id
GROUP BY u.firstname, u.lastname, m.filename
    
