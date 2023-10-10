DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
    id INT primary key AUTO_INCREMENT,
    name VARCHAR(65),
    age int
);

INSERT INTO Students(name) VAlUES('Misho bez godini');
INSERT INTO Students(name, age) VAlUES('Misho', 26);
INSERT INTO Students(name, age) VAlUES('Gosho', 20);
INSERT INTO Students(name, age) VAlUES('Pepi', 21);
INSERT INTO Students(name, age) VAlUES('Stefi', 24);

-- INSERT INTO Students VALUES(23, 'Misho', 26);

SELECT name, age FROM Students;
SELECT age, age, age, name FROM Students;
SELECT * FROM Students
WHERE age > 22;
SELECT * FROM Students
WHERE age > 20 AND age < 23;

SELECT * FROM Students
WHERE NOT age = 20
ORDER BY age ASC;

SELECT * FROM Students
WHERE age IS NULL;
SELECT * FROM Students
WHERE age IS NOT NULL;





-- get all entries with non NULL data and ordered by name

SELECT * FROM Students
WHERE age IS NOT NULL AND name IS NOT NULL
ORDER BY name ASC;

-- find all minors

SELECT * FROM Students
WHERE age < 18;

-- find all entries conatining NULL values
SELECT * FROM Students
WHERE age IS NULL OR name IS NULL;