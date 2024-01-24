-- table mavjud bo'lsa uni o'chirish
DROP TABLE IF EXISTS links;
-- table yaratish
CREATE TABLE links (
    id SERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255)
);
-- INSERT INTO
INSERT INTO 
    links (url, name)
VALUES
    ('https://www.google.com','Google'),
    ('https://www.yahoo.com','Yahoo'),
    ('https://www.bing.com','Bing');
-- INSERT INTO va RETURNING
INSERT INTO 
    links(url,name, description)
VALUES
    ('https://duckduckgo.com/','DuckDuckGo','Privacy & Simplified Search Engine'),
    ('https://swisscows.com/','Swisscows','Privacy safe WEB-search')
RETURNING *;
--
INSERT INTO 
    links(url,name, description)
VALUES
    ('https://www.searchencrypt.com/','SearchEncrypt','Search Encrypt'),
    ('https://www.startpage.com/','Startpage','The world''s most private search engine')
RETURNING id;