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

-- BETWEEN
SELECT first_name AS name, last_name AS surname, email AS contact FROM customer WHERE id BETWEEN 1 AND 4;
SELECT first_name, last_name AS surname, email AS contact FROM customer WHERE id NOT BETWEEN 1 AND 2;