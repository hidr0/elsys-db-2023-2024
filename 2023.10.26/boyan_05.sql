DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;

USE SchoolLibrary;

CREATE TABLE Books(
	BookId INT AUTO_INCREMENT PRIMARY KEY,
	Title VARCHAR(255),
	Author VARCHAR(255),
	Genre VARCHAR(255),
	YearPublished INTEGER,
	CopiesAvailable INTEGER,
	TotalPages INTEGER
);


INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages) VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

SELECT * FROM Books;
SELECT * FROM Books WHERE Author = "J.K. Rowling";
SELECT * FROM Books WHERE Genre = "Classic" OR Genre = "Dystopian";
SELECT * FROM Books WHERE NOT Genre = "Fantasy";
SELECT * FROM Books
ORDER BY YearPublished;

UPDATE Books
SET CopiesAvailable = 10
WHERE BookId = 1;

DELETE FROM Books
WHERE BookId = 1;

SELECT * FROM Books
LIMIT 3;

SELECT * FROM Books
ORDER BY TotalPages ASC
LIMIT 1;

SELECT * FROM Books
ORDER BY TotalPages DESC
LIMIT 1;

SELECT COUNT(BookId)
FROM Books;

SELECT AVG(TotalPages)
FROM Books;

SELECT SUM(TotalPages)
FROM Books;

SELECT * FROM Books
WHERE Title LIKE "The%";

ALTER TABLE Books
ADD ISBN VARCHAR(20) NULL;

SELECT * FROM Books
WHERE ISBN IS NULL;

