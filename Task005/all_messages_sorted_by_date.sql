USE vk;

-- Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at)
-- и найдите разницу дат отправления между соседними сообщениями,
-- получившегося списка. (используйте LEAD или LAG)
;WITH src AS (
SELECT 
	  id
	, from_user_id
	, to_user_id
	, body
	, created_at
    , LAG(created_at) OVER(ORDER BY created_at ASC) AS lg
FROM messages
)
SELECT 
	*
    , DATEDIFF(created_at, lg) as 'difference_in_days'
FROM src
ORDER BY created_at;

