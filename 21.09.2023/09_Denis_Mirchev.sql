-- (1)
DROP DATABASE IF EXISTS school;
-- (2)
CREATE DATABASE school;
-- (3)
USE school;
-- (4) (5)
CREATE TABLE students (
    student_id int UNSIGNED,
    student_firstname varchar(255) NOT NULL,
    student_lastname varchar(255) NOT NULL,
    student_age int UNSIGNED
);
-- (6)
INSERT INTO students (student_id, student_firstname, student_lastname, student_age)
VALUES 
	(9, "Denis", "Mirchev", 17),
    (15, "John", "Doe", 18),
    (17, "John", "Smith", 16);
-- (7)
SELECT * FROM students;