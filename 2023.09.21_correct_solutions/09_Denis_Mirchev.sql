-- (1)
DROP DATABASE IF EXISTS Students;
-- (2)
CREATE DATABASE Students;
-- (3)
USE Students;
-- (4) (5)
CREATE TABLE Students (
    student_id int AUTO_INCREMENT PRIMARY KEY,
    student_name varchar(255) NOT NULL,
    student_age int
);
-- (6)
INSERT INTO Students (student_id, student_name, student_age)
VALUES 
	(9, "Denis Mirchev", 17),
    (15, "John Doe", 18),
    (17, "John Smith", 16);
-- (7)
SELECT * FROM Students;