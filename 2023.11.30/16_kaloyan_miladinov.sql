DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(200)
);

INSERT INTO Address(street) VALUES('Mladost 4, bl 437');
INSERT INTO Address(street) VALUES('Malinova Dolina, bl 70');

SELECT * FROM Address;

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) not null unique,
	address_id int not null unique,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES('Misho', 1);
-- This errors because address should be uique
-- INSERT INTO Student(name, address_id) VALUES("Pesho", 1);
INSERT INTO Student(name, address_id) VALUES('Strahil', 2);

SELECT * FROM Student;

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM('Math', 'Bazi Danni')
);
INSERT INTO Subject(name) VALUES('Math');
INSERT INTO Subject(name) VALUES('Bazi Danni');
SELECT * FROM Subject;

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int not null check(grade in (2,3,4,5,6)),
    subject_id int not null,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int not null,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(6,1,1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(4,1,1);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(5,1,2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(3,2,2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(6,2,2);

INSERT INTO Address(street) VALUES('Tues');
INSERT INTO Student(name, address_id) VALUES('Uchenik bez ocenka', 3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;

-- [Улица, Ученик] За всеки ученик.
SELECT Address.street, Student.name
FROM Address 
JOIN Student ON Student.address_id = Address.id;
-- [Ученик, оценка] За всяка оценка.
SELECT Student.name, Grade.grade 
FROM Student 
JOIN Grade ON Grade.student_id = Student.id;
-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям.
SELECT Student.id, Student.name, AVG(Grade.grade) AS Average_grade
FROM Student
JOIN Grade ON Grade.student_id = Student.id
GROUP BY Student.id, Student.name
ORDER BY Average_grade ASC;
-- Името на ученика с най-висок среден успех.
SELECT Student.name
FROM Student
JOIN Grade ON Grade.student_id = Student.id
GROUP BY Student.id, Student.name
ORDER BY AVG(Grade.grade) DESC
LIMIT 1;

-- [Ученик, брой оценки] За всеки ученик.
SELECT Student.id, Student.name, COUNT(Grade) AS Grades_count
FROM Student
JOIN Grade ON Grade.student_id = Student.id
GROUP BY Student.id, Student.name;

-- [Ученик, оценка, предмет] За всяка оценка.
SELECT Student.name, Grade.grade, Subject.name AS Subject_name 
FROM Grade 
JOIN Student ON Student.id = Grade.student_id 
JOIN Subject ON Subject.id = Grade.subject_id
GROUP BY Student.id, Student.name, Grade.grade, Subject.name;
-- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name, Subject.name AS Subject_name, AVG(Grade.grade) AS Average_grade
FROM Student
JOIN Grade ON Grade.student_id = Student.id
JOIN Subject ON Subject.id = Grade.subject_id
GROUP BY Student.id, Student.name, Subject.id, Subject.name;
