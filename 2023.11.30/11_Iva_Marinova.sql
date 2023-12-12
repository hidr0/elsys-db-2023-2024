DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

DROP TABLE IF EXISTS Address;
CREATE TABLE Address (
    id int PRIMARY KEY auto_increment,
    street varchar(255)
);

INSERT INTO Address(street) VALUES ("Mladost 4, bl 437");
INSERT INTO Address(street) VALUES ("Malinova dolina, bl 70");

SELECT * FROM Address;

DROP TABLE IF EXISTS Students;
CREATE TABLE Students (
    id int PRIMARY KEY AUTO_INCREMENT,
    name varchar (255) not null unique,
    address_id int not null unique,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Students(name, address_id) VALUES("Misho", 1);
INSERT INTO Students(name, address_id) VALUES("Strahil", 2);

SELECT * FROM Students;

DROP TABLE IF EXISTS Subject;
CREATE TABLE Subject (
    id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Bazi danni")
);

INSERT INTO Subject(name) VALUES ("Math");
INSERT INTO Subject(name) VALUES ("Bazi danni");

SELECT * FROM Subject;

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int not null check(grade in (2,3,4,5,6)),
    subject_id int not null,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id int not null,
    FOREIGN KEY (student_id) REFERENCES Subject(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES (6, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (4, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (5, 1, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (3, 2, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (6, 2, 2);

INSERT INTO Address(street) VALUES("Tues");
INSERT INTO Students(name, address_id) VALUES("Uchenik bez ocenka", 3);
SELECT * FROM Address;
SELECT * FROM Students;
SELECT * FROM Grade;

-- [Улица, Ученик] За всеки ученик.
SELECT Students.name, Address.street FROM Students
LEFT JOIN Address ON Students.address_id = Address.id;

-- [Ученик, оценка] За всяка оценка.
SELECT Students.name, Grade.grade FROM Grade
LEFT JOIN Students ON Students.id = Grade.student_id;

-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям.
SELECT Students.name, AVG(Grade.grade) average_grade FROM Students
LEFT JOIN Grade ON Students.id = Grade.student_id
GROUP BY Students.id
ORDER BY average_grade;

-- Имeто на ученика с най-висок среден успех.
SELECT Students.name FROM Students
LEFT JOIN Grade ON Students.id = Grade.student_id
GROUP BY Students.id
ORDER BY AVG(Grade.grade) DESC LIMIT 1;

-- [Ученик, брой оценки] За всеки ученик.
SELECT Students.name, COUNT(Grade.grade) count_grades FROM Students
LEFT JOIN Grade ON Students.id = Grade.student_id
GROUP BY Students.id;

-- [Ученик, оценка, предмет] За всяка оценка.
SELECT Students.name, Grade.grade, Subject.name FROM Grade
LEFT JOIN Students ON Grade.student_id = Students.id
LEFT JOIN Subject ON Grade.subject_id = Subject.id;

-- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Students.name, Subject.name, AVG(Grade.grade) average_grade FROM Students
LEFT JOIN Grade ON Students.id = Grade.student_id
LEFT JOIN Subject ON Grade.subject_id = Subject.id
GROUP BY Students.name, Subject.name;
