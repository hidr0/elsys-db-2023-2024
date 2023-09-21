
CREATE DATABASE StudentDatabase;

USE StudentDatabase;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Address VARCHAR(100),
    GPA DECIMAL(3, 2)
);

INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Address, GPA)
VALUES ('John', 'Doe', '2000-01-15', 'Male', '123 Main St, City, State', 3.75);
