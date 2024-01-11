DROP DATABASE IF EXISTS abc;
CREATE DATABASE abc;
USE abc;

CREATE TABLE AuthorDetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL,
    biography TEXT,
    awards TEXT
);

CREATE TABLE Authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL CHECK(LENGTH(name) > 3),
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATE NOT NULL,
    author_details_id INT UNIQUE,
    FOREIGN KEY (author_details_id) REFERENCES AuthorDetails(id)
        ON DELETE CASCADE
);

CREATE TABLE Books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    author_name VARCHAR(100) NOT NULL,
    publication_date DATE,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    pages INT CHECK(pages > 0),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
        ON DELETE CASCADE
);

CREATE TABLE Categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE BooksCategories (
    book_id INT,
    category_id INT,
    PRIMARY KEY (book_id, category_id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

INSERT INTO AuthorDetails(author_name, biography, awards)
VALUES ("John Doe", "A prolific writer in the mystery genre.", "Best Mystery Writer 2003");
INSERT INTO AuthorDetails(author_name, biography, awards)
VALUES ("Jane Smith", "Known for her science fiction works.", "Sci-Fi Author of the Year 2006");

INSERT INTO Authors(name, email, birthdate, author_details_id)
VALUES ("John Doe", "johndoe@example.com", "1975-04-12", 1);
INSERT INTO Authors(name, email, birthdate, author_details_id)
VALUES ("Jane Smith", "janesmith@example.com", "1980-11-23", 2);

INSERT INTO Books(title, author_name, publication_date, isbn, pages, author_id)
VALUES ("Advendure in the Alps", "John Doe", "2001-07-16", "1234567890123", 220, 1);
INSERT INTO Books(title, author_name, publication_date, isbn, pages, author_id)
VALUES ("The Future World", "Jane Smith", "2005-09-10", "9876543210987", 310, 2);

INSERT INTO Categories(name)
VALUES ("Fiction");
INSERT INTO Categories(name)
VALUES ("Science");
INSERT INTO Categories(name)
VALUES ("Adventure");

INSERT INTO BooksCategories(book_id, category_id)
VALUES (1, 3);
INSERT INTO BooksCategories(book_id, category_id)
VALUES (2, 1);
INSERT INTO BooksCategories(book_id, category_id)
VALUES (2, 2);


-- 1
SELECT Authors.name, Authors.email, Authors.birthdate, AuthorDetails.biography, AuthorDetails.awards
FROM Authors
JOIN AuthorDetails ON Authors.author_details_id = AuthorDetails.id;

-- 2
SELECT Books.title, Books.publication_date, Books.pages
FROM Books
WHERE author_name = "John Doe";

-- 3
SELECT Books.title, Books.author_name
FROM Categories
LEFT JOIN BooksCategories ON Categories.id = BooksCategories.category_id
LEFT JOIN Books ON BooksCategories.book_id = Books.id
WHERE Categories.name = "Science";

-- 4
SELECT Categories.name, COUNT(*)
FROM Books
LEFT JOIN BooksCategories ON Books.id = BooksCategories.book_id
LEFT JOIN Categories ON BooksCategories.category_id = Categories.id
GROUP BY Categories.name;

-- 5
SELECT Authors.name, AuthorDetails.biography
FROM Authors
LEFT JOIN AuthorDetails ON Authors.author_details_id = AuthorDetails.id
WHERE AuthorDetails.awards IS NULL;

-- 6
UPDATE Books
SET pages = 100
WHERE id = 1;

-- 7
DELETE FROM AuthorDetails
WHERE id IN (
    SELECT author_details_id
    FROM Authors
    WHERE id = 1
);

-- 8
SELECT title, author_name
FROM Books
WHERE title LIKE "%World%";

-- 9
SELECT name, birthdate
FROM Authors
WHERE birthdate < "1980-01-01";
