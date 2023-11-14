-- Setup

CREATE DATABASE SchoolLibrary;

USE SchoolLibrary;

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(50),
    YearPublished INT,
    CopiesAvailable INT,
    TotalPages INT
);

-- Insert

INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
    ("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
    ("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
    ("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
    ("1984", "George Orwell", "Dystopian", 1949, 1, 328),
    ("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- Select

SELECT * FROM Books;
SELECT * FROM Books WHERE Author = 'J.K. Rowling';
SELECT * FROM Books WHERE Genre = 'Classic' OR Genre = 'Dystopian';
SELECT * FROM Books WHERE NOT Genre = 'Fantasy';

-- Order

SELECT * FROM Books ORDER BY YearPublished;

-- Update

UPDATE Books SET CopiesAvailable = 2 WHERE Title = 'To Kill a Mockingbird';

-- Delete

DELETE FROM Books WHERE Title = 'The Great Gatsby';

-- Limit

SELECT * FROM Books LIMIT 3;

-- Min, Max


SELECT * FROM Books 
ORDER BY TotalPages DESC LIMIT 1;
SELECT * FROM Books 
ORDER BY TotalPages ASC LIMIT 1;
SELECT COUNT(*) FROM Books;
SELECT AVG(TotalPages) FROM Books;
SELECT SUM(TotalPages) FROM Books;

-- Like

SELECT * FROM Books WHERE Title LIKE 'The%';

-- NULL

ALTER TABLE Books ADD ISBN VARCHAR(20);
SELECT * FROM Books WHERE ISBN IS NULL;
