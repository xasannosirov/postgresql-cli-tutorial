-- table mavjud bo'lsa uni o'chirish
DROP TABLE IF EXISTS links;
-- table yaratish
CREATE TABLE links (
	id SERIAL PRIMARY KEY,
	url VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR (255),
        last_update DATE
);
-- INSERT
INSERT INTO links (url, name) VALUES
('https://www.postgresqltutorial.com','PostgreSQL Tutorial');
-- 
INSERT INTO links (url, name) VALUES
('http://www.oreilly.com','O''Reilly Media'),
('http://www.postgresql.org','PostgreSQL');
-- 
INSERT INTO links(url, name, last_update) VALUES
('https://www.google.com','Google','2013-06-01');