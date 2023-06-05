USE vk;
-- Получите друзей пользователя с id=1
CREATE OR REPLACE VIEW friends1 AS
WITH src AS (
SELECT target_user_id AS id
FROM friend_requests
WHERE initiator_user_id = 1
	AND `status` = 'approved'
UNION ALL
SELECT initiator_user_id AS id
FROM friend_requests
WHERE target_user_id = 1
	AND `status` = 'approved'
)
SELECT * -- думаю здесь звёдочка допустима
FROM users
WHERE id IN (SELECT id FROM src);