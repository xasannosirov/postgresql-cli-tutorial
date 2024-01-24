-- table mavjud bo'lsa uni o'chirib yuboradi
DROP TABLE IF EXISTS film CASCADE;
-- film jadvali
CREATE TABLE IF NOT EXISTS film (
    film_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    length INT NOT NULL,
    rating TEXT NOT NULL
);

-- Ma'lumotlarni qo'shish
INSERT INTO film (title, length, rating)
VALUES
    ('Film1', 120, 'PG-13'),
    ('Film2', 90, 'PG-13'),
    ('Film3', 110, 'R'),
    ('Film4', 130, 'PG'),
    ('Film5', 100, 'R'),
    ('Film6', 95, 'PG-13'),
    ('Film7', 140, 'PG-13'),
    ('Film8', 105, 'PG'),
    ('Film9', 95, 'R');
-- ALL
SELECT
    ROUND(AVG(length), 2) avg_length
FROM
    film
GROUP BY
    rating
ORDER BY
    avg_length DESC;
-- 
SELECT
    film_id,
    title,
    length
FROM
    film
WHERE
    length > ALL (
            SELECT
                ROUND(AVG (length),2)
            FROM
                film
            GROUP BY
                rating
    )
ORDER BY
    length;