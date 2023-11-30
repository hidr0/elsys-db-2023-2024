DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
    id int PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(200)
);

INSERT INTO Address(street) VALUES ("Mladost 4, bl 437");
INSERT INTO Address(street) VALUES ("Malinova Dolina, bl 70");

SELECT * FROM Address;

CREATE TABLE Student(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) not null unique,
    address_id int not null unique,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES ("Misho", 1);
-- This errors because address should be unique
-- INSERT INTO Student(name, address_id) VALUES ("Pesho", 1);
INSERT INTO Student(name, address_id) VALUES ("Strahil", 2);

SELECT * FROM Student;

CREATE TABLE Subject(
    id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Bazi Danni")
);

INSERT INTO Subject(name) VALUES ("Math");
INSERT INTO Subject(name) VALUES ("Bazi Danni");
SELECT * FROM Subject;

CREATE TABLE Grade(
    id int PRIMARY KEY AUTO_INCREMENT,
    grade int not null check(grade >= 2 and grade <= 6),
    subject_id int not null,
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    student_id int not null,
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES (6, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (4, 1, 1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (5, 1, 2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES (3, 2, 2);

INSERT INTO Address(street) VALUES ("Tues");
INSERT INTO Student(name, address_id) VALUES ("Uchenik bez ocenka", 3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;

-- QUERIES:

SELECT Address.street, Student.* FROM Student LEFT JOIN Address ON Student.address_id = Address.id;
SELECT Student.*, Grade.grade FROM Grade LEFT JOIN Student ON Grade.student_id = Student.id;
SELECT Student.*, AVG(Grade.grade) FROM Student LEFT JOIN Grade ON Grade.student_id = Student.id GROUP BY Student.name ORDER BY AVG(Grade.grade) ASC;
SELECT Student.name FROM Student LEFT JOIN Grade ON Grade.student_id = Student.id GROUP BY Student.name ORDER BY AVG(Grade.grade) DESC LIMIT 1;
SELECT Student.*, COUNT(Grade.grade) FROM Student LEFT JOIN Grade ON Grade.student_id = Student.id GROUP BY Student.name;

SELECT Student.*, Grade.grade, Subject.* FROM Grade LEFT JOIN Student ON Grade.student_id = Student.id LEFT JOIN Subject ON Grade.subject_id = Subject.id;
SELECT Student.*, Subject.*, AVG(Grade.grade) 
FROM Grade 
LEFT JOIN Student ON Grade.student_id = Student.id 
LEFT JOIN Subject ON Grade.subject_id = Subject.id 
GROUP BY Student.id, Subject.id, Student.name, Subject.name;
