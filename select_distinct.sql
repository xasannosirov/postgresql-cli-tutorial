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

-- DISTINCT
SELECT DISTINCT first_name FROM customer;
SELECT DISTINCT first_name, last_name FROM customer;
SELECT DISTINCT ON (first_name) email, last_name FROM customer ORDER BY first_name, last_name;

-- yangi table yaratish
CREATE TABLE distinct_demo (
	id serial NOT NULL PRIMARY KEY,
	bcolor VARCHAR,
	fcolor VARCHAR
);

-- tableni to'ldirish
INSERT INTO distinct_demo (bcolor, fcolor) VALUES
('red', 'red'),
('red', 'red'),
('red', NULL),
(NULL, 'red'),
('red', 'green'),
('red', 'blue'),
('green', 'red'),
('green', 'blue'),
('green', 'green'),
('blue', 'red'),
('blue', 'green'),
('blue', 'blue');

-- DISTINCT and ORDER BY
SELECT DISTINCT bcolor FROM distinct_demo ORDER BY bcolor;
SELECT DISTINCT bcolor, fcolor FROM distinct_demo ORDER BY bcolor, fcolor;
SELECT DISTINCT ON (bcolor) bcolor, fcolor FROM distinct_demo ORDER BY bcolor, fcolor;