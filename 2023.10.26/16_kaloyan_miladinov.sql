-- Setup (1)
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

CREATE TABLE Books(
	BookID INT PRIMARY KEY AUTO_INCREMENT,
	Title VARCHAR(255),
	Author VARCHAR(255),
	Genre VARCHAR(255),
	YearPublished YEAR,
	AvailableCopies INT,
	TotalPages INT
);

-- Inserting values (2)
INSERT INTO Books (Title, Author, Genre, YearPublished, AvailableCopies, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- Selecting (3)
SELECT * FROM Books;
SELECT * FROM Books WHERE Author="J.K. Rowling";
SELECT * FROM Books WHERE Genre="Classic" OR Genre="Dystopian";
SELECT * FROM Books WHERE NOT Genre="Fantasy";

-- Ordering (4)
SELECT * FROM Books ORDER BY YearPublished;

-- Updating (5)
UPDATE Books SET AvailableCopies=250 WHERE Title="1984";

-- Deleting (6)
DELETE FROM Books Where Title="A Wrinkle in Time";

-- Limit (7)
SELECT * FROM Books LIMIT 3;

-- Min, max, count, avg and sum (8)
SELECT * FROM Books WHERE TotalPages=(SELECT MAX(TotalPages) FROM Books);
SELECT COUNT(*) AS "Number of books in library" FROM Books; 
SELECT AVG(TotalPages) AS "Average number of pages" FROM Books;
SELECT SUM(TotalPages) AS "Total number of pages in library" FROM Books;

-- Like and Wildcards (9)
SELECT * FROM Books WHERE Title Like "The%";

-- Null values (10)
ALTER TABLE Books ADD ISBN VARCHAR(255) NULL;
SELECT * FROM Books WHERE ISBN IS NULL;

