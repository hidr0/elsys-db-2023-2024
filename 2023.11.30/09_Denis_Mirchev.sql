DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(200)
);

INSERT INTO Address(street) VALUES("Mladost 4, bl 437");
INSERT INTO Address(street) VALUES("Malinova Dolina, bl 70");

SELECT * FROM Address;

CREATE TABLE Student(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL UNIQUE,
    address_id INT NOT NULL,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES("Misho", 1);
-- address_id is unique!!!
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
        grade INT NOT NULL CHECK(grade in (2,3,4,5,6)),
        subject_id INT NOT NULL,
        FOREIGN KEY(subject_id) REFERENCES Subject(id),
        student_id INT NOT NULL,
        FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(6,1,1);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(4,1,1);

INSERT INTO Grade(grade, subject_id, student_id) VALUES(5,1,2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(3,1,2);
INSERT INTO Grade(grade, subject_id, student_id) VALUES(6,1,2);

INSERT INTO Address(street) VALUES ("TUES");
INSERT INTO Student(name, address_id) VALUES("Uchenik bez ocenka", 3);

SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Grade;

-- [Улица, Ученик] За всеки ученик.
SELECT name, street FROM Student
INNER JOIN Address
ON Student.address_id = Address.id;

-- [Ученик, оценка] За всяка оценка.
SELECT name, grade FROM Student
RIGHT JOIN Grade
ON Student.id = Grade.student_id;

-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям.
SELECT name, AVG(grade) AS avg_grade FROM Student
JOIN Grade
ON Student.id = Grade.student_id
GROUP BY Student.id
ORDER BY avg_grade ASC;

-- Името на ученика с най-висок среден успех.
SELECT name FROM Student
JOIN Grade
ON Student.id = Grade.student_id
GROUP BY Student.id
ORDER BY AVG(Grade.grade) DESC 
LIMIT 1;

-- [Ученик, брой оценки] За всеки ученик.
SELECT name, COUNT(Grade.grade) AS grade_count FROM Student
JOIN Grade
ON Student.id = Grade.student_id
GROUP BY Student.id
ORDER BY grade_count;

-- [Ученик, оценка, предмет] За всяка оценка.
SELECT Student.name, Grade.grade, Subject.name FROM Student
JOIN Grade
ON Student.id = Grade.student_id
JOIN Subject
ON Subject.id = Grade.subject_id;

-- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name, Subject.name, AVG(Grade.grade) FROM Student
JOIN Grade
ON Student.id = Grade.student_id
JOIN Subject
ON Subject.id = Grade.subject_id
GROUP BY Student.id, Subject.id;
