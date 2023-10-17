DROP DATABASE IF EXISTS db;
CREATE DATABASE db;
USE db;

CREATE TABLE students(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(63),
    age INT
);

INSERT INTO students(name) VALUES("Baykushevata mura");
INSERT INTO students(name, age) VALUES("misho", 26);
INSERT INTO students(name, age) VALUES("Gosho", 20);
INSERT INTO students(name, age) VALUES("pepi", 21);
INSERT INTO students(name, age) VALUES("Stefi", 24);
INSERT INTO students(name) VALUES("butilka");
INSERT INTO students(name) VALUES("Prozorec");

SELECT * FROM students
WHERE age IS NOT NULL
ORDER BY id ASC;

-- избиране на всички без възраст подредени по азбучен ред
SELECT * FROM students
WHERE age IS NULL
ORDER BY name ASC;

-- избиране на всички с четна възраст и подредени по ID
SELECT * FROM students
WHERE age & 1 = 0
ORDER BY id ASC;

-- избиране на всички с име започващо с 'Б' и подредени по ID
SELECT * FROM students
WHERE name LIKE 'B%'
ORDER BY age ASC;