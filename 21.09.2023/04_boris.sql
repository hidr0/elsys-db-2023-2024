-- (1)
DROP DATABASE IF EXISTS school;

-- (2)
CREATE DATABASE school;

-- (3)
USE school;

-- (4) & (5)
CREATE TABLE students (
	name_ varchar(31),
	age int CHECK(age <= 18)
);

-- (6)
INSERT INTO students
VALUES
("A", 15),
("B", 16),
("C", 15),
("D", 18),
("E", 16);

-- (7)
SELECT * FROM students;