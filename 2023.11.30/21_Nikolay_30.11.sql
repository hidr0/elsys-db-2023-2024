DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(200)
);

INSERT INTO Address(street) VALUES("Mladost 4, bl 564");
INSERT INTO Address(street) VALUES("Studentski grad, bl 33");
INSERT INTO Address(street) VALUES("Centar");
INSERT INTO Address(street) VALUES("Lyulin 13");

SELECT * FROM Address;

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(200) not null unique,
    address_id int not null unique,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);


INSERT INTO Student(name,address_id) VALUES("Misho", 1);
INSERT INTO Student(name,address_id) VALUES("Niki", 2);
INSERT INTO Student(name,address_id) VALUES("Bobi", 3);
INSERT INTO Student(name,address_id) VALUES("Bozhidar", 4);

SELECT * FROM Student;

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Maths","BEL","Ruski","Bazi danni")
);

INSERT INTO Subject(name) VALUES("BEL");
INSERT INTO Subject(name) VALUES("Ruski");

SELECT * FROM Subject;

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    grade int not null check(grade in(2,3,4,5,6)),
    subject_id int not null,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int not null,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade,subject_id,student_id) VALUES(6,2,2);
INSERT INTO Grade(grade,subject_id,student_id) VALUES(3,2,2);
INSERT INTO Grade(grade,subject_id,student_id) VALUES(3,2,1);
INSERT INTO Grade(grade,subject_id,student_id) VALUES(6,1,1);
INSERT INTO Grade(grade,subject_id,student_id) VALUES(4,1,2);
INSERT INTO Grade(grade,subject_id,student_id) VALUES(2,2,3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;

-- [Улица, Ученик] За всеки ученик.
SELECT Address.street, Student.name FROM Student
LEFT JOIN Address
ON Student.address_id = Address.id;
-- [Ученик, оценка] За всяка оценка.
SELECT Student.name, Grade.grade FROM Grade
LEFT JOIN Student
ON Student.id = Grade.student_id;
-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям.
SELECT Student.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade
ON Student.id = Grade.student_id
GROUP BY Student.name
ORDER BY AVG(Grade.grade) ASC;
-- Името на ученика с най-висок среден успех.
SELECT Student.name, AVG(Grade.grade) FROM Student
LEFT JOIN Grade
ON Student.id = Grade.student_id
GROUP BY Student.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1;
-- [Ученик, брой оценки] За всеки ученик.
SELECT Student.name, COUNT(Grade.grade) FROM Student
LEFT JOIN Grade
ON Student.id = Grade.student_id
GROUP BY Student.name;

-- [Ученик, оценка, предмет] За всяка оценка.
SELECT Student.name,Grade.grade,Subject.name FROM Grade
LEFT JOIN Student
ON Grade.student_id=student.id
LEFT JOIN Subject
ON Grade.subject_id = subject.id;
-- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name,Subject.name,AVG(Grade.grade) FROM Student
LEFT JOIN Grade
ON Grade.student_id=student.id
LEFT JOIN Subject
ON Grade.subject_id = subject.id
GROUP BY Student.name,Subject.name;
