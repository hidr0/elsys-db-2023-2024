DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Authors(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL check(length(name) > 3),
    email varchar(100) NOT NULL UNIQUE,
    birthdate date NOT NULL
);

INSERT INTO Authors(name, email, birthdate) VALUES("John Doe", "johndoe@example.com", "1975-04-12");
INSERT INTO Authors(name, email, birthdate) VALUES("Jane Smith", "janesmith@example.com", "1980-11-23");

CREATE TABLE AuthorDetails(
	id int PRIMARY KEY AUTO_INCREMENT,
    biography text,
    awards text,
    author_id int not null unique,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

INSERT INTO AuthorDetails(biography, awards, author_id) VALUES("A prolific writer in the mystery genre.", "Best Mystery Writer 2003", 1);
INSERT INTO AuthorDetails(biography, awards, author_id) VALUES("Known for her science fiction works.", NULL, 2);
-- INSERT INTO AuthorDetails(biography, awards, author_id) VALUES("Known for her science fiction works.", "Sci-Fi Author of the Year 2006", 2);

CREATE TABLE Books(
	id int PRIMARY KEY AUTO_INCREMENT,
    title varchar(200) NOT NULL,
    publication_date date,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    pages int check(pages > 0),
    author_id int not null,
    FOREIGN KEY(author_id) REFERENCES AUTHORS(id)
);


INSERT INTO Books(title, publication_date, isbn, pages, author_id)
VALUES("Adventure in the Alps", "2001-07-16", "1234567890123", 220, 1);

INSERT INTO Books(title, publication_date, isbn, pages, author_id)
VALUES("The Future World", "2005-09-10", "9876543210987", 310, 2);
INSERT INTO Books(title, publication_date, isbn, pages, author_id)
VALUES("The Future World II", "2007-09-10", "9876543210989", 309, 2);

CREATE TABLE Categories(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL
);


INSERT INTO Categories(name) VALUES("Fiction");
INSERT INTO Categories(name) VALUES("Science");
INSERT INTO Categories(name) VALUES("Adventure");
INSERT INTO Categories(name) VALUES("Pulp Fiction");

CREATE TABLE BookCategories(
	id int PRIMARY KEY AUTO_INCREMENT,
    category_id int not null,
    book_id int not null,
    FOREIGN KEY(category_id) REFERENCES Categories(id),
    FOREIGN KEY(book_id)REFERENCES Books(id)
);
INSERT INTO BookCategories(category_id, book_id) VALUES(3, 1);
INSERT INTO BookCategories(category_id, book_id) VALUES(2, 2);
INSERT INTO BookCategories(category_id, book_id) VALUES(1, 2);
INSERT INTO BookCategories(category_id, book_id) VALUES(2, 3);
INSERT INTO BookCategories(category_id, book_id) VALUES(1, 3);

-- Retrieve Author Details: Write a query to retrieve the full profile of an author by name. Include the author's name, email, birthdate, biography, and awards.
SELECT A.name, A.email, A.birthdate, D.biography, D.awards FROM Authors as A
LEFT JOIN AuthorDetails AS D
ON A.id = D.author_id;

-- List of Books by an Author: Write a query to list all books written by a specific author. Include the book's title, publication date, and number of pages.
SELECT A.name, B.title, B.publication_date, b.pages FROM Authors AS A
LEFT JOIN Books as B ON B.author_id = A.id;

-- Books in a Category: Write a query to find all books that belong to a specific category, such as 'Science'. Display the book titles and their authors.
SELECT C.name, B.title, A.name FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
LEFT JOIN Books AS B ON BC.book_id = B.id
LEFT JOIN Authors AS A ON A.id = B.author_id
WHERE C.name LIKE "Fiction";

-- Count of Books in Each Category: Write a query to count how many books are in each category. Display the category name and the number of books.
SELECT C.name, COUNT(BC.book_id) FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
GROUP BY C.name;

-- Authors with No Awards: Write a query to find all authors who have not received any awards. Display their names and biographies.
SELECT A.name, AD.biography FROM Authors AS A
LEFT JOIN AuthorDetails as AD on AD.author_id = A.id
WHERE AD.awards IS NULL;


SELECT * FROM Books;
UPDATE Books SET pages = 501 WHERE Books.title like "The Future World";
SELECT * FROM Books;

-- DELETE FROM Books WHERE Books.pages > 300;

-- Search Books by Title Keyword: Write a query to find books whose titles contain a specific keyword, like 'World'. Display the book titles and their authors.
SELECT B.title, A.name FROM Books AS B
LEFT JOIN Authors AS A ON B.author_id = A.id
WHERE B.title LIKE "%World%";

-- List of Authors Born Before a Certain Year: Write a query to list all authors born before a specific year, say 1980. Display their names and birthdates.
SELECT A.name, A.birthdate FROM Authors AS A
WHERE A.birthdate < "1980-01-01";