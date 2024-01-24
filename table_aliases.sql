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

-- table aliases dan foydalanish va INNER JOIN
SELECT b.id, b.name, a.name FROM books b INNER JOIN authors a ON b.author_id = a.id ORDER BY b.name DESC;