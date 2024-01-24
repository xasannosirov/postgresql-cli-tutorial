\c forselectdb

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

-- payment jadvaliga ma'lumot qo'shish
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES
    (1, 1, 1, 50.00, '2022-01-05 12:00:00'),
    (2, 2, 2, 75.00, '2022-01-06 14:30:00');

-- GROUP BY
SELECT
   customer_id
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
	customer_id;
-- 
SELECT
	customer_id,
	SUM (amount)
FROM
	payment
GROUP BY
	customer_id
ORDER BY
	SUM (amount) DESC;
-- customer table
DROP TABLE IF EXISTS customer;
CREATE TABLE IF NOT EXISTS customer (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    address_id INT,
    active BOOLEAN,
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--tablega ma'lumot yozish 
INSERT INTO customer (first_name, last_name, email, address_id, active, create_date, last_update)
VALUES
    ('Alice', 'Johnson', 'alice@example.com', 1, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Bob', 'Williams', 'bob@example.com', 2, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- GROUP BY
SELECT
	first_name || ' ' || last_name full_name,
	SUM (amount) amount
FROM
	payment
INNER JOIN customer USING (customer_id)    	
GROUP BY
	full_name
ORDER BY amount DESC;	
-- 
SELECT
	staff_id,
	COUNT (payment_id)
FROM
	payment
GROUP BY
	staff_id;
-- 
SELECT 
	customer_id, 
	staff_id, 
	SUM(amount) 
FROM 
	payment
GROUP BY 
	staff_id, 
	customer_id
ORDER BY 
    customer_id;
-- 
SELECT 
	DATE(payment_date) paid_date, 
	SUM(amount) sum
FROM 
	payment
GROUP BY
	DATE(payment_date);