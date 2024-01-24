-- database yaratish
CREATE DATABASE customer_db;

-- databasega ulanish
\c customer_db

-- table yaratish
CREATE TABLE IF NOT EXISTS customer (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL
);

-- tablega ma'lumot yozish
INSERT INTO customer(first_name, last_name, email) 
VALUES ('Xasan', 'Nosirov', 'xasannosirov094@gmail.com'),
('Ahrorbek', 'Alijonov', 'ahrorbek@gmail.com'),
('Anvarjon', 'Shavqiyev', 'arvarjonshavqiyev@gmail.com');

-- LIKE
SELECT * FROM customer WHERE first_name LIKE 'Ahror%';
SELECT 'foo' LIKE 'f%';
SELECT first_name, last_name FROM customer WHERE last_name LIKE '%ov' ORDER BY email;
SELECT first_name AS name, last_name AS surname, email AS contact FROM customer WHERE last_name LIKE '__avq%';
SELECT first_name, last_name FROM customer surname WHERE first_name NOT LIKE 'X%';
SELECT * FROM customer WHERE first_name ILIKE 'AHROR%';