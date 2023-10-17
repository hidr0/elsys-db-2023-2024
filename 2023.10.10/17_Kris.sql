DROP DATABASE IF EXISTS Classwork;
CREATE DATABASE Classwork;
USE Classwork;

CREATE TABLE Students(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(64),
    age int
);

INSERT INTO Students(name, age) VALUE("Kriskata", 17);
INSERT INTO Students(name, age) VALUE("Stamateca", NULL);
INSERT INTO Students(name, age) VALUE("Dankata", 45);
INSERT INTO Students(name, age) VALUE("Mladenkata", 9);
INSERT INTO Students(name, age) VALUE("Embeca", 22);
INSERT INTO Students(name, age) VALUE("Rikoshetko", NULL);

-- SELECT * FROM Students;
-- SELECT id, name, age, name, id FROM Students;

-- SELECT * FROM Students WHERE age >= 22;
-- SELECT * FROM Students WHERE age <= 20 || age >= 23;

-- SELECT * FROM Students ORDER BY age ASC;
-- SELECT * FROM Students ORDER BY age DESC;

-- SELECT * FROM Students WHERE age IS NOT NULL;
-- SELECT * FROM Students WHERE age IS NULL;

-- Нарежда учениците по азбучен ред по имена.
SELECT * FROM Students ORDER BY name ASC;

-- Нарежда учениците по обратен на азбучния ред по имена.
SELECT * FROM Students ORDER BY name DESC;

-- Извежда учениците с валидни години (където не са NULL).
SELECT * FROM Students WHERE age IS NOT NULL;