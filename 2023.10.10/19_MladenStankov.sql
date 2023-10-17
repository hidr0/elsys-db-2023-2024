DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE STUDENTS(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200),
    age int
);

INSERT INTO Students(name, age) VALUES("Misho", 25);
INSERT INTO Students(name, age) VALUES("Ne", 23);
INSERT INTO Students(name, age) VALUES("Da", 24);
INSERT INTO Students(name, age) VALUES(NULL, 24);
INSERT INTO Students(name, age) VALUES(NULL, 10);
INSERT INTO Students(name, age) VALUES(NULL, 22);
INSERT INTO Students(name, age) VALUES("abc", NULL);
INSERT INTO Students(name, age) VALUES("acb", NULL);
INSERT INTO Students(name, age) VALUES("bca", NULL);

-- Показване на цялата информация от Students
SELECT * FROM Students;

-- Показване на информацията в коята (age) < 24 или (age) > 25.
-- Също (age) не може да е NULL. Подрежда ги в низходящ ред. 
SELECT * FROM Students
WHERE age < 24 || age > 24 AND age IS NOT NULL
ORDER BY age DESC;

-- Показване на информацията в коята (name) не е NULL.
-- Подрежда ги в възходящ азбучен ред.
SELECT * FROM Students
WHERE name IS NOT NULL
ORDER BY name ASC;