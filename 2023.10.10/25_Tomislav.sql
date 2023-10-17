DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE students(
	Id int PRIMARY KEY AUTO_INCREMENT,
    Name varchar(64),
	Age int
);

INSERT INTO students(Name, Age) VALUES("Tomi", 17);
INSERT INTO students(Name) VALUES("Tomi bez godini");
INSERT INTO students(Name) VALUES("Oshte nerodeno bebe");
-- INSERT INTO students VALUES(24, "Tomi", 17);
INSERT INTO students(Name, Age) VALUES("Iva", 18);
INSERT INTO students(Name, Age) VALUES("Ali", 20);
INSERT INTO students(Name, Age) VALUES("Praschu", 5);
INSERT INTO students(Name, Age) VALUES("Kolio", 3);
INSERT INTO students(Name, Age) VALUES("KapitanKarpuzova", 24);

SELECT * FROM students;
SELECT Age, Name FROM students;
SELECT Name, Age FROM students;
SELECT Age, Age, Name FROM students;

SELECT * FROM students
WHERE Age <= 5;

SELECT * FROM students
WHERE Age < 17 OR age > 23;

SELECT * FROM students
WHERE (NOT (Age = 17))
ORDER BY age ASC;

SELECT * FROM students
WHERE (NOT (Age = 17))
ORDER BY age DESC;

SELECT * FROM students
WHERE Age IS NOT NULL;


-- vsicki pulnoletni
SELECT * FROM students
WHERE Age > 18
ORDER BY age ASC;

-- samo tezi, koito nqmat age
SELECT * FROM students
WHERE Age IS NULL;

-- pokazva samo godinite ot naj-star do naj-mlad
SELECT Age FROM students
ORDER BY Age DESC;

