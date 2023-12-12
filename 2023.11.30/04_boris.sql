DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

CREATE TABLE Address(
	id int PRIMARY KEY AUTO_INCREMENT,
    street varchar(200)
);

CREATE TABLE Student(
	id int PRIMARY KEY AUTO_INCREMENT,
    address_id int NOT NULL UNIQUE,
    name varchar(200),
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

CREATE TABLE Subject(
	id int PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Literature", "Science")
);

CREATE TABLE Grade(
	id int PRIMARY KEY AUTO_INCREMENT,
    subject_id int NOT NULL,
    student_id int NOT NULL,
    grade int NOT NULL CHECK(grade >= 2 AND grade <= 6),
    FOREIGN KEY(subject_id) REFERENCES Subject(id),
    FOREIGN KEY(student_id) REFERENCES Student(id)
);

INSERT INTO Address(street) VALUES
("Sofia Blok 1"),
("Sofia Blok 7"),
("Sofia Blok 123"),
("Sofia Blok 932"),
("Sofia Blok 472"),
("Plovdiv Blok 23"),
("Plovdiv Blok 92"),
("Plovdiv Blok 43"),
("Plovdiv Blok 4"),
("Plovdiv Blok 8"),
("Ruse Blok 1"),
("Ruse Blok 2"),
("Ruse Blok 3");


INSERT INTO Student(address_id, name) VALUES
(1, "Boris"),
(2, "Johnatan"),
(3, "Mary"),
(4, "Abraham Lincoln"),
(5, "John Doe"),
(6, "Personone"),
(7, "Persontwo"),
(8, "Personthree"),
(9, "Personfour"),
(10, "George"),
(11, "Michael"),
(12, "Louise"),
(13, "Michelangello");


INSERT INTO Subject(name) VALUES
("Math"),
("Literature"),
("Science");

INSERT INTO Grade(student_id, subject_id, grade) VALUES
(1, 1, 6), (1, 2, 3), (1, 3, 6),
(2, 1, 5), (2, 2, 4), (2, 3, 3),
(3, 1, 4), (3, 2, 2), (3, 3, 5),
(4, 1, 3), (4, 2, 6), (4, 3, 5),
(5, 1, 6), (5, 2, 5), (5, 3, 4),
(6, 1, 5), (6, 2, 4), (6, 3, 6),
(7, 1, 6), (7, 2, 2), (7, 3, 2),
(8, 1, 2), (8, 2, 5), (8, 3, 5),
(9, 1, 2), (9, 2, 2), (9, 3, 4),
(10, 1, 3), (10, 2, 4), (10, 3, 4),
(11, 1, 4), (11, 2, 5), (11, 3, 3),
(12, 1, 4), (12, 2, 5), (12, 3, 5),
(13, 1, 6), (13, 2, 6), (13, 3, 6);


SELECT * FROM Address LIMIT 20;
SELECT * FROM Grade LIMIT 20;
SELECT * FROM Student LIMIT 20;
SELECT * FROM Subject LIMIT 20;

-- (1) {улица, ученик} за всеки ученик
SELECT Address.street, Student.name
FROM Student JOIN Address ON Address.id = Student.address_id LIMIT 20;

-- (2) {ученик, оценка} за всяка оценка
SELECT Student.name, Grade.grade
FROM Student JOIN Grade ON Student.id = Grade.student_id LIMIT 40;

-- (3) {ученик, среден успех} за всеки ученик, сортирани възходящо
SELECT Student.name, AVG(Grade.grade)
FROM Grade LEFT JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.name ORDER BY AVG(Grade.grade) ASC LIMIT 40;

-- (4) Името на ученика с най-висок среден успех
SELECT Student.name
FROM Grade LEFT JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.name ORDER BY AVG(Grade.grade) DESC LIMIT 1;

-- (5) {ученик, брой оценки} за всеки ученик
SELECT Student.name, COUNT(Grade.grade)
FROM Grade LEFT JOIN Student ON Grade.student_id = Student.id
GROUP BY Student.name LIMIT 40;

-- (6) {ученик, оценка, предмет} за всяка оценка
SELECT Student.name, Grade.grade, Subject.name
FROM Grade LEFT JOIN Subject ON Subject.id = Grade.student_id
LEFT JOIN Student ON Student.id = Grade.subject_id LIMIT 40;

-- (7) {ученик, предмет, среден успех} за всеки ученик
SELECT Student.name, Subject.name, AVG(Grade.grade)
FROM Student LEFT JOIN Grade ON Student.id = Grade.student_id
LEFT JOIN Subject ON Grade.subject_id = Subject.id
GROUP BY Subject.name, Student.name LIMIT 40;
