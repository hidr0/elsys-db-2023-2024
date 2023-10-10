	DROP DATABASE IF EXISTS classwork3;
    CREATE DATABASE classwork3;
    USE classwork3;
    
    CREATE TABLE students (
		id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(64),
        age INT
    );
    
    INSERT INTO students(name, age) VALUES ("Ali", 17);
    INSERT INTO students(name, age) VALUES ("Iva", 15);
	INSERT INTO students(name, age) VALUES ("Evgeni", 16);
    INSERT INTO students(name, age) VALUES ("Kaloqn", 17);
	INSERT INTO students(name, age) VALUES ("Pepi", 19);

	SELECT * FROM students
    WHERE age > 16;
    
    SELECT * FROM students
    WHERE age > 15 AND age < 19;
    
    SELECT * FROM students
    WHERE age < 17 OR age > 18;
    
    SELECT * FROM students
    WHERE NOT age = 17
    ORDER BY age DESC;
    
    SELECT * FROM students 
    WHERE age IS NULL;
    
    -- show all students from the youngest to the oldest
	SELECT * FROM students
    ORDER BY age ASC;
    
    -- show the students' names 
    SELECT name FROM students;
    
    -- show the students ages and names from the oldest to the youngest
    SELECT age, name FROM students
    ORDER BY age DESC;