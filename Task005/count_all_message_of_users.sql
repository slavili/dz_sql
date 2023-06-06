USE vk;

-- Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей, 
-- указав имя и фамилию пользователя, количество отправленных сообщений и место в рейтинге 
-- (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)

;WITH src AS (
SELECT 
	  u.firstname
    , u.lastname
    , COUNT(*) AS count_user_messages
FROM users u
	INNER JOIN messages m ON m.from_user_id = u.id
GROUP BY u.firstname, u.lastname
)
SELECT 
	  firstname
    , lastname
    , count_user_messages
    , DENSE_RANK() OVER(ORDER BY count_user_messages DESC) AS drnk
FROM src;
