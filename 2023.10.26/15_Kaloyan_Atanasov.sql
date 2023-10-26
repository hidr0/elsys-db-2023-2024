DROP DATABASE IF EXISTS SchoolLibrary;

CREATE DATABASE SchoolLibrary;

USE SchoolLibrary;

CREATE TABLE IF NOT EXISTS Books(
	BookId INT PRIMARY KEY AUTO_INCREMENT,
    Title varchar(255),
    Author varchar(255),
    Genre varchar(255),
    YearPublished int,
    CopiesAvailable int,
    TotalPages int
);

INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- SELECT * FROM Books;
-- SELECT * FROM Books WHERE Author = 'J.K. Rowling';
-- SELECT * FROM Books WHERE Genre = 'Classic' OR Genre = 'Dystopian';
-- SELECT * FROM Books WHERE Genre != 'Fantasy';

SELECT * FROM Books ORDER BY YearPublished;

UPDATE Books SET CopiesAvailable = 6 WHERE Title = '1984';

DELETE FROM Books WHERE Title = 'A Wrinkle in Time';

SELECT * FROM Books LIMIT 3;

SELECT * FROM Books WHERE TotalPages = (SELECT MIN(TotalPages) FROM Books);
SELECT * FROM Books WHERE TotalPages = (SELECT MAX(TotalPages) FROM Books);
SELECT COUNT(*) AS TotalBooks FROM Books;
SELECT AVG(TotalPages) AS AveragePages FROM Books;
SELECT SUM(TotalPages) AS TotalPages FROM Books;

SELECT * FROM Books WHERE Title LIKE 'The%';

ALTER TABLE Books ADD COLUMN ISBN VARCHAR(255) DEFAULT NULL;
SELECT * FROM Books WHERE ISBN IS NULL;