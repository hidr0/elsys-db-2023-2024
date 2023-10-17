
-- 1

Drop database if exists Class;

-- 2
Create database Class;

-- 3

Use Class;

-- 4

CREATE TABLE Students (
    Age int,
    Name varchar(255),
    CONSTRAINT CHK_Person CHECK (0 <= Age <= 100)
);

-- 5

ALTER TABLE Students;

-- 6

INSERT INTO Students (Name, age) VALUES ("Emil", 17);
INSERT INTO Students (Name, age) VALUES ("Alex", 18);

-- 7 

SELECT * FROM Students;