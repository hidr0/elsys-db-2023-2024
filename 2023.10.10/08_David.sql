-- Изтриване на базата данни, ако съществува
DROP DATABASE IF EXISTS University;

-- Създаване на нова база данни с име 'University'
CREATE DATABASE University;

-- Промяна на текущата база данни на 'University'
USE University;

-- Създаване на таблица 'Студенти'
CREATE TABLE Students (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  age INT
);

-- Въвеждане на данни в таблицата 'Студенти'
INSERT INTO Students(name, age) VALUES("Mickey Mouse", 90);
INSERT INTO Students(name, age) VALUES("Sponge Bob", 22);
INSERT INTO Students(name, age) VALUES("Alice", 25);
INSERT INTO Students(name, age) VALUES("Candice", 30);
INSERT INTO Students(name, age) VALUES("Bob", NULL);
INSERT INTO Students(name, age) VALUES("Candice", 30);
INSERT INTO Students(name, age) VALUES("BJF", NULL);

-- Избор на хора на възраст над определена стойност (например, над 25 години)
SELECT * FROM Students WHERE age > 25;

-- Избор на хора с известна възраст
SELECT * FROM Students WHERE age IS NOT NULL;

-- Избор на броя студенти в базата данни
SELECT COUNT(*) FROM Students;

-- Изчисляване на средната възраст на студентите
SELECT AVG(age) FROM Students;

-- Изтриване на базата данни 'University'
DROP DATABASE University;
