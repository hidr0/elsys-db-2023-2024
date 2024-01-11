DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;


CREATE TABLE Author (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL CHECK (LENGTH(name) > 3),
    email VARCHAR(100) UNIQUE NOT NULL,
    birthdate DATE NOT NULL
);

INSERT INTO Author (name, email, birthdate)
VALUES 	('John Doe', 'johndoe@example.com', '1975-04-12'),
		('Jane Smith', 'janesmith@example.com', '1980-11-23');

CREATE TABLE AuthorDetails (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author_id INT NOT NULL UNIQUE,
    biography TEXT,
    awards TEXT,
    FOREIGN KEY (author_id) REFERENCES Author(id)
);

INSERT INTO AuthorDetails (author_id, biography, awards)
VALUES 	(1, 'A prolific writer in the mystery genre.', 'Best Mystery Writer 2003'),
		(2, 'Known for her science fiction works.', '');

CREATE TABLE Book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    publication_date DATE,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    pages INT CHECK (pages > 0),
    FOREIGN KEY (author_id) REFERENCES Author(id)
);

INSERT INTO Book (title, author_id, publication_date, isbn, pages)
VALUES 	('Adventure in the Alps', 1, '2001-07-16', '1234567890123', 220),
		('The Future World', 2, '2005-09-10', '9876543210987', 310),
        ('The Future World 2', 2, '2008-09-11', '5003553419352', 520);

CREATE TABLE Category (
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Category (name)
VALUES 	('Fiction'),
		('Science'),
		('Adventure');

CREATE TABLE BookCategory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (category_id) REFERENCES Category(id)
);

INSERT INTO BookCategory (book_id, category_id)
VALUES 	(1, 3),
		(2, 2),
		(2, 1);

-- 1
SELECT Author.name, Author.email, Author.birthdate, AuthorDetails.biography, AuthorDetails.awards
FROM Author
LEFT JOIN AuthorDetails ON Author.id = AuthorDetails.author_id
WHERE Author.name = 'John Doe';

-- 2
SELECT Book.title, Book.publication_date, Book.pages 
FROM Book
LEFT JOIN Author ON Author.id = Book.author_id
WHERE Author.name = 'Jane Smith';

-- 3
SELECT Book.title, Author.name 
FROM BookCategory
LEFT JOIN Book ON Book.id = BookCategory.book_id
LEFT JOIN Author ON Author.id = Book.author_id
LEFT JOIN Category ON Category.id = BookCategory.category_id
WHERE Category.name = 'Adventure';

-- 4
SELECT Category.name, COUNT(BookCategory.book_id) AS book_count
FROM Category
LEFT JOIN BookCategory ON Category.id = BookCategory.category_id
GROUP BY Category.name;

-- 5
SELECT Author.name, AuthorDetails.biography
FROM Author
LEFT JOIN AuthorDetails ON Author.id = AuthorDetails.author_id
WHERE AuthorDetails.awards IS NULL OR AuthorDetails.awards = '';

-- 6
UPDATE Book SET pages = 501
WHERE title = 'The Future World';

SELECT Book.title, Book.pages FROM Book
WHERE title = 'The Future World';

-- 7


-- 8
SELECT Book.title, Author.name
FROM Book
LEFT JOIN Author ON Book.author_id = Author.id
WHERE Book.title LIKE '%World%';

-- 9
SELECT Author.name, Author.birthdate
FROM Author
WHERE Author.birthdate < '1980-01-01';