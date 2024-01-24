-- table yaratish
DROP TABLE sales;
CREATE TABLE IF NOT EXISTS sales (
    sale_id SERIAL PRIMARY KEY,
    brand TEXT NOT NULL,
    segment TEXT NOT NULL,
    quantity INT NOT NULL
);
-- Ma'lumotlarni qo'shish
INSERT INTO sales (brand, segment, quantity)
VALUES
    ('Brand1', 'SegmentA', 10),
    ('Brand1', 'SegmentB', 15),
    ('Brand2', 'SegmentA', 20),
    ('Brand2', 'SegmentB', 25);
-- CUBE
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    CUBE (brand, segment)
ORDER BY
    brand,
    segment;
-- 
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    CUBE (segment)
ORDER BY
    brand,
    segment;