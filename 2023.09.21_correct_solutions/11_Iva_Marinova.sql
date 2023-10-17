-- 1
DROP DATABASE IF EXISTS Students;

-- 2
CREATE DATABASE Students;

-- 3
USE Students;

-- 4 - 5
CREATE TABLE AllStudents (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	age INT NOT NULL);
    
 -- 6
 INSERT INTO AllStudents (name, age)
	VALUES("Iva", 17);
    
 INSERT INTO AllStudents (name, age)
	VALUES("Tomi", 16);
    
 -- 7
 DESCRIBE AllStudents;
