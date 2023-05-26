USE sql_dz_vvs;
/*
Без оператора JOIN, верните заголовок публикации, текст с описанием, идентификатор клиента, 
опубликовавшего публикацию и логин данного клиента.
*/
SELECT c.id, c.login, p.title, p.full_text
FROM clients c, posts p
WHERE c.id = p.user_id