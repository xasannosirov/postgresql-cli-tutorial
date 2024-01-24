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

-- order by 
SELECT first_name, last_name FROM customer ORDER BY first_name ASC;
SELECT first_name, last_name FROM customer ORDER BY last_name DESC;
SELECT first_name, last_name FROM customer ORDER BY first_name ASC, last_name DESC;
SELECT first_name, LENGTH(first_name) len FROM customer ORDER BY len DESC;

-- yangi table yaratish
CREATE TABLE sort_demo(
	num INT
);

-- tableni to'ldirish
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

-- order by
SELECT num FROM sort_demo ORDER BY num;
SELECT num FROM sort_demo ORDER BY num NULLS LAST;
SELECT num FROM sort_demo ORDER BY num NULLS FIRST;
SELECT num FROM sort_demo ORDER BY num DESC;
SELECT num FROM sort_demo ORDER BY num DESC NULLS LAST;