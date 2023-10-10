DROP DATABASE IF EXISTS Db;
CREATE DATABASE Db;
USE Db;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(63),
    age INT
);

INSERT INTO students(name) VALUES("Baykushevata mura");
INSERT INTO students(name, age) VALUES("misho", 26);
INSERT INTO students(name, age) VALUES("Gosho", 20);
INSERT INTO students(name, age) VALUES("pepi", 21);
INSERT INTO students(name, age) VALUES("Stefi", 24);
INSERT INTO students(name) VALUES("Kiril");
INSERT INTO students(name) VALUES("Konsrantin");

SELECT * FROM students
WHERE age IS NOT NULL
ORDER BY id ASC;

SELECT * FROM students
WHERE age IS NULL
ORDER BY name ASC;

SELECT * FROM students
WHERE age & 1 = 0
ORDER BY id ASC;

SELECT * FROM students
WHERE name LIKE 'B%'
ORDER BY age ASC;