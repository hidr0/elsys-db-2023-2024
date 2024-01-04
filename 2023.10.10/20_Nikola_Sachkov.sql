DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200),
    age INT
);

INSERT INTO Students(name) VALUES("Misho bez godini");
INSERT INTO Students(name, age) VALUES("Misho", 26);
INSERT INTO Students(name, age) VALUES("Gosho", 20);
INSERT INTO Students(name, age) VALUES("Pepi", 21);
INSERT INTO Students(name, age) VALUES("Stefi", 24);

SELECT * FROM Students;
SELECT name, age FROM Students;
SELECT age, name FROM Students;
SELECT age, age, age, name FROM Students;

SELECT * FROM Students
WHERE  age > 22;

SELECT * FROM Students
WHERE age < 20 OR age > 23;

SELECT * FROM Students
WHERE NOT age = 20;

SELECT * FROM Students
WHERE NOT age = 20
ORDER BY age ASC;

SELECT * FROM Students
WHERE NOT age = 20
ORDER BY age DESC;

SELECT * FROM Students
WHERE age IS NOT NULL;

SELECT name FROM Students
WHERE age > 22;

SELECT * FROM Students
WHERE age >= 20 AND age <= 23;

SELECT * FROM Students
WHERE age IS NOT NULL
ORDER BY age DESC;