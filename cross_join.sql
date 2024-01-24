-- agar mavjud bo'lsa tableni o'chirsh 
DROP TABLE IF EXISTS T1;
DROP TABLE IF EXISTS T2;

-- table yaratish
CREATE TABLE T1 (
	label CHAR(1) PRIMARY KEY
);

CREATE TABLE T2 (
	score INT PRIMARY KEY
);

-- tableni ma'lumot bilan to'ldirish
INSERT INTO T1 (label)
VALUES
	('A'),
	('B');

INSERT INTO T2 (score)
VALUES
	(1),
	(2),
	(3);

-- CROSS JOIN
SELECT *
FROM T1
CROSS JOIN T2;