USE vk;
-- Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол)
-- , которые не старше 20 лет.
CREATE OR REPLACE VIEW user_information AS
WITH src AS (
SELECT 
	  u.firstname
    , u.lastname
    , p.hometown
    , p.gender
    , (YEAR(NOW()) - YEAR(birthday)) AS user_old
FROM users u
	INNER JOIN `profiles` p ON p.user_id = u.id
)
SELECT 
	  firstname
    , lastname
    , hometown
    , gender
FROM src
WHERE user_old < 20;

SELECT *
FROM user_information;