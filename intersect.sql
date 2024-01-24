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

-- INTERSECT
SELECT id FROM books
INTERSECT
SELECT id FROM authors;
-- 
SELECT id FROM books
INTERSECT
SELECT id FROM authors
ORDER BY id;