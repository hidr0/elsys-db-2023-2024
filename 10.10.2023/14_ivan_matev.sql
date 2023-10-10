DROP DATABASE IF EXISTS classwork3;
CREATE DATABASE classwork3;
USE classwork3;

CREATE TABLE Students(
	id int PRIMARY KEY auto_increment,
    name varchar(123),
    age int
);

INSERT INTO Students(name) VALUES("MISHO bez  godini");
INSERT INTO Students(name, age) VALUES("MISHO", 33);
INSERT INTO Students(name, age) VALUES("Pesho", 13);
INSERT INTO Students(name, age) VALUES("Ivan", 88);
INSERT INTO Students(name, age) VALUES("Viktor", 21);
INSERT INTO Students(name, age) VALUES("Dimitur", -67);

-- SELECT * FROM Students;
-- SELECT age, name FROM Students;
-- SELECT name, age FROM Students;
-- SELECT age, age, age, name FROM Students;

-- SELECT * FROM Students
-- Where age > 20;
-- SELECT * FROM Students
-- Where age > 23 OR age < 20;

-- SELECT * FROM Students
-- Where age != 21
-- ORDER BY age ASC;

-- SELECT * FROM Students
-- Where age != 21
-- ORDER BY age DESC;

-- SELECT * FROM Students
-- Where age IS NOT NULL;

-- SELECT * FROM Students
-- Where age IS NULL;

-- Izbirame vsichki uchenici NAD 20 godini, s izkluchenie na tezi na TOCHNO 21
SELECT * FROM Students
Where age != 21 && age > 20;


-- Izbirame vsichki uchenici POD 20 godini, i gi podrejdame v nizhodqsht red
SELECT * FROM Students
Where age < 20
ORDER BY age DESC;

-- Izbirame vsichki uchenici s zadadeni godini, i gi podrejdame vuv vuzhodqsht red
SELECT * FROM Students
Where age IS NOT NULL
ORDER BY age ASC;
