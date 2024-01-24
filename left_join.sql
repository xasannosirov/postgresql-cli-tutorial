CREATE TABLE IF NOT EXISTS film (
    film_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

-- inventory jadvali
CREATE TABLE IF NOT EXISTS inventory (
    inventory_id SERIAL PRIMARY KEY,
    film_id INT,
    -- Qo'shimcha ustunlar uchun kerakli ma'lumotlarni qo'shing
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- film jadviga ma'lumot qo'shish
INSERT INTO film (title)
VALUES
    ('Film1'),
    ('Film2'),
    ('Film3');

-- inventory jadviga ma'lumot qo'shish
INSERT INTO inventory (film_id)
VALUES
    (1),
    (2);

-- LEFT JOIN
SELECT
	film.film_id,
	title,
	inventory_id
FROM
	film
LEFT JOIN inventory 
    ON inventory.film_id = film.film_id
ORDER BY title;
-- 
SELECT
	film.film_id,
	film.title,
	inventory_id
FROM
	film
LEFT JOIN inventory 
   ON inventory.film_id = film.film_id
WHERE inventory.film_id IS NULL
ORDER BY title;
-- 
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i
   ON i.film_id = f.film_id
WHERE i.film_id IS NULL
ORDER BY title;
-- 
SELECT
	f.film_id,
	title,
	inventory_id
FROM
	film f
LEFT JOIN inventory i USING (film_id)
WHERE i.film_id IS NULL
ORDER BY title;   