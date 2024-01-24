-- table mavjud bo'lsa uni o'chrish
DROP TABLE IF EXISTS contacts;
-- table yaratish
CREATE TABLE contacts(
   contact_id serial PRIMARY KEY,
   first_name varchar(50) NOT NULL,
   last_name varchar(50) NOT NULL,
   phone varchar(15) NOT NULL
);
-- table mavjud bo'lsa uni o'chrish
DROP TABLE IF EXISTS blacklist;
CREATE TABLE blacklist(
    phone varchar(15) PRIMARY KEY
);
-- tablega ma'lumot yozish
INSERT INTO contacts(first_name, last_name, phone)
VALUES ('John','Doe','(408)-523-9874'),
       ('Jane','Doe','(408)-511-9876'),
       ('Lily','Bush','(408)-124-9221');
-- tablega ma'lumot yozish
INSERT INTO blacklist(phone)
VALUES ('(408)-523-9874'),
       ('(408)-511-9876');
-- DELETE JOIN
DELETE FROM contacts 
USING blacklist
WHERE contacts.phone = blacklist.phone;
-- 
SELECT * FROM contacts;
-- 
DELETE FROM contacts
WHERE phone IN (SELECT phone FROM blacklist);