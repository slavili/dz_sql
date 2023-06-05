USE vk;
-- Получите количество групп у пользователей

SELECT 
	  u.firstname
    , u.lastname
    , COUNT(*) AS group_count
FROM users u
	INNER JOIN users_communities uc ON uc.user_id = u.id
GROUP BY u.firstname, u.lastname
ORDER BY group_count DESC;