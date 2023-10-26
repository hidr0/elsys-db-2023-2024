DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

CREATE TABLE Books(
		BookId int PRIMARY KEY AUTO_INCREMENT,
		Title varchar(100),
        Author varchar(100),
        Genre varchar(100),
        YearPublished int,
        CopiesAvailable int,
        TotalPages int
);

INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("Harry Potter and the chamber of secrets", "J.K. Rowling", "Fantasy", 1999, 1, 333),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211),
("The Count of Monte Cristo", "Alexander Duma", "Classic", 1788, 10, 987),
("Lord of the rings", "John Tolkien", "Adventure", 1931, 15, 1465);

SELECT * FROM Books;
SELECT * FROM Books WHERE Author = "J.K. Rowling";
SELECT * FROM Books WHERE Genre = "Classic" or Genre = "Dystopian";
SELECT * FROM Books WHERE NOT Genre="Fantasy";

SELECT * FROM Books ORDER BY YearPublished ASC;

UPDATE Books
SET CopiesAvailable = 40
WHERE Title = "Lord of the rings";

DELETE FROM Books WHERE Title = "The Great Gatsby";

SELECT * FROM Books LIMIT 3;

SELECT * FROM Books ORDER BY TotalPages ASC LIMIT 1;
SELECT * FROM Books ORDER BY TotalPages DESC LIMIT 1;

SELECT COUNT(*) FROM Books;

SELECT AVG(TotalPages) FROM Books;

SELECT SUM(TotalPages) FROM Books;

SELECT * FROM Books WHERE Title LIKE "The%";

ALTER TABLE Books
ADD ISBN varchar(30);

SELECT * FROM Books WHERE ISBN IS NULL;
