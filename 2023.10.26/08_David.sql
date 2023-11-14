-- Create the SchoolLibrary database
CREATE DATABASE SchoolLibrary;

-- Switch to the SchoolLibrary database
USE SchoolLibrary;

-- Create the Books table
CREATE TABLE Books (
  BookID INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(255),
  Author VARCHAR(255),
  Genre VARCHAR(255),
  YearPublished INT,
  CopiesAvailable INT,
  TotalPages INT,
  ISBN VARCHAR(255)
);

-- Insert sample data for books
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
  ("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309, NULL),
  ("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281, NULL),
  ("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180, NULL),
  ("1984", "George Orwell", "Dystopian", 1949, 1, 328, NULL),
  ("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211, NULL);

-- List all the books in the database
SELECT * FROM Books;

-- Find books written by "J.K. Rowling"
SELECT * FROM Books WHERE Author = "J.K. Rowling";

-- Find books that belong to the "Classic" or "Dystopian" genre
SELECT * FROM Books WHERE Genre = "Classic" OR Genre = "Dystopian";

-- Find books that are not from the "Fantasy" genre
SELECT * FROM Books WHERE Genre != "Fantasy";

-- List all books, ordered by the YearPublished column
SELECT * FROM Books ORDER BY YearPublished;

-- Update the "CopiesAvailable" column for a specific book
UPDATE Books SET CopiesAvailable = 4 WHERE Title = "A Wrinkle in Time";

-- Delete a book from the table based on its title
DELETE FROM Books WHERE Title = "1984";

-- Display only the first three books in the table
SELECT * FROM Books LIMIT 3;

-- Find the book with the minimum and maximum number of pages
SELECT * FROM Books WHERE TotalPages = (SELECT MIN(TotalPages) FROM Books);
SELECT * FROM Books WHERE TotalPages = (SELECT MAX(TotalPages) FROM Books);

-- Count the total number of books in the library
SELECT COUNT(*) FROM Books;

-- Find the average number of pages across all books
SELECT AVG(TotalPages) FROM Books;

-- Calculate the total number of pages in the library
SELECT SUM(TotalPages) FROM Books;

-- Find books that have a title starting with "The"
SELECT * FROM Books WHERE Title LIKE 'The%';

-- Add a new column for "ISBN" which can be NULL to the Books table
ALTER TABLE Books
ADD ISBN VARCHAR(255);

-- Find books where the ISBN value is NULL
SELECT * FROM Books WHERE ISBN IS NULL;
