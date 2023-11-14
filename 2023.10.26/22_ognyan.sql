-- 1
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(100),
    YearPublished INT,
    CopiesAvailable INT,
    TotalPages INT
);

-- 2
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- 3
SELECT * FROM Books;
SELECT * FROM Books WHERE Author = "J.K. Rowling";
SELECT * FROM Books WHERE Genre = "Classic" OR Genre = "Dystopian";
SELECT * FROM Books WHERE Genre != "Fantasy";

-- 4
SELECT * FROM Books ORDER BY YearPublished DESC;

-- 5
UPDATE Books SET CopiesAvailable = 0 WHERE BookID = 1;

-- 6
DELETE FROM Books WHERE Title = "A Wrinkle in Time";

-- 7
SELECT * FROM Books LIMIT 3;

-- 8
SELECT * FROM Books ORDER BY TotalPages ASC LIMIT 1;
SELECT * FROM Books ORDER BY TotalPages DESC LIMIT 1;
SELECT COUNT(*) FROM Books;
SELECT AVG(TotalPages) FROM Books;
SELECT SUM(TotalPages) FROM Books;

-- 9
SELECT * FROM Books WHERE Title LIKE "The%";

-- 10
ALTER TABLE Books ADD ISBN BIGINT;
UPDATE Books SET ISBN = 123456789 WHERE BookID = 1;
UPDATE Books SET ISBN = 987654321 WHERE BookID = 2;
SELECT * FROM Books WHERE ISBN IS NULL;
