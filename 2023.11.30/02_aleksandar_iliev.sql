DROP DATABASE IF EXISTS School;
CREATE DATABASE School;
USE School;

CREATE TABLE Address(
    id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255)
);

INSERT INTO Address(street) VALUES
    ("Mladost 4, bl 437"),
    ("Malinova Dolina, bl 70");

CREATE TABLE Student(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    address_id INT NOT NULL,
    FOREIGN KEY(address_id) REFERENCES Address(id)
);

INSERT INTO Student(name, address_id) VALUES
    ("Misho", 1),
    ("Strahil", 2);

CREATE TABLE Subject(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name ENUM("Math", "Bazi Danni")
);

INSERT INTO Subject(name) VALUES
    ("Math"),
    ("Bazi Danni");

CREATE TABLE Grade(
    id INT PRIMARY KEY AUTO_INCREMENT,
    grade INT NOT NULL CHECK(grade >= 2 AND grade <=6),
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Student(id),
    FOREIGN KEY (subject_id) REFERENCES Subject(id)
);

INSERT INTO Grade(grade, subject_id, student_id) VALUES
    (6,1,1),
    (4,1,1),

    (5,1,2),
    (3,2,2),
    (6,2,2);

INSERT INTO Address(street) VALUES ("Tues");
INSERT INTO Student(name, address_id) VALUES("Bez ocenka", 3);

-- [Улица, Ученик] За всеки ученик
SELECT Address.street, Student.name FROM Student
LEFT JOIN Address ON Address.id = address_id;

-- [Ученик, оценка] За всяка оценка
SELECT name, grade FROM Grade
LEFT JOIN Student ON student_id = Student.id;

 -- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям
SELECT name, AVG(grade) FROM Student
LEFT JOIN Grade ON student_id = Student.id
GROUP BY name
ORDER BY AVG(grade) ASC;

-- Името на ученика с най-висок среден успех
SELECT name FROM Student
LEFT JOIN Grade ON student_id = Student.id
GROUP BY name
ORDER BY AVG(grade) DESC
LIMIT 1;

-- [Ученик, брой оценки] За всеки ученик
SELECT name, COUNT(grade) FROM Student
LEFT JOIN Grade ON student_id = Student.id
GROUP BY name;

-- [Ученик, оценка, предмет] За всяка оценка
SELECT Student.name, grade, Subject.name FROM Grade
LEFT JOIN Student ON student_id = Student.id
LEFT JOIN Subject ON subject_id = Subject.id;

 -- [Ученик, предмет, среден успех] Всеки ученик.
SELECT Student.name, Subject.name, AVG(grade) FROM Student
LEFT JOIN Grade ON student_id = Student.id
LEFT JOIN Subject ON subject_id = Subject.id
GROUP BY Student.name, Subject.name;