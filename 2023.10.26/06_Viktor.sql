-- 1
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

CREATE TABLE Books (
	BookID int AUTO_INCREMENT PRIMARY KEY,
	Title VARCHAR(255) NOT NULL,
	Author VARCHAR(255) NOT NULL,
	Genre VARCHAR(255) NOT NULL,
	YearPublished int NOT NULL,
	CopiesAvailable int NOT NULL,
	TotalPages int NOT NULL
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
SELECT * FROM Books ORDER BY YearPublished;

-- 5
UPDATE Books SET CopiesAvailable = 234567 WHERE Title = "1984"; 

-- 6
DELETE FROM Books WHERE Title = "Harry Potter and the Philosopher's Stone";

-- 7
SELECT * FROM Books LIMIT 3;

-- 8
SELECT * FROM Books ORDER BY TotalPages LIMIT 1;
SELECT * FROM Books ORDER BY TotalPages DESC LIMIT 1;
SELECT COUNT(*) FROM Books ;
SELECT AVG(TotalPages) FROM Books;
SELECT SUM(TotalPages) FROM Books;

-- 9
SELECT * FROM Books WHERE Title LIKE "The%";

-- 10
ALTER TABLE Books ADD ISBN VARCHAR(255);
SELECT * FROM Books WHERE ISBN IS NULL;