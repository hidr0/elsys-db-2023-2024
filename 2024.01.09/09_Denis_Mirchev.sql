DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;

CREATE TABLE Authors
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL CHECK (LENGTH(name) > 3),
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATE NOT NULL
);

INSERT INTO Authors (name, email, birthdate) VALUES
("John Doe", "johndoe@example.com", "1975-04-12"),
("Jane Smith", "janesmith@example.com", "1980-11-23");

CREATE TABLE AuthorDetails
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    biography TEXT,
    awards TEXT,
    author_id INT NOT NULL UNIQUE,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

INSERT INTO AuthorDetails (biography, awards, author_id) VALUES
("A prolific writer in the mystery genre.", "Best Mystery Writer 2003", 1),
("Known for her science fiction works.", "JSci-Fi Author of the Year 2006", 2);

CREATE TABLE Books
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    publication_date DATE,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    pages INT NOT NULL CHECK (pages > 0),
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

INSERT INTO Books (title, publication_date, isbn, pages, author_id) VALUES
("Adventure in the Alps", "2001-07-16", "1234567890123", 220, 1),
("The Future World", "2005-09-10", "9876543210987", 310, 2);

CREATE TABLE Categories
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Categories (name) VALUES
("Fiction"),
("Science"),
("Adventure");

CREATE TABLE BookCategories
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

INSERT INTO BookCategories (book_id, category_id) VALUES
(1, 3),
(2, 2),
(2, 1);

# Retrieve Author Details: Write a query to retrieve the full profile of an author by name. Include the author's name, email, birthdate, biography, and awards.
SELECT A.name, A.email, A.birthdate, D.biography, D.awards FROM Authors AS A
LEFT JOIN AuthorDetails AS D ON A.id = D.author_id;

# List of Books by an Author: Write a query to list all books written by a specific author. Include the book's title, publication date, and number of pages.
SELECT A.name, B.title, B.publication_date, B.pages FROM Authors AS A
LEFT JOIN Books AS B ON A.id = B.author_id;

# Books in a Category: Write a query to find all books that belong to a specific category, such as 'Science'. Display the book titles and their authors.
SELECT B.title, A.name FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
LEFT JOIN Books AS B ON BC.book_id = B.id
LEFT JOIN Authors AS A ON B.author_id = A.id
WHERE C.name = "Fiction";

# Count of Books in Each Category: Write a query to count how many books are in each category. Display the category name and the number of books.
SELECT C.name, COUNT(B.id) FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
LEFT JOIN Books AS B ON BC.book_id = B.id
GROUP BY C.name;

# Authors with No Awards: Write a query to find all authors who have not received any awards. Display their names and biographies.
SELECT A.name, D.biography FROM Authors AS A
LEFT JOIN AuthorDetails AS D ON A.id = D.author_id
WHERE D.awards IS NULL;

# Update Book Information: Write a query to update the number of pages of a specific book. Update the book "The Future World" to have 501 pages.
UPDATE Books SET pages = 501 WHERE title = "The Future World";

# Delete a Book: Write a query to delete an author from the Books table. Delete the Books which have more than 200 pages.
# DELETE FROM Books WHERE pages > 200;

# Search Books by Title Keyword: Write a query to find books whose titles contain a specific keyword, like 'World'. Display the book titles and their authors.
SELECT B.title, A.name FROM Books AS B
LEFT JOIN Authors AS A ON B.author_id = A.id
WHERE B.title LIKE "%World%";

# List of Authors Born Before a Certain Year: Write a query to list all authors born before a specific year, say 1980. Display their names and birthdates.
SELECT A.name, A.birthdate FROM Authors AS A
WHERE A.birthdate < "1980-01-01";
