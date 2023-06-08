USE vk;
-- Создать процедуру, которая решает следующую задачу
-- Выбрать для одного пользователя 5 пользователей в случайной комбинации, которые удовлетворяют хотя бы одному критерию:
-- а) из одного города
-- б) состоят в одной группе
-- в) друзья друзей

DROP PROCEDURE IF EXISTS fiveFriends;
DELIMITER //

CREATE PROCEDURE fiveFriends(idUser INT, limitUsers INT)
BEGIN
WITH comSRC AS (
	SELECT DISTINCT c.`name` 
    FROM users_communities uc
        INNER JOIN communities c ON c.id = uc.community_id
	WHERE uc.user_id = idUser
), hometownSRC as (
    SELECT 
		  DISTINCT p.hometown
    FROM users u
		INNER JOIN `profiles` p ON p.user_id = u.id
	WHERE u.id = idUser
), friendsoffriendsSRC1 as (
	SELECT fr.initiator_user_id AS id
	FROM  friend_requests fr
	WHERE fr.target_user_id = idUser
	AND fr.status = 'approved'
	union all
	SELECT fr.target_user_id
	FROM  friend_requests fr
	WHERE fr.initiator_user_id = idUser
	AND fr.status = 'approved'
), friendsoffriendsSRC2 AS (
	SELECT fr.target_user_id AS id
	FROM friend_requests fr
	WHERE fr.initiator_user_id IN (SELECT id FROM friendsoffriendsSRC1)
	AND fr.target_user_id NOT IN (SELECT id FROM friendsoffriendsSRC1)
	AND fr.target_user_id <> idUser
	AND fr.status = 'approved'
		UNION ALL
	SELECT fr.initiator_user_id
	FROM friend_requests fr
	WHERE fr.target_user_id IN (SELECT id FROM friendsoffriendsSRC1)
	AND fr.initiator_user_id NOT IN (SELECT id FROM friendsoffriendsSRC1)
	AND fr.initiator_user_id <> idUser
	AND fr.status = 'approved'
)
SELECT 
	  u.id
	, u.firstname
	, u.lastname
	, c.`name`
FROM users u
	INNER JOIN users_communities uc ON uc.user_id = u.id
	INNER JOIN communities c ON c.id = uc.community_id
WHERE c.`name` IN (SELECT `name` FROM comSRC)
	AND u.id <> idUser
UNION ALL
SELECT 
	  u.id
	, u.firstname
	, u.lastname
	, p.hometown
FROM users u
	INNER JOIN `profiles` p ON p.user_id = u.id
WHERE p.hometown IN (SELECT hometown FROM hometownSRC)
	AND u.id <> idUser
UNION ALL
SELECT 
	u.id
    , u.firstname
    , u.lastname
    , "друг друга" as dr
FROM friendsoffriendsSRC2 s
	INNER JOIN users u ON u.id = s.id
ORDER BY rand()
LIMIT limitUsers;

END
//

DELIMITER ;

CALL fiveFriends(1, 5);