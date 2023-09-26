-- 1 
DROP DATABASE IF EXISTS Students;
-- 2 
CREATE DATABASE Students;
-- 3 
USE Students;

-- 4 
-- 5 
CREATE TABLE students_table(
  id int AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  age INT NOT NULL
);
-- 6 

INSERT INTO students_table(name, age) VALUES("Misho", 26);
INSERT INTO students_table(name, age) VALUES("Gosho", 26);
INSERT INTO students_table(name, age) VALUES("Pesho", 26);
-- 7 
SHOW tables;
SELECT * FROM students_table;