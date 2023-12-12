DROP DATABASE IF EXISTS School;
CREATE DATABASE School;
USE School;

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(200)
);

INSERT INTO Address(street) VALUES("Mladost 4, bl 47");
INSERT INTO Address(street) VALUES("Geo Milev, bl 29");

-- SELECT * FROM Address;

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) not null unique,
    address_id int not null unique,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES("Kalata", 2);
-- this errors because address should be unique
-- INSERT INTO Student(name, address_id) VALUES("Pesho", 2);
INSERT INTO Student(name, address_id) VALUES("Galab", 1);

-- SELECT * FROM Student;

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Bazi danni")
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bazi danni");
SELECT * FROM Subject;

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int not null check(grade in (2,3,4,5,6)),
    subject_id int not null,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int not null,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(6, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(4, 2, 1);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(3, 1, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(5, 1, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(6, 2, 2);

INSERT INTO Address(street) VALUES("Zona B5");
INSERT INTO Student(name, address_id) VALUES("Toshko", 3);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(2, 1, 3);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(3, 2, 3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;

-- 1 - изведете [улица, ученик] за всеки ученик

SELECT * FROM Student
LEFT JOIN Address
ON Student.address_id = Address.id;

-- 2 - изведете [ученик, оценка] за всяка оценка

SELECT * FROM Grade
LEFT JOIN Student
ON Grade.student_id = Student.id;

-- 3 - изведете [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям

-- 3 - изведете [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям
SELECT Student.name, AVG(Grade.grade)
FROM Grade
JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.id;

-- 4 - изведете Името на ученика с най-висок среден успех.
SELECT Student.name, AVG(Grade.grade) as avg_grade
FROM Grade
JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.id
ORDER BY avg_grade DESC LIMIT 1;

-- 5 - изведете [Ученик, брой оценки] За всеки ученик.
SELECT Student.name, COUNT(Grade.id) as num_grades
FROM Grade
JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.id;

-- 6 - изведете [Ученик, оценка, предмет] За всяка оценка.
SELECT Student.name, Grade.grade, Subject.name
FROM Grade
JOIN Student ON Grade.student_id = Student.id
JOIN Subject ON Grade.subject_id = Subject.id;

-- 7 - изведете [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name, Subject.name, AVG(Grade.grade)
FROM Grade
JOIN Student ON Grade.student_id = Student.id
JOIN Subject ON Grade.subject_id = Subject.id
GROUP BY Student.id, Subject.id;
