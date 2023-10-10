DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200),
    age int
);

-- INSERT INTO Students VALUES("Kalatat", 17); //ne mozhe taka
INSERT INTO Students(name) VALUES("Kalatata");
INSERT INTO Students(name, age) VALUES("Mongoleca", 25);
INSERT INTO Students(name, age) VALUES("Kalatata", 17);
INSERT INTO Students(name, age) VALUES("Pethrovka", 17);
INSERT INTO Students(name, age) VALUES("Vankicha", 7);
INSERT INTO Students(age) VALUES(95);

-- SELECT * FROM Students;
-- SELECT name FROM Students;
-- SELECT age, age, id, name FROM Students;

SELECT * FROM Students
WHERE age < 17 || age > 17
ORDER BY age ASC;

SELECT * FROM Students
WHERE age != 7 -- NOT age = 7
ORDER BY age DESC;

SELECT * FROM Students
WHERE age IS NULL;

SELECT * FROM Students
WHERE age IS NOT NULL;

-- izbirame horata koito ne se kazvat "Kalatata" i go sortirame po golemina
SELECT * FROM Students
WHERE name != "Kalatata"
ORDER BY age ASC;

-- izbirame horata koito imat NULL kato stoinost na nyakoi parametur
SELECT * FROM Students
WHERE name IS NULL || age IS NULL;

-- izbirame horata nyamat NULL kato stoinost na nyakoi parametur i sa sortirani po golemina
SELECT * FROM Students
WHERE name IS NOT NULL AND age IS NOT NULL
ORDER BY age ASC;