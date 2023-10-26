-- 1
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

CREATE TABLE Books (
    BookID int primary key auto_increment,
    Title varchar(255),
    Author varchar(255),
    Genre varchar(50),
    YearPublished int,
    Pages int,
    CopiesAvailable int
);
-- 2
INSERT INTO Books (Title, Author, Genre, YearPublished, Pages, CopiesAvailable) VALUES
    ('Book 1', 'Author 1', 'Classic', 2000, 300, 5),
    ('Book 2', 'J.K. Rowling', 'Fantasy', 2005, 400, 3),
    ('Book 3', 'Author 2', 'Dystopian', 2010, 250, 7),
    ('Book 4', 'Author 3', 'Mystery', 2020, 350, 2),
    ('Book 5', 'Author 4', 'Classic', 1995, 280, 4);
    
    
-- 3 
SELECT * FROM Books;

SELECT * FROM Books where Author = 'J.K. Rowling';

SELECT * FROM Books where Genre = 'Classic' OR Genre = 'Dystopian';

SELECT * FROM Books where Genre <> 'Fantasy';

-- 4
SELECT * FROM Books order by YearPublished;
-- 5
UPDATE Books SET CopiesAvailable = 10 where Title = 'Book 3';
-- 6
DELETE FROM Books where Title = 'Book 4';
-- 7
SELECT * FROM Books LIMIT 3;
-- 8
SELECT * FROM Books where Pages = (SELECT MIN(Pages) FROM Books);

SELECT * FROM Books where Pages = (SELECT MAX(Pages) FROM Books);

SELECT COUNT(*) AS TotalBooks FROM Books;

SELECT AVG(Pages) AS AveragePages FROM Books;

SELECT SUM(Pages) AS TotalPages FROM Books;

-- 9
SELECT * FROM Books where Title LIKE 'The%';

-- 10
ALTER TABLE Books ADD ISBN VARCHAR(20) NULL;

SELECT * FROM Books where ISBN IS NULL;
