-- 1
DROP DATABASE IF EXISTS gosho;

-- 2
CREATE DATABASE gosho;

-- 3
USE gosho;

-- 4
CREATE TABLE students (

-- 5 
	Age int,
    FirstName varchar(255)
);

-- 6
INSERT INTO students (Age, FirstName)
VALUES (17, "Kris");

-- 7
SELECT * FROM gosho.students;