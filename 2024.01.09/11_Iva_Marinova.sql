DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Authors (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    name VARCHAR(100) NOT NULL CHECK (LENGTH(name) > 3),
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATE NOT NULL
);

INSERT INTO Authors (name, email, birthdate) VALUES ('John Doe', 'johndoe@example.com', '1975-04-12');
INSERT INTO Authors (name, email, birthdate) VALUES ('Jane Smith', 'janesmith@example.com', '1980-11-23');
INSERT INTO Authors (name, email, birthdate) VALUES ('John Smith', 'johnsmith@example.com', '1985-06-30');

CREATE TABLE AuthorDetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    biography TEXT,
    awards TEXT,
    author_id INT NOT NULL UNIQUE,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

INSERT INTO AuthorDetails (biography, awards, author_id) VALUES ('A prolific writer in the mystery genre.', 'Best Mystery Writer 2003', 1);
INSERT INTO AuthorDetails (biography, awards, author_id) VALUES ('Known for her science fiction works.', NULL, 2);

CREATE TABLE Books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(200) NOT NULL,
    publication_date DATE,
    pages INT CHECK (pages > 0),
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

INSERT INTO Books (title, publication_date, isbn, pages, author_id) VALUES ('Adventure in the Alps', '2001-07-16', '1234567890123', 220, 1);
INSERT INTO Books (title, publication_date, isbn, pages, author_id) VALUES ('The Future World', '2005-09-10', '9876543210987', 310, 2);
INSERT INTO Books (title, publication_date, isbn, pages, author_id) VALUES ('The Future World2', '2005-09-11', '9876543211111', 309, 3);

CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    name VARCHAR(100) NOT NULL   
);

INSERT INTO Categories(name) VALUES('Fiction');
INSERT INTO Categories(name) VALUES('Science');
INSERT INTO Categories(name) VALUES('Adventure');
INSERT INTO Categories(name) VALUES('Mystery');

CREATE TABLE BookCategories (
    id INT PRIMARY KEY AUTO_INCREMENT,   
    category_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY(category_id) REFERENCES Categories(id),
    FOREIGN KEY(book_id) REFERENCES Books(id)
);

INSERT INTO BookCategories(category_id, book_id) VALUES(3, 1);
INSERT INTO BookCategories(category_id, book_id) VALUES(2, 2);
INSERT INTO BookCategories(category_id, book_id) VALUES(1, 2);
INSERT INTO BookCategories(category_id, book_id) VALUES(4, 1);

-- 1. Retrieve Author Details
SELECT A.name, A.email, A.birthdate, D.biography, D.awards FROM Authors AS A
LEFT JOIN AuthorDetails AS D ON A.id = D.author_id;

-- 2. List of books by an author
SELECT B.title, B.publication_date, B.pages
FROM Books AS B
JOIN Authors AS A ON B.author_id = A.id
WHERE A.name = 'John Doe';

-- 3. Books in a Category
SELECT C.name, B.title, A.name AS author_name
FROM Categories AS C
JOIN BookCategories AS BC ON C.id = BC.category_id
JOIN Books AS B ON BC.book_id = B.id
JOIN Authors AS A ON B.author_id = A.id
WHERE C.name LIKE 'Fiction';

-- 4. Count of Books in Each Category
SELECT C.name AS category_name, COUNT(BC.book_id) AS book_count
FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
GROUP BY C.name;

-- 5. Authors with No Awards
SELECT A.name, D.biography
FROM Authors AS A
LEFT JOIN AuthorDetails AS D ON A.id = D.author_id
WHERE D.awards IS NULL;

-- 6. Update Book Information
SELECT * FROM Books;
UPDATE Books SET pages = 501 WHERE title LIKE 'The Future World';
SELECT * FROM Books;

-- DELETE FROM Books WHERE pages > 300;

-- 8. Search Books by Title Keyword
SELECT B.title, A.name AS author_name
FROM Books AS B
JOIN Authors AS A ON B.author_id = A.id
WHERE B.title LIKE '%World%';

-- 9. List of Authors Born Before a Certain Year
SELECT A.name, A.birthdate
FROM Authors AS A
WHERE A.birthdate < '1980-01-01';