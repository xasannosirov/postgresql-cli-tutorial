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

-- IN
SELECT * FROM customer WHERE email IN ('xasannosirov094@gmail.com', 'ahrorbek@gmail.com');
SELECT last_name AS surname, first_name, email FROM customer WHERE email IN ('xasannosirov094@gmail.com', 'ahrorbek@gmail.com') ORDER BY first_name DESC;
SELECT * FROM customer WHERE email NOT IN ('xasannosirov094@gmail.com');
SELECT first_name FROM customer WHERE CAST (last_name AS VARCHAR(60)) = 'Nosirov' ORDER BY email;
SELECT first_name FROM customer WHERE email IN (SELECT email FROM customer WHERE email IN ('ahrorbek@gmail.com','xasannosirov094@gmail.com')) ORDER BY email;
