DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(200)
);

INSERT INTO Address(street) VALUES("Mladost 4, bl 437"), ("Malinova Dolina, bl 70");

SELECT * FROM Address;

CREATE TABLE Student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL UNIQUE,
    address_id INT NOT NULL,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES("Misho", 1); 
-- Should be unique
-- INSERT INTO Student(name, address_id) VALUES("Pesho", 1);

INSERT INTO Student(name, address_id) VALUES("Strahil", 2); 

SELECT * FROM Student;

CREATE TABLE Subject(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Bazi Danni")
);

INSERT INTO Subject(name) VALUES("Math"), ("Bazi Danni");
SELECT * FROM Subject;

CREATE TABLE Grade(
		id INT PRIMARY KEY AUTO_INCREMENT,
	    grade INT NOT NULL CHECK(grade IN(2, 3, 4, 5, 6)),
	    subject_id INT NOT NULL,
	    FOREIGN KEY(subject_id) REFERENCES Subject(id),
	    student_id INT NOT NULL, 
		FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(6, 1, 1), (4, 1, 1), (5, 1, 2), (6, 2, 2);

INSERT INTO Address(street) VALUES("TUES");
INSERT INTO Student(name, address_id) VALUES("Uchenik bez ocenka", 3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;
-----------------------------------------------------------------------

--  [ученик, улица] за всеки ученик.
SELECT Address.street, Student.name FROM Student
LEFT JOIN Address ON Student.address_id = Address.id;

--  [оценка, ученик] за всяка оценка.
SELECT Student.name, Grade.grade FROM Grade
LEFT JOIN Student ON Grade.student_id = Student.id;

--  [среден успех, ученик] за всеку ученик, сортирани от най-нисък към висок
SELECT Student.name, AVG(Grade.grade) FROM Grade
LEFT JOIN Student ON Student.id = Grade.student_id
GROUP BY Student.id
ORDER BY AVG(Grade.grade) ASC;

--  ученик с най-висок среден.
SELECT Student.name, AVG(Grade.grade) FROM Grade
LEFT JOIN Student ON Student.id = Grade.student_id
GROUP BY Student.name
ORDER BY AVG(Grade.grade) DESC LIMIT 1;

--  [брой оценки, ученик] за всеку ученик.
SELECT Student.name, COUNT(Grade.id) AS num_grades FROM Student
LEFT JOIN Grade ON Student.id = Grade.student_id
GROUP BY Student.id;

--  [улица, ученик] за всеку ученик.
SELECT Address.street, Student.name FROM Student
LEFT JOIN Address ON Student.address_id = Address.id;

--  [ученик, предемт, оценка] за всеку оценка.
SELECT Student.name, Grade.grade, Subject.name FROM Grade
JOIN Student ON Grade.student_id = Student.id
JOIN Subject ON Grade.subject_id = Subject.id;

--  [ученик, предемт, среден успех] за всеку уч.
SELECT Student.name, Subject.name, AVG(Grade.grade) AS average_grade FROM Student
JOIN Grade ON Student.id = Grade.student_id
JOIN Subject ON Grade.subject_id = Subject.id
GROUP BY Student.id, Subject.id;
