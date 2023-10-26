-- SETUP
DROP DATABASE IF EXISTS SchoolLibrary;
CREATE DATABASE SchoolLibrary;
USE SchoolLibrary;

CREATE TABLE Book(
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    title varchar(63),
    author varchar(63),
    genre varchar(63),
    published int,
    copies int,
    pages int
);


-- INSERT INTO
INSERT INTO Book (title, author, genre, published, copies, pages) VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);


-- SELECT, WHERE, AND, OR, NOT
SELECT * FROM Book;
SELECT * FROM Book WHERE author = "J.K. Rowling";
SELECT * FROM Book WHERE genre = "Classic" OR genre = "Dystopian";
SELECT * FROM Book WHERE NOT genre = "Fantasy";


-- ORDER BY
SELECT * FROM Book ORDER BY published;


-- UPDATE
UPDATE Book SET copies = copies + 100 WHERE title = "Harry Potter and the Philosopher's Stone";


-- DELETE
DELETE FROM Book WHERE author = "Madeleine L'Engle";


-- LIMIT
SELECT * FROM Book LIMIT 3;


-- MIN, MAX, COUNT, AVG, SUM
SELECT * FROM Book ORDER BY pages ASC LIMIT 1;  -- min
SELECT * FROM Book ORDER BY pages DESC LIMIT 1;  -- max
SELECT COUNT(id) FROM Book;  -- count
SELECT AVG(pages) FROM Book;  -- avg
SELECT SUM(pages) FROM Book;  -- sum


-- LIKE and Wildcards
SELECT * FROM Book WHERE title LIKE "The%";


-- NULL VALUES
ALTER TABLE Book ADD ISBN varchar(63) DEFAULT(NULL);  -- add new column
UPDATE Book SET ISBN = "ISBN-13 978-1338878929"
WHERE title LIKE "Harry Potter and the Phil%";  -- update isbn column for test
UPDATE Book SET ISBN = "ISBN-13 978-0743273565"
WHERE title LIKE "%Great Gatsby%";  -- update isbn for test

SELECT * FROM Book WHERE ISBN IS NULL;  -- check for null isbn's
