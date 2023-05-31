USE lesson_4;
-- (по желанию)* Пусть задан некоторый пользователь. 
-- Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений.
;WITH src1 AS (
SELECT 
		  usr1.firstname AS firstname_recipient
        , usr1.lastname AS lastname_recipient
        , usr2.firstname AS firstname_sender
        , usr2.lastname AS lastname_sender
        , COUNT(*) AS cnt
FROM users usr1
	INNER JOIN messages msg ON msg.to_user_id = usr1.id
    INNER JOIN users usr2 ON usr2.id = msg.from_user_id
GROUP BY  usr1.firstname
        , usr1.lastname
        , usr2.firstname
        , usr2.lastname
), src2 AS (
	SELECT 
		*        
        , MAX(cnt) OVER(PARTITION BY firstname_recipient, lastname_recipient ORDER BY cnt DESC) AS maxnumber
    FROM src1
)
SELECT 
		  firstname_recipient
        , lastname_recipient
        , 'получил писем от' AS col
        , firstname_sender
        , lastname_sender 
        , cnt
        , 'шт' AS 'мера'
FROM src2
WHERE cnt = maxnumber
ORDER BY firstname_recipient, lastname_recipient;
