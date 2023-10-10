DROP DATABASE IF  EXISTS classwork;
CREATE DATABASE classwork;
USE classwork;

CREATE TABLE Students(
id int primary key auto_increment,
name varchar(64),
age int
);

INSERT INTO Students(name) VALUES("Ivan");
INSERT INTO Students(name, age) VALUES("PEsho", 26);
INSERT INTO Students(name, age) VALUES("Gosho", 21);
INSERT INTO Students(name, age) VALUES("Pepi", 20);
INSERT INTO Students(name, age) VALUES("Dani", 23);
INSERT INTO Students(name, age) VALUES("Emo", 22);


SELECT age, age, age FROM  Students;
SELECT * FROM Students
WHERE 20<age || 26>age;


SELECT * FROM Students
WHERE NOT (age=20)
ORDER BY age ASC;

-- cheten age ot po malko kum po golqmo
SELECT * FROM Students
WHERE NOT (age%2=0)
ORDER BY age ASC;

-- necheten age ot po malko kum po golqmo
SELECT * FROM Students
WHERE NOT (age%2=1)
ORDER BY age ASC;

-- dali se dali age se deli na 3 i podrejam ot po malko kum po golqmo
SELECT * FROM Students
WHERE NOT (age%3=0)
ORDER BY age ASC;
