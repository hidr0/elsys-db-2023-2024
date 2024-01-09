DROP DATABASE IF EXISTS uml;
CREATE DATABASE uml;
USE uml;


CREATE TABLE Authors (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL CHECK(length(name) > 3),
    email VARCHAR(100) UNIQUE NOT NULL,
    birthdate DATE NOT NULL
);

CREATE TABLE AuthorDetails (
	id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL,
    biography TEXT,
    awards TEXT,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE TABLE Books (
	id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL,
	title VARCHAR(200) NOT NULL,
	publication_date DATE,
	isbn VARCHAR(20) UNIQUE NOT NULL,
	pages INT CHECK(pages > 0),
    FOREIGN KEY(author_id) REFERENCES Authors(id)
);

CREATE TABLE Categories (
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE BookCategories(
	id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NULL,
	book_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(id) ON DELETE CASCADE
);


INSERT INTO Authors(name, email, birthdate) VALUES
("John Doe", "johndoe@example.com", "1975-04-12"),
("Jane Smith", "janesmith@example.com", "1980-11-23");

INSERT INTO AuthorDetails(author_id, biography, awards) VALUES
(1, "A prolific writer in the mystery genre.", "Best Mystery Writer 2003"),
(2, "Known for her science fiction works.", "Sci-Fi Author of the Year 2006");

INSERT INTO Books(author_id, title, publication_date, isbn, pages) VALUES
(1, "Adventure in the Alps", "2001-07-16", "1234567890123", 220),
(2, "The Future World", "2005-09-10", "9876543210987", 310);

INSERT INTO Categories(name) VALUES
("Fiction"),
("Science"),
("Adventure");

INSERT INTO BookCategories(category_id, book_id) VALUES
(3, 1),
(2, 2),
(1, 2);


-- Retrieve Author Details: Write a query to retrieve the full profile of an author by name.
-- Include the author's name, email, birthdate, biography, and awards.
SELECT Authors.name, Authors.email, Authors.birthdate, AuthorDetails.biography, AuthorDetails.awards
FROM Authors
LEFT JOIN AuthorDetails ON Authors.id = AuthorDetails.author_id;

-- List of Books by an Author: Write a query to list all books written by a specific author.
-- Include the book's title, publication date, and number of pages.
SELECT Authors.name, Books.title, Books.publication_date, Books.pages
FROM Books
LEFT JOIN Authors ON Authors.id = Books.author_id;

-- Books in a Category: Write a query to find all books that belong to a specific category,
-- such as 'Science'. Display the book titles and their authors.
SELECT Categories.name, Books.title
FROM Categories
LEFT JOIN BookCategories ON Categories.id = BookCategories.category_id
LEFT JOIN Books ON BookCategories.book_id = Books.id;

-- Count of Books in Each Category: Write a query to count how many books are in each category.
-- Display the category name and the number of books.
SELECT Categories.name, COUNT(Books.title)
FROM Categories
LEFT JOIN BookCategories ON Categories.id = BookCategories.category_id
LEFT JOIN Books ON BookCategories.book_id = Books.id
GROUP BY Categories.name;

-- Authors with No Awards: Write a query to find all authors who have not received any awards.
-- Display their names and biographies.
SELECT Authors.name, AuthorDetails.biography
FROM Authors
LEFT JOIN AuthorDetails ON Authors.id = AuthorDetails.author_id
WHERE AuthorDetails.awards IS NULL OR length(AuthorDetails.awards) <= 1;

-- Update Book Information: Write a query to update the number of pages of a specific book.
-- Update the book "The Future World" to have 501 pages.
UPDATE Books SET Books.pages = 501 WHERE Books.title LIKE "The Future World";

-- Delete a Book: Write a query to delete an author from the Books table.
-- Delete the Books which have more than 200 pages.
DELETE FROM Books WHERE Books.pages > 300;

-- Search Books by Title Keyword: Write a query to find books whose titles contain a
-- specific keyword, like 'World'. Display the book titles and their authors.
SELECT Books.title, Authors.name
FROM Books
LEFT JOIN Authors ON Books.author_id = Authors.id
WHERE Books.title LIKE "%World%";

-- List of Authors Born Before a Certain Year: Write a query to list all authors born
-- before a specific year, say 1980. Display their names and birthdates.
SELECT Authors.name, Authors.birthdate
FROM Authors
WHERE Authors.birthdate < "1980-01-01";








