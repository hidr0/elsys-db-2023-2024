DROP DATABASE IF EXISTS School;
CREATE DATABASE School;
USE School;

CREATE TABLE Address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(200)
);
INSERT INTO Address(street) VALUES ("Mladost 4, bl 437");
INSERT INTO Address(street) VALUES ("Malinova dolina, bl 70");

SELECT * FROM Address;

CREATE TABLE Student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL UNIQUE,
    address_id INT NOT NULL UNIQUE,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES("Misho", 1);
-- INSERT INTO Student(name, address_id) VALUES("Pesho", 1);
-- This errors because address should be unique
INSERT INTO Student(name, address_id) VALUES("Strahil", 2);
SELECT * FROM Student;

CREATE TABLE Subject(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Bazi Danni")
);

INSERT INTO Subject(name) VALUES("Math");
INSERT INTO Subject(name) VALUES("Bazi Danni");
SELECT * FROM Subject;

CREATE TABLE Grade(
	id INT PRIMARY KEY AUTO_INCREMENT,
    grade INT NOT NULL CHECK(grade in (2, 3, 4, 5, 6)),
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(6, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(4, 1, 1);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(5, 1, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(3, 2, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(6, 2, 2);

INSERT INTO Address(street) VALUES("Tues");
INSERT INTO Student(name, address_id) VALUES("Uchenik bez ocenka", 3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;

--  [Улица, Ученик]  За всеки ученик.
--  [Ученик, оценка]  За всяка оценка.
--  [Ученик, оценка, предмет]  За всяка оценка.
--  [Ученик, среден успех]  За всеки ученик сортирано от най-нисък към най-голям.
--  [Ученик, брой оценки]  За всеки ученик.
--  [Ученик, предмет, среден успех]  За всеки ученик.
--   Името на ученика с най-висок среден успех.

SELECT name, street FROM Address
LEFT JOIN Student ON Address.id = Student.address_id;

SELECT name, grade FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id;

SELECT Student.name, grade, Subject.name FROM Student
LEFT JOIN Grade ON Student.id = student_id
LEFT JOIN Subject ON Subject.id = Grade.subject_id;

SELECT name, AVG(grade) FROM Student
LEFT JOIN Grade ON Student.id = student_id
GROUP BY Student.id
ORDER BY AVG(grade) ASC;

SELECT name, COUNT(grade) FROM Student
LEFT JOIN Grade ON Student.id = student_id
GROUP BY Student.id;

SELECT Student.name, Subject.name, AVG(grade) FROM Student
LEFT JOIN Grade ON Student.id = student_id
LEFT JOIN Subject ON Grade.subject_id = Subject.id
GROUP BY Student.id, Subject.name;

SELECT Student.name FROM Grade
LEFT JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1;



