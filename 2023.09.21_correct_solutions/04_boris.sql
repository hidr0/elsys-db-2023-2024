-- (1) - Проверяваме дали базата данни съществува.
DROP DATABASE IF EXISTS school;

-- (2) - Създаваме базата данни
CREATE DATABASE school;

-- (3) - Използваме новата база данни
USE school;

-- (4) - Създаваме таблица
-- (5) - Добавяме колони
CREATE TABLE students (
	id int AUTO_INCREMENT PRIMARY KEY,
	name_ varchar(127),
	age int
);

-- (6) - Добавяме редове
INSERT INTO students(name_, age) VALUES ("A", 15);
INSERT INTO students(name_, age) VALUES ("B", 16);
INSERT INTO students(name_, age) VALUES ("C", 15);
INSERT INTO students(name_, age) VALUES ("D", 18);
INSERT INTO students(name_, age) VALUES ("E", 16);

-- (7) - Проверяваме таблицата
SELECT * FROM students;