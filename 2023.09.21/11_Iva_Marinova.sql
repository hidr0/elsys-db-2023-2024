-- 1
Drop database if exists students;
-- 2
Create database students;
-- 3
USE students;
-- 4 
CREATE TABLE if not exists all_students (
	name VARCHAR(40) NOT NULL,
	age INT NOT NULL);
 -- (5) (6)
 INSERT INTO all_students (name, age)
	VALUES("Iva", 17);
    
 INSERT INTO all_students (name, age)
	VALUES("Tomi", 16);
 -- (7)
 DESCRIBE students_table;