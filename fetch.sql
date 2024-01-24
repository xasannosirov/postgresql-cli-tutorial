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

-- FETCH
SELECT first_name, last_name FROM customer ORDER BY email FETCH FIRST ROW ONLY;
SELECT last_name, email FROM customer ORDER BY email FETCH FIRST 1 ROW ONLY;
SELECT last_name FROM customer ORDER BY email FETCH FIRST 4 ROW ONLY;
SELECT first_name, last_name FROM customer ORDER BY email OFFSET 5 ROWS FETCH FIRST 5 ROW ONLY;