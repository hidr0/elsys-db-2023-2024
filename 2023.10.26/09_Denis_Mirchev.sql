-- (1) 
DROP DATABASE IF EXISTS SchoolLibrary;
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

-- (2)
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- (3)
SELECT * FROM Books;
SELECT * FROM Books WHERE Author = "J.K. Rowling";
SELECT * FROM Books WHERE Genre = "Classic" OR Genre = "Dystopian";
SELECT * FROM Books WHERE Genre != "Fantasy";

-- (4)
SELECT * FROM Books ORDER BY YearPublished;

-- (5)
UPDATE Books SET CopiesAvailable = 4 WHERE BookID = 1;


-- (6)
DELETE FROM Books WHERE Title = "1984";

-- (7)
SELECT * FROM Books LIMIT 3;

-- (8)
SELECT MIN(TotalPages) AS MinPages, MAX(TotalPages) AS MaxPages FROM Books;
SELECT COUNT(*) AS TotalBooks FROM Books;
SELECT AVG(TotalPages) AS AvgPages FROM Books;
SELECT SUM(TotalPages) AS TotalPages FROM Books;

-- (9)
SELECT * FROM Books WHERE Title LIKE 'The%';

-- (10)
ALTER TABLE Books ADD ISBN VARCHAR(20);
SELECT * FROM Books WHERE ISBN IS NULL;