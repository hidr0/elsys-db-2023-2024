-- check if exists
DROP DATABASE IF EXISTS school;

-- create
CREATE DATABASE school;

-- use
USE school;

-- create table and columns
CREATE TABLE students (
	name_ varchar(31),
	age int CHECK(age <= 18)
);

-- add rows
INSERT INTO students
VALUES
("A", 15),
("B", 16),
("C", 15),
("D", 18),
("E", 16);

-- check
SELECT * FROM students;