-- create database
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

-- create table
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(50),
    YearPublished INT,
    CopiesAvailable INT,
    TotalPages INT
);

-- insert data into table
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages) 
VALUES 
    ('Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Fantasy', 1997, 5, 320),
    ('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960, 3, 281),
    ('1984', 'George Orwell', 'Dystopian', 1949, 4, 328),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 2, 180),
    ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 6, 310);

-- some queries
SELECT * FROM Books;
SELECT * FROM Books WHERE Author = 'J.K. Rowling';
SELECT * FROM Books WHERE Genre = 'Classic' OR Genre = 'Dystopian';
SELECT * FROM Books WHERE Genre != 'Fantasy';

-- order
SELECT * FROM Books ORDER BY YearPublished;

-- update
UPDATE Books SET CopiesAvailable = 2 WHERE Title = 'The Great Gatsby';

-- delete
DELETE FROM Books WHERE Title = '1984';

-- limit
SELECT * FROM Books LIMIT 3;

-- MIN, MAX, COUNT, AVG, SUM
SELECT * FROM Books ORDER BY TotalPages ASC LIMIT 1;
SELECT * FROM Books ORDER BY TotalPages DESC LIMIT 1;
SELECT COUNT(*) AS TotalBooks FROM Books;
SELECT AVG(TotalPages) AS AveragePages FROM Books;
SELECT SUM(TotalPages) AS TotalPagesInLibrary FROM Books;

-- LIKE and Wildcards
SELECT * FROM Books WHERE Title LIKE 'The%';

-- NULL values
ALTER TABLE Books ADD ISBN VARCHAR(13);
SELECT * FROM Books WHERE ISBN = NULL;
