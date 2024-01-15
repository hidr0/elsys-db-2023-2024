CREATE TABLE Authors (
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    birthdate DATE NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE AuthorDetails (
    author_name VARCHAR(100) PRIMARY KEY,
    biography TEXT,
    awards TEXT,
    FOREIGN KEY (author_name) REFERENCES Authors(name)
);

CREATE TABLE Books (
    title VARCHAR(200) NOT NULL,
    publication_date DATE,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    pages INT CHECK (pages > 0),
    author_name VARCHAR(100),
    PRIMARY KEY (title),
    FOREIGN KEY (author_name) REFERENCES Authors(name)
);

CREATE TABLE Categories (
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (name)
);

CREATE TABLE BookCategories (
    book_title VARCHAR(200),
    category_name VARCHAR(100),
    PRIMARY KEY (book_title, category_name),
    FOREIGN KEY (book_title) REFERENCES Books(title),
    FOREIGN KEY (category_name) REFERENCES Categories(name)
);

INSERT INTO Authors (name, email, birthdate) VALUES
('John Doe', 'johndoe@example.com', '1975-04-12'),
('Jane Smith', 'janesmith@example.com', '1980-11-23');

INSERT INTO AuthorDetails (author_name, biography, awards) VALUES
('John Doe', 'A prolific writer in the mystery genre.', 'Best Mystery Writer 2003'),
('Jane Smith', 'Known for her science fiction works.', 'Sci-Fi Author of the Year 2006');

INSERT INTO Books (title, publication_date, isbn, pages, author_name) VALUES
('Adventure in the Alps', '2001-07-16', '1234567890123', 220, 'John Doe'),
('The Future World', '2005-09-10', '9876543210987', 310, 'Jane Smith');

INSERT INTO Categories (name) VALUES
('Fiction'),
('Science'),
('Adventure');

INSERT INTO BookCategories (book_title, category_name) VALUES
('Adventure in the Alps', 'Adventure'),
('The Future World', 'Science'),
('The Future World', 'Fiction');

SELECT Authors.name, Authors.email, Authors.birthdate, AuthorDetails.biography, AuthorDetails.awards
FROM Authors
JOIN AuthorDetails ON Authors.name = AuthorDetails.author_name
WHERE Authors.name = 'John Doe';

SELECT Books.title, Books.publication_date, Books.pages
FROM Books
WHERE Books.author_name = 'John Doe';

SELECT Books.title, Authors.name
FROM Books
JOIN BookCategories ON Books.title = BookCategories.book_title
JOIN Authors ON Books.author_name = Authors.name
WHERE BookCategories.category_name = 'Science';

SELECT Categories.name, COUNT(BookCategories.book_title) AS book_count
FROM Categories
LEFT JOIN BookCategories ON Categories.name = BookCategories.category_name
GROUP BY Categories.name;

SELECT Authors.name, AuthorDetails.biography
FROM Authors
LEFT JOIN AuthorDetails ON Authors.name = AuthorDetails.author_name
WHERE AuthorDetails.awards IS NULL;

UPDATE Books
SET pages = 501
WHERE title = 'The Future World';

DELETE FROM Books
WHERE title = 'Adventure in the Alps' AND pages > 200;

SELECT Books.title, Authors.name
FROM Books
JOIN Authors ON Books.author_name = Authors.name
WHERE Books.title LIKE '%World%';

SELECT name, birthdate
FROM Authors
WHERE birthdate < '1980-01-01';
