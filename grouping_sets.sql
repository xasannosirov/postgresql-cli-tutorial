-- table yaratish
DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);
-- tablega ma'lumot yozish
INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);
-- GROUPING SETS
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment;
-- 
SELECT
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand;
-- 
SELECT
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
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
    segment
UNION ALL
SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand
UNION ALL
SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment
UNION ALL
SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;
-- 
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        (brand),
        (segment),
        ()
    );
-- 
SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
ORDER BY
	brand,
	segment;
-- 
SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
HAVING GROUPING(brand) = 0	
ORDER BY
	brand,
	segment;