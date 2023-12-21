DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(200)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) not null unique,
    address_id int not null,
    Foreign KEY(address_id) REFERENCES Address(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Meth", "Bazi")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int not null check(grade in (2,3,4,5,6)),
    subject_id int not null,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int not null,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Address(street) values("MLadost4, bl 437");
INSERT INTO Address(street) values("Malinova dolina, bl 70");

select * from Address;

INSERT INTO Student(name, address_id) values("Pepi", 1);
INSERT INTO Student(name, address_id) values("Misho", 2);

INSERT INtO Subject(name) VALUES("Meth");
INSERT INtO Subject(name) VALUES("Bazi");
SELECT * FROM Subject;

INSERT INTO Grade(grade, subject_id, student_id) VALUES(6, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(5, 1, 1);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(4, 2, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(3, 1, 2);

INSERT INTO Address(street) values("TUES");
INSERT INTO Student(name, address_id) values("Bez ocenka", 3);

SELECT Student.name, grade FROM Grade
LEFT JOIN Student
ON student_id = Student.id;


-- [Улица, Ученик] За всеки ученик.
SELECT name, Address.street FROM Student
LEFT JOIN Address
On address_id = Address.id;

-- [Ученик, оценка] За всяка оценка.
SELECT Student.name, grade FROM Grade
LEFT JOIN Student
ON student_id = Student.id;

-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям.
SELECT Student.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY Student.id, Student.name
ORDER BY AVG(Grade.grade);

-- Името на ученика с най-висок среден успех.
SELECT Student.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY Student.id, Student.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1;

-- [Ученик, брой оценки] За всеки ученик.
SELECT Student.name, Count(Grade.id) FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY Student.name;

-- [Ученик, оценка, предмет] За всяка оценка.
SELECT Student.name, grade, Subject.name FROM Grade
LEFT JOIN Student
ON student_id = Student.id
LEFT JOIN Subject
ON subject_id = Subject.id;

-- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name, Subject.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Grade.subject_id = Subject.id
GROUP BY Student.id, Student.name, Subject.id, Subject.name
ORDER BY Student.name, Subject.name;