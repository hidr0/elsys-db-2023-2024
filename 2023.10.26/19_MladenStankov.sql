-- Delete database if exists
DROP DATABASE IF EXISTS SchoolLibrary;

-- Create the SchoolLibrary database
CREATE DATABASE SchoolLibrary;

-- Switch to the SchoolLibrary database
USE SchoolLibrary;

-- Create the Books table with specified attributes
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,   
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(255),
    YearPublished INT,
    CopiesAvailable INT,
    TotalPages INT
);

-- Insert sample data for at least five different books into the Books table
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
    ('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Fantasy', 1997, 10, 320),
    ('To Kill a Mockingbird', 'Harper Lee', 'Classic', 1960, 5, 281),
    ('1984', 'George Orwell', 'Dystopian', 1949, 3, 328),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925, 7, 180),
    ('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 8, 310);

-- List all the books in the database
SELECT * FROM Books;

-- Find books written by "J.K. Rowling"
SELECT * FROM Books WHERE Author = 'J.K. Rowling';

-- Find books that belong to the "Classic" or "Dystopian" genre
SELECT * FROM Books WHERE Genre = 'Classic' OR Genre = 'Dystopian';

-- Find books that are not from the "Fantasy" genre
SELECT * FROM Books WHERE NOT Genre = 'Fantasy';

-- List all books, ordered by the YearPublished column
SELECT * FROM Books ORDER BY YearPublished;

-- Update the "CopiesAvailable" column for a specific book (e.g., BookID 1)
UPDATE Books SET CopiesAvailable = 12 WHERE BookID = 1;

-- Delete a book from the table based on its title
DELETE FROM Books WHERE Title = '1984';

-- Display only the first three books in the table
SELECT * FROM Books LIMIT 3;

-- Find the book with the minimum and maximum number of pages
SELECT * FROM Books ORDER BY TotalPages ASC LIMIT 1;
SELECT * FROM Books ORDER BY TotalPages DESC LIMIT 1;

-- Count the total number of books in the library
SELECT COUNT(*) FROM Books;

-- Find the average number of pages across all books
SELECT AVG(TotalPages) FROM Books;

-- Calculate the total number of pages in the library
SELECT SUM(TotalPages) FROM Books;

-- Find books that have a title starting with "The"
SELECT * FROM Books WHERE Title LIKE 'The%';

-- Add a new column for "ISBN" which can be NULL to the Books table
ALTER TABLE Books ADD COLUMN ISBN VARCHAR(255);

-- Find books where the ISBN value is NULL
SELECT * FROM Books WHERE ISBN IS NULL;
