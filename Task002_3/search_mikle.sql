USE sql_dz_vvs;
/*
Выполните поиск по публикациям, автором которых является клиент "Mikle".
*/

SELECT p.title, p.full_text
FROM clients c, posts p
WHERE c.id = p.user_id
	and login = "Mikle"