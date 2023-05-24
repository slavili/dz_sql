use sql_dz_vvs;
/* 
2. Выведите название, 
производителя и цену для товаров,
количество которых превышает 2
*/
SELECT manufacturer
	, `name`
    , price
FROM phones
WHERE quantity > 2;

/*
3.  Выведите весь ассортимент товаров марки “Samsung”
*/
SELECT `name`
    , price
    , quantity
FROM phones
WHERE manufacturer = 'Samsung';

/*
4. Выведите информацию о телефонах,
где суммарный чек больше 100 000 и меньше 145 000**
*/
;WITH src as (
select manufacturer
	, `name`
    , price
    ,quantity
    , price * quantity as result_check
	from phones
)
select manufacturer
	, `name`
    , price
    ,quantity
    , result_check
 from src
 WHERE result_check > 100000 and result_check < 145000;
 
/*
4.*** С помощью регулярных выражений найти (можно использовать операторы “LIKE”, “RLIKE” для 4.3 ):
4.1. Товары, в которых есть упоминание "Iphone"
*/
SELECT manufacturer
	, `name`
    , price
    , quantity
FROM phones
WHERE `name` like '%Iphone%';

/*
4.2. "Galaxy"
*/

SELECT manufacturer
	, `name`
    , price
    , quantity
FROM phones
WHERE `name` like '%Galaxy%';

/*
4.3. Товары, в которых есть ЦИФРЫ
*/
SELECT manufacturer
	, `name`
    , price
    , quantity
FROM phones
WHERE REGEXP_LIKE(`name`, '[0-9]') = 1 ;

/*
4.4. Товары, в которых есть ЦИФРА "8" 
*/
SELECT manufacturer
	, `name`
    , price
    , quantity
FROM phones
WHERE REGEXP_LIKE(`name`, '[8]') = 1 ;