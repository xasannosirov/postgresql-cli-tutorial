-- table mavjud bo'lsa uni o'chirish
DROP TABLE IF EXISTS sales;
-- table yaratish
CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);
-- tbalega ma'lumot yozish
INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);
-- ROLLUP
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (brand, segment)
ORDER BY
    brand,
    segment;
-- 
SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (segment, brand)
ORDER BY
    segment,
    brand;
-- 
SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment,
    ROLLUP (brand)
ORDER BY
    segment,
    brand;
-- table yaratish
DROP TABLE rental;
CREATE TABLE IF NOT EXISTS rental (
    rental_id SERIAL PRIMARY KEY,
    rental_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    inventory_id INT,
    customer_id INT,
    return_date TIMESTAMP,
    staff_id INT,
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- 
SELECT
    EXTRACT (YEAR FROM rental_date) y,
    EXTRACT (MONTH FROM rental_date) M,
    EXTRACT (DAY FROM rental_date) d,
    COUNT (rental_id)
FROM
    rental
GROUP BY
    ROLLUP (
        EXTRACT (YEAR FROM rental_date),
        EXTRACT (MONTH FROM rental_date),
        EXTRACT (DAY FROM rental_date)
    );