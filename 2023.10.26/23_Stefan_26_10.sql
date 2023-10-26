-- Task 1: Create the database and switch to it
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

-- Task 2: Create the 'Books' table with the specified columns
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),                 
    Author VARCHAR(255),                
    Genre VARCHAR(50),                  
    YearPublished INT,                  
    CopiesAvailable INT,                
    TotalPages INT                      
);

-- Task 3: Insert sample data for at least five different books
INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- Task 4: List all books in the database
SELECT * FROM Books;

-- Task 5: Find books written by "J.K. Rowling"
SELECT * FROM Books WHERE Author = "J.K. Rowling";

-- Task 6: Find books in the "Classic" or "Dystopian" genre
SELECT * FROM Books WHERE Genre = "Classic" OR Genre = "Dystopian";

-- Task 7: Find books that are not from the "Fantasy" genre
SELECT * FROM Books WHERE Genre != "Fantasy";

-- Task 8: Find the book with the minimum and maximum number of pages, sorted
SELECT Title, TotalPages
FROM Books
WHERE TotalPages = (SELECT MIN(TotalPages) FROM Books)
   OR TotalPages = (SELECT MAX(TotalPages) FROM Books)
ORDER BY TotalPages;

-- Count the total number of books in the library
SELECT COUNT(*) AS TotalBooks FROM Books;

-- Find the average number of pages across all books
SELECT AVG(TotalPages) AS AvgPages FROM Books;

-- Calculate the total number of pages in the library
SELECT SUM(TotalPages) AS TotalLibraryPages FROM Books;


-- Task 9: Find books that have a title starting with "The"
SELECT * FROM Books WHERE Title LIKE 'The%';

-- Task 10: Add a new column for "ISBN" which can be NULL to the Books table
ALTER TABLE Books ADD ISBN VARCHAR(20) NULL;

-- Find books where the ISBN value is NULL
SELECT * FROM Books WHERE ISBN IS NULL;
