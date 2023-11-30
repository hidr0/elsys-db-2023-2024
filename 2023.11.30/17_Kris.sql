DROP DATABASE IF EXISTS School;
CREATE DATABASE School;
USE School;

CREATE TABLE Address(
	id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(50)
);

INSERT INTO Address(street) 
VALUES 	("Mladost 4, st. 12"),
		("Malinova dolina, st. Positano"),
        ("Lulin 7, st. Javaharval Neru");

CREATE TABLE Student(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(30) NOT NULL,
    address_id INT NOT NULL UNIQUE,
    FOREIGN KEY (address_id) REFERENCES Address(id) 
);

INSERT INTO Student(name, address_id) 
VALUES 	("Vankeca", 2),
		("Kriskata", 3),
        ("Sashoto", 1);

CREATE TABLE Subject(
	id INT PRIMARY KEY AUTO_INCREMENT, 
	name ENUM("Math", "Physics", "Biology", "Programming", "Science")
);

INSERT INTO Subject(name) 
VALUES 	("Math"),
		("Physics"),
        ("Biology");

CREATE TABLE Grade(
	id INT PRIMARY KEY AUTO_INCREMENT, 
    grade INT NOT NULL CHECK(GRADE IN (2, 3, 4, 5, 6)),
    subject_id INT NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES Subject(id),
    student_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id)
);

INSERT INTO Grade(grade, subject_id, student_id)
VALUES	(4, 2, 2),
		(5, 2, 3), 
		(6, 1, 1), 	
        (6, 1, 2),
        (2, 1, 1);
        
SELECT * FROM Address;
SELECT * FROM Student;
SELECT * FROM Subject;
SELECT * FROM Grade;



-- [Улица, Ученик] За всеки ученик.
SELECT Address.street, Student.name FROM Student
LEFT JOIN Address
ON address_id = Address.id;

-- [Ученик, оценка] За всяка оценка.
SELECT Student.name, Grade.grade FROM Grade
LEFT JOIN Student 
ON student_id = Student.id;

-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям.
SELECT Student.name, AVG(Grade.grade) FROM Grade
LEFT JOIN Student 
ON student_id = Student.id
GROUP BY Student.name
ORDER BY AVG(Grade.grade) ASC;

-- Името на ученика с най-висок среден успех.
SELECT Student.name, AVG(Grade.grade) FROM Grade
LEFT JOIN Student 
ON student_id = Student.id
GROUP BY Student.name
ORDER BY AVG(grade) DESC LIMIT 1;

-- [Ученик, брой оценки] За всеки ученик.
SELECT Student.name, COUNT(Grade.grade) FROM Student
LEFT JOIN Grade 
ON student_id = Student.id
GROUP BY Student.name;

-- [Ученик, оценка, предмет] За всяка оценка.
SELECT Student.name, Grade.grade, Subject.name FROM Grade
LEFT JOIN Student 
ON student_id = Student.id
LEFT JOIN Subject
ON subject_id = Subject.id;

-- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name, Subject.name, AVG(Grade.grade) FROM Student
LEFT JOIN GRADE
ON Grade.student_id = Student.id
LEFT JOIN Subject
ON Grade.subject_id = Subject.id
GROUP BY Student.name, Subject.name;