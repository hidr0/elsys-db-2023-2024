-- 1 - Проверяваме дали базара данни съществува.
DROP DATABASE IF EXISTS Students;

-- 2 - Създаваме базата данни
CREATE DATABASE Students;

-- 3 - Използваме базата данни от (2)
USE Students;

-- 4 - Създаваме таблица
-- 5 - Добавяме колони
CREATE TABLE Students(
  id int AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  age int
);

-- 6 - Добавяме редове
INSERT INTO Students(name, age) VALUES("Kris", 17);
INSERT INTO Students(name, age) VALUES("Mihail", 19);
INSERT INTO Students(name, age) VALUES("Andrey", 14);

-- 7 - Записваме
SELECT * FROM Students;
