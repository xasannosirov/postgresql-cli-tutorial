\c customer_db

-- table yaratish
CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    author_id INT
);

-- table yaratish
CREATE TABLE IF NOT EXISTS authors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- tablega ma'lumot yozish
INSERT INTO authors (name) VALUES 
('Otkir Hoshimov'),
('Togay Murod');

-- tablega ma'lumot yozish
INSERT INTO books (name, author_id) VALUES
('Ikki eshik orasi', 1),
('Otkan kunlar', 1),
('Oydinda yurgan odamlar', 2),
('Ot kishnagan oqshom', 2);

-- INNER JOIN
SELECT b.id, b.name, a.name FROM books b INNER JOIN authors a ON b.author_id = a.id ORDER BY b.name DESC;
SELECT b.id, b.name, a.name FROM authors a INNER JOIN books b ON b.author_id = a.id WHERE b.id = 2;

-- staff jadvali
CREATE TABLE IF NOT EXISTS staff (
    staff_id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    address_id INT,
    email TEXT,
    store_id INT,
    active BOOLEAN,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- customer jadvali
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
CREATE TABLE IF NOT EXISTS payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INT,
    staff_id INT,
    rental_id INT,
    amount NUMERIC,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- staff jadvaliga ma'lumot qo'shish
INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES
    ('John', 'Doe', 1, 'john@example.com', 1, true, 'john.doe', 'password123'),
    ('Jane', 'Smith', 2, 'jane@example.com', 2, true, 'jane.smith', 'password456');

-- customer jadvaliga ma'lumot qo'shish
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date, last_update)
VALUES
    (1, 'Alice', 'Johnson', 'alice@example.com', 3, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Bob', 'Williams', 'bob@example.com', 4, true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- payment jadvaliga ma'lumot qo'shish
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES
    (1, 1, 1, 50.00, '2022-01-05 12:00:00'),
    (2, 2, 2, 75.00, '2022-01-06 14:30:00');

-- INNERT JOIN
SELECT
    c.customer_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    s.first_name AS staff_first_name,
    s.last_name AS staff_last_name,
    p.amount,
    p.payment_date
FROM
    customer c
INNER JOIN payment p ON p.customer_id = c.customer_id
INNER JOIN staff s ON p.staff_id = s.staff_id
ORDER BY
    p.payment_date;

-- USING
SELECT
	customer_id,
	first_name,
	last_name,
	amount,
	payment_date
FROM
	customer
INNER JOIN payment USING(customer_id)
ORDER BY payment_date;	