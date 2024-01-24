-- customer jadvali
DROP TABLE if EXISTS customer;
CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    store_id INT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    address_id INT,
    active BOOLEAN,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- payment jadvali
DROP TABLE IF EXISTS payment;
CREATE TABLE IF NOT EXISTS payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    rental_id INT,
    amount NUMERIC,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- customer jadvaliga ma'lumot qo'shish
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES
    (1, 'John', 'Doe', 'john@example.com', 1, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Alice', 'Johnson', 'alice@example.com', 2, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- payment jadvaliga ma'lumot qo'shish
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES
    (1, 1, 1, 50.00, '2022-01-05 12:00:00'),
    (2, 2, 2, 75.00, '2022-01-06 14:30:00');
-- HAVING
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id;
-- 
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
HAVING
	SUM (amount) > 50;
-- 
SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id;
-- 
SELECT
	store_id,
	COUNT (customer_id)
FROM
	customer
GROUP BY
	store_id
HAVING
	COUNT (customer_id) < 2;