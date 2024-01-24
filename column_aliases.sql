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

-- column aliases
SELECT email AS contact FROM customer;
SELECT first_name AS name FROM customer;
SELECT first_name name FROM customer;
SELECT first_name, last_name AS surname FROM customer;
SELECT first_name || ' ' || last_name AS full_name FROM customer;
SELECT first_name || ' ' || last_name "full name" FROM customer;