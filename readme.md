﻿# Домашние задания по теме #

# Базы данных и SQL (семинары) #

### Урок 1. Установка СУБД, подключение к БД, просмотр и создание таблиц (20 мая 2023г.) ###

1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными
2. Выведите название, производителя и цену для товаров, количество которых превышает 2
3. Выведите весь ассортимент товаров марки “Samsung”
4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**

4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):

4.1. Товары, в которых есть упоминание "Iphone"

4.2. "Galaxy"

4.3. Товары, в которых есть ЦИФРЫ

4.4. Товары, в которых есть ЦИФРА "8"

Задание 1 находится в файле create_database.sql

Остальные задания находятся в файле 

Решение данной задачи в каталоге **Task001**

### Урок 2. SQL – создание объектов, простые запросы выборки (21 мая 2023г.) ###

1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными (каталог **Task002_1**);
2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300 (каталог **Task002_1**);
3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE (каталог **Task002_1**);
4. CRUD - операции на любом ЯП. Коннект с БД через С#, к примеру (каталог **Task002_2** - на языке Java JDK 19.0.2);
5. Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц (clients-posts) (каталог **Task002_3** - add_foreign_key_clients_posts.sql);
6. Без оператора JOIN, верните заголовок публикации, текст с описанием, идентификатор клиента, опубликовавшего публикацию и логин данного клиента (каталог **Task002_3** - join_ansi_sql_89.sql);
7. Выполните поиск по публикациям, автором которых является клиент "Mikle" (каталог **Task002_3** - search_mikle.sql).

Примечание к пункту 4 (CRUD):
Файлы program.java и program2.java - выполняют одинаковую функцию,
только первый файл создан с помощью if, второй с помощью case.


### Урок 3. SQL – выборка данных, сортировка, агрегатные функции (27 мая 2023г.) ###

1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания; возрастания (**sort_salary.sql**);
2. Выведите 5 максимальных заработных плат (saraly) (**max_5_salary.sql**);
3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst) (**sum_salary_for_post.sql**);
4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно (**count_employees.sql**);
5. Найдите количество специальностей (**total_speciality.sql**);
6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет (**age_less_than_30.sql**);

Доп:

7. Внутри каждой должности вывести ТОП-2 по ЗП (2 самых высокооплачиваемых сотрудника по ЗП внутри каждой должности) (**top2_salary.sql**).

Решение данной задачи в каталоге **Task003**


### Урок 4. SQL – работа с несколькими таблицами (28 мая 2023г.) ###

[Таблица к блоку JOIN](https://drive.google.com/file/d/1TZzW8ZlDdvIfDC9C46bUeILey6opQjdu/view?usp=share_link)

Используя JOIN-ы, выполните следующие операции:

1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id) (**1_join_all_cats.sql**);
2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами) (**2_join_murzik.sql**);
3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza” (**3_join_not_murzik_not_zuza.sql**);
4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю (**4_join_analysis.sql**).

[Таблица к блоку ДОПЫ](https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing)

1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA (**1_dop_join_bmv_lada.sql**);
2. Вывести на экран марку авто и количество AUTO не этой марки (**2_dop_join_auto.sql**).

[Таблица к блоку Допы к соц.сети:](https://pollen-attempt-4ac.notion.site/c448e32ae1344f22b1deae7f42c8b57f)

1. Подсчитать общее количество лайков, которые получили пользователи младше 12 лет включительно (**1_dop_vk_total_like_less_than_12.sql**);
2. Определить кто больше поставил лайков (всего): мужчины или женщины (**1_dop_vk_male_female.sql**);
3. Вывести всех пользователей, которые не отправляли сообщения (**1_dop_vk_user_dont_send_message.sql**);
4. (по желанию)* Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех написал ему сообщений (**1_dop_vk_friend_makes_lot_of_message.sql**).

Решение данной задачи в каталоге **Task004**


### Урок 5. SQL – оконные функции (3 июня 2023г.) ###

* Получите друзей пользователя с id=1 (**friends_of_id_1.sql**);
* Создайте представление, в котором будут выводится все сообщения, в которых принимал участие пользователь с id = 1 (**message_with_user_id_1.sql**);
* Получите список медиафайлов пользователя с количеством лайков(media m, likes l ,users u)(**users_media_like.sql**);
* Получите количество групп у пользователей (**count_of_group_of_user.sql**);
* Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет (**users_less_than_20_years_old.sql**);


Решение данной задачи в каталоге **Task005**