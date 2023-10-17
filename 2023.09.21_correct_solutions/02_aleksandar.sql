-- (1)
DROP DATABASE IF EXISTS children;  
-- (2)
CREATE DATABASE children;
-- (3)
USE children;
-- (4) (5) 
CREATE TABLE students(
	id int AUTO_INCREMENT PRIMARY KEY,
	name tinytext,
	age tinyint
);
-- (6) 
INSERT INTO students(name, age) VALUES("Gosho", 127);
INSERT INTO students(name, age) VALUES("Pesho", 12);
-- (7) gosho is about 127 i think
SELECT * FROM students;
