DROP DATABASE IF EXISTS Bookstore;
CREATE DATABASE Bookstore;
USE Bookstore;


CREATE TABLE Authors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL CHECK(length(name) > 3),
    email VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATE NOT NULL
);

CREATE TABLE AuthorDetails (
	id INT PRIMARY KEY AUTO_INCREMENT,
    biography TEXT,
    awards TEXT,
    author_id INT NOT NULL UNIQUE,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE TABLE Books (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    publication_date DATE NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    pages INT NOT NULL CHECK(pages > 0),
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

CREATE TABLE Categories (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE BookCategories (
	id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (book_id) REFERENCES Books(id)
);

INSERT INTO Authors (name, email, birthdate)
VALUES ('John Doe', 'johndoe@example.com', '1975-04-12'),
	('Jane Smith', 'janesmith@example.com', '1980-11-23');
        
INSERT INTO AuthorDetails (author_id, biography, awards)
VALUES (1, 'A prolific writer in the mystery genre.', 'Best Mystery Writer 2003'),
	(2, 'Known for her science fiction works.', NULL);
    
INSERT INTO Books (title, author_id, publication_date, isbn, pages)
VALUES ('Adventure in the Alps', 1, '2001-07-16', '1234567890123', 220),
	('The Future World', 2, '2005-09-10', '9876543210987', 310),
	('The Future World 2', 2, '2008-09-11', '5003553419352', 520);

INSERT INTO Categories (name)
VALUES ("Fiction"), ("Science"), ("Adventure"), ("Pulp Fiction");

INSERT INTO BookCategories (category_id, book_id) VALUES(3, 1);
INSERT INTO BookCategories (category_id, book_id) VALUES(2, 2);
INSERT INTO BookCategories (category_id, book_id) VALUES(3, 2);
INSERT INTO BookCategories (category_id, book_id) VALUES(2, 3);
INSERT INTO BookCategories (category_id, book_id) VALUES(3, 3);
INSERT INTO BookCategories (category_id, book_id) VALUES(1, 3);

-- 1
SELECT A.name, A.email, A.birthdate, D.biography, D.awards FROM Authors as A
LEFT JOIN AuthorDetails AS D
ON A.id = D.author_id;

-- 2
SELECT A.name, B.title, B.publication_date, B.pages FROM Authors AS A
LEFT JOIN Books AS B
ON B.author_id = A.id;

-- 3
SELECT C.name, B.title, A.name FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
LEFT JOIN Books AS B ON B.id = BC.book_id
LEFT JOIN Authors AS A ON A.id = B.author_id
WHERE C.name LIKE "Fiction";

-- 4
SELECT C.name, COUNT(BC.book_id) FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
GROUP BY C.name;

-- 5
SELECT * FROM Authors AS A
LEFT JOIN AuthorDetails AS AD ON AD.author_id = A.id
WHERE AD.awards IS NULL;

-- 6
SELECT * FROM Books;
UPDATE Books SET pages = 501 WHERE Books.title LIKE "The Future World";
SELECT * FROM Books;

-- 7
 -- DELETE FROM Books WHERE Books.pages > 300;
 
-- 8
SELECT A.name, B.title FROM Books AS B
LEFT JOIN Authors AS A ON B.author_id = A.id
WHERE B.title LIKE "%World%";

-- 9
SELECT A.name, A.birthdate FROM AUthors AS A
WHERE A.birthdate < "1980-01-01";