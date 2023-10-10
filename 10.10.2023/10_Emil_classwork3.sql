DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(64),
	age INT
);

INSERT INTO Students(name) VALUES("Misho bez godini");
INSERT INTO Students(name, age) VALUES("Misho", 26);

-- INSERT INTO Students(age) VALUES(26);

-- INSERT INTO Students(name, age) VALUES(23, "Misho", 26);

INSERT INTO Students(name, age) VALUES("Gosho", 20);
INSERT INTO Students(name, age) VALUES("Pepi", 24);
INSERT INTO Students(name, age) VALUES("Stefi", 21);

SELECT * FROM Students;
SELECT name, age FROM Students;
SELECT age, name FROM Students;
SELECT age, age, age, name FROM Students;

SELECT * FROM Students
WHERE age > 22;

SELECT * FROM Students
WHERE 20 < age AND age < 23;
-- WHERE age < 20 OR age > 23;

SELECT * FROM Students
WHERE age != 20;

SELECT * FROM Students
WHERE NOT (age = 20)
ORDER BY age ASC;

SELECT * FROM Students
WHERE NOT (age = 20)
ORDER BY age DESC;

SELECT * FROM Students
WHERE age IS NULL;

SELECT * FROM Students
WHERE age IS NOT NULL;

-- Взима всички колони от таблицата Students, като подбира само хората с възраст над 23 години и ги подрежда във възходящ ред по години

SELECT * FROM Students
WHERE (age > 23)
ORDER BY age ASC;

-- Взима всички колони от таблицата Students и принтира само тези хора, чието id е нечетно и ги подрежда по низходящ ред

SELECT * FROM Students
WHERE NOT (id % 2 = 0)
ORDER BY age DESC;

-- Взима дамо имената от таблицата, подбирайки всикчи освен тези с име Misho и ги принтира по низходящ ред на годините

SELECT name FROM Students
WHERE (name != "Misho")
ORDER BY age DESC;
