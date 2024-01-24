-- database yaratish
CREATE DATABASE customer_db;

-- databasega ulanish
\c customer_db

-- table yaratish
CREATE TABLE contacts(
    id SERIAL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    PRIMARY KEY (id)
);

-- tablega ma'lumot yozish
INSERT INTO contacts(first_name, last_name, email, phone) VALUES 
('John','Doe','john.doe@example.com',NULL),
('Lily','Bush','lily.bush@example.com','(408-234-2764)');

-- IS NULL
SELECT id, first_name, last_name, email, phone FROM contacts WHERE phone = NULL;
SELECT id, first_name, last_name, email, phone FROM contacts WHERE phone IS NULL;
SELECT id, first_name, last_name, email, phone FROM contacts WHERE phone IS NOT NULL;