USE vk;
-- Создайте представление, в котором будут выводится все сообщения, 
-- в которых принимал участие пользователь с id = 1. 
CREATE OR REPLACE VIEW messages_id1 AS
SELECT *
FROM messages m
WHERE m.from_user_id = 1
UNION ALL
SELECT *
FROM messages m
WHERE m.to_user_id = 1;