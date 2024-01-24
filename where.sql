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

-- WHERE
SELECT last_name, first_name FROM customer WHERE first_name = 'Xasan';
SELECT last_name, first_name FROM customer WHERE first_name = 'Ahrorbek' AND last_name = 'Alijonov';
SELECT first_name, last_name FROM customer WHERE last_name = 'Shavqiyev' OR  first_name = 'Ahrorbek';
SELECT first_name, last_name FROM customer WHERE first_name IN ('Xasan','Anvarjon');
SELECT first_name, last_name FROM customer WHERE first_name LIKE 'Ahror%';
SELECT first_name, LENGTH(first_name) name_length FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) BETWEEN 8 AND 10 ORDER BY name_length;
SELECT first_name, last_name FROM customer WHERE first_name LIKE 'Anvar%' AND last_name <> 'Nosirov';