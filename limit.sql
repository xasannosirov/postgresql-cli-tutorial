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

-- LIMIT
SELECT first_name, email FROM customer ORDER BY first_name LIMIT 2;
SELECT last_name, email FROM customer ORDER BY last_name LIMIT 2 OFFSET 1;
SELECT last_name, first_name, email FROM customer ORDER BY email LIMIT 2;
SELECT last_name, email FROM customer ORDER BY email DESC LIMIT 2;