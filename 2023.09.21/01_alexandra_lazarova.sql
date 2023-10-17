-- (1)
Drop database if exists students;
-- (2)
Create database students;
-- (3)
USE students;
-- (4) 
CREATE TABLE if not exists students_table (
 name VARCHAR(30) NOT NULL,
 age INT NOT NULL);
 -- (5) (6)
 INSERT INTO students_table VALUE("Alexandra", 17);
 INSERT INTO students_table VALUE("Iva", 17);
 -- (7)
 DESCRIBE students_table;