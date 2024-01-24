-- agar tablelar mavjud bo'lsa ularni o'chirib yuborish
DROP TABLE IF EXISTS category, film_category;
DROP TABLE IF EXISTS film CASCADE;
-- category jadvali
CREATE TABLE IF NOT EXISTS category (
    category_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- film jadvali
CREATE TABLE IF NOT EXISTS film (
    film_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    length INT NOT NULL
);

-- film_category jadvali
CREATE TABLE IF NOT EXISTS film_category (
    film_id INT,
    category_id INT,
    FOREIGN KEY (film_id) REFERENCES film(film_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- Ma'lumotlarni qo'shish
-- category jadvallariga ma'lumot qo'shish
INSERT INTO category (name)
VALUES
    ('Action'),
    ('Drama');

-- film jadvallariga ma'lumot qo'shish
INSERT INTO film (title, length)
VALUES
    ('Film1', 120),
    ('Film2', 90),
    ('Film3', 110);

-- film_category jadvallariga ma'lumot qo'shish
INSERT INTO film_category (film_id, category_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2);
-- ANY
SELECT
    MAX( length )
FROM
    film
INNER JOIN film_category
        USING(film_id)
GROUP BY
    category_id;
-- 
SELECT title
FROM film
WHERE length >= ANY(
    SELECT MAX( length )
    FROM film
    INNER JOIN film_category USING(film_id)
    GROUP BY  category_id );
-- 
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );
-- 
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id IN(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );