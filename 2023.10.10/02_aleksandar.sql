DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE students(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200),
    age int
);

INSERT INTO students(name, age) VALUES("Joe", 74);
INSERT INTO students(name, age) VALUES("Biden", 75);
INSERT INTO students(name, age) VALUES("Joe", 76);
INSERT INTO students(name, age) VALUES("Biden", 78);
INSERT INTO students(name) VALUES("not a number");

-- take all people named joe or who have an id > 4

SELECT * FROM students WHERE 
name = "joe" OR id > 4;

-- take everyone sorted by age and print their age 7 times if they have an age

SELECT name, age, age, age, age, age, age, age FROM students 
WHERE age IS NOT NULL
ORDER BY age;

-- return everyone sorted by their age - id * 2 descending, if they are not named Biden

SELECT * FROM students 
WHERE NOT name = "Biden" 
ORDER BY age - id * 2 DESC;