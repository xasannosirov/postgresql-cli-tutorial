-- tablelar mavjud bo'lsa o'chirish
DROP TABLE IF EXISTS film, inventory, rental, customer, payment;
-- film jadvali
CREATE TABLE IF NOT EXISTS film (
    film_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    rental_rate NUMERIC NOT NULL
);

-- inventory jadvali
CREATE TABLE IF NOT EXISTS inventory (
    inventory_id SERIAL PRIMARY KEY,
    film_id INT,
    FOREIGN KEY (film_id) REFERENCES film(film_id)
);

-- rental jadvali
CREATE TABLE IF NOT EXISTS rental (
    rental_id SERIAL PRIMARY KEY,
    inventory_id INT,
    return_date DATE,
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);

-- customer jadvali
CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- payment jadvali
CREATE TABLE IF NOT EXISTS payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- film jadvallariga ma'lumot qo'shish
INSERT INTO film (title, rental_rate)
VALUES
    ('Film1', 3.50),
    ('Film2', 2.99),
    ('Film3', 4.25);

-- inventory jadvallariga ma'lumot qo'shish
INSERT INTO inventory (film_id)
VALUES
    (1),
    (2),
    (3);

-- rental jadvallariga ma'lumot qo'shish
INSERT INTO rental (inventory_id, return_date)
VALUES
    (1, '2005-05-29'),
    (2, '2005-05-30'),
    (3, '2005-05-28');

-- customer jadvallariga ma'lumot qo'shish
INSERT INTO customer (first_name, last_name)
VALUES
    ('John', 'Doe'),
    ('Alice', 'Johnson');

-- payment jadvallariga ma'lumot qo'shish
INSERT INTO payment (customer_id)
VALUES
    (1),
    (2);
-- SUBQUERY
SELECT
	AVG (rental_rate)
FROM
	film;
-- 
SELECT
	film_id,
	title,
	rental_rate
FROM
	film
WHERE
	rental_rate > 2.98;
-- 
SELECT
	film_id,
	title,
	rental_rate
FROM
	film
WHERE
	rental_rate > (
		SELECT
			AVG (rental_rate)
		FROM
			film
	);
-- 
SELECT
	inventory.film_id
FROM
	rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE
	return_date BETWEEN '2005-05-29'
AND '2005-05-30';
-- 
SELECT
	film_id,
	title
FROM
	film
WHERE
	film_id IN (
		SELECT
			inventory.film_id
		FROM
			rental
		INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
		WHERE
			return_date BETWEEN '2005-05-29'
		AND '2005-05-30'
	);
-- 
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS (
		SELECT
			1
		FROM
			payment
		WHERE
			payment.customer_id = customer.customer_id
	);