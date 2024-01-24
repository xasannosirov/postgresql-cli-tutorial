\c customer_db

-- table yaratish
CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

-- table yaratish
CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

-- tablega ma'lumot yozish
INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

-- tablega ma'lumot yozish
INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');

-- INNER JOIN
SELECT a, fruit_a, b, fruit_b FROM basket_a INNER JOIN basket_b ON fruit_a = fruit_b;

-- LEFT OUTHER JOIN
SELECT a, fruit_a, b, fruit_b FROM basket_a LEFT JOIN basket_b ON fruit_a = fruit_b;

-- LEFT OUTHER JOIN faqat left tabledagi qatorlar
SELECT a, fruit_a, b, fruit_b FROM basket_a LEFT JOIN basket_b  ON fruit_a = fruit_b WHERE b IS NULL;

-- RIGHT OUTHER JOIN
SELECT a, fruit_a, b, fruit_b FROM basket_a RIGHT JOIN basket_b ON fruit_a = fruit_b;

-- RIGHT OUTHER JOIN faqat right tabledagi qatorlar
SELECT a, fruit_a, b, fruit_b FROM basket_a RIGHT JOIN basket_b  ON fruit_a = fruit_b WHERE a IS NULL;

-- FULL OUTHER JOIN
SELECT a, fruit_a, b, fruit_b FROM basket_a FULL OUTER JOIN basket_b  ON fruit_a = fruit_b;

-- FULL OUTHER JOIN faqat ikkala jadvalga xos qatorlar
SELECT a, fruit_a, b, fruit_b FROM basket_a FULL JOIN basket_b  ON fruit_a = fruit_b WHERE a IS NULL OR b IS NULL;