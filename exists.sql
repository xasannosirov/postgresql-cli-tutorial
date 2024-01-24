-- table mavjud bo'lsa uni o'chirish
DROP TABLE IF EXISTS customer, payment CASCADE;
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
    amount NUMERIC,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- customer jadvallariga ma'lumot qo'shish
INSERT INTO customer (first_name, last_name)
VALUES
    ('John', 'Doe'),
    ('Jane', 'Smith'),
    ('Bob', 'Johnson');

-- payment jadvallariga ma'lumot qo'shish
INSERT INTO payment (customer_id, amount)
VALUES
    (1, 15),
    (2, 10),
    (3, 20);
-- EXISTS
SELECT first_name,
       last_name
FROM customer c
WHERE EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;
-- 
SELECT first_name,
       last_name
FROM customer c
WHERE NOT EXISTS
    (SELECT 1
     FROM payment p
     WHERE p.customer_id = c.customer_id
       AND amount > 11 )
ORDER BY first_name,
         last_name;
-- 
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS( SELECT NULL )
ORDER BY
	first_name,
	last_name;