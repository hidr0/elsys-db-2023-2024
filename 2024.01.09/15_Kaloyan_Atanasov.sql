DROP DATABASE IF EXISTS Literature;
CREATE DATABASE Literature;
USE Literature;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Authors(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100) CHECK(length(name) > 3) NOT NULL,
    email varchar(100) UNIQUE NOT NULL,
    birthdate date NOT NULL
);

INSERT INTO Authors(name, email, birthdate) VALUES("John Doe", "johndoe@example.com", '1975-04-12');
INSERT INTO Authors(name, email, birthdate) VALUES("Jane Smith", "janesmith@example.com", '1980-11-23');

CREATE TABLE AuthorDetails(
	id int PRIMARY KEY AUTO_INCREMENT,
    biography TEXT,
    awards TEXT,
    author_id int NOT NULL UNIQUE,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);

INSERT INTO AuthorDetails(biography, awards, author_id) VALUES("A prolific writer in the mystery genre.", "Best Mystery Writer 2003", 1);
INSERT INTO AuthorDetails(biography, awards, author_id) VALUES("Known for her science fiction works", NULL, 2);

CREATE TABLE Books(
	id int PRIMARY KEY AUTO_INCREMENT,
    title varchar(80) UNIQUE NOT NULL,
    production_date date NOT NULL,
    isbn varchar(20) UNIQUE NOT NULL,
	pages int CHECK(pages > 0),
    author_id int not null,
    FOREIGN KEY(author_id) REFERENCES AUTHORS(id)
);

INSERT INTO Books(title, production_date, isbn, pages, author_id) VALUES("Adventures in the Alps", '2001-07-16', "1234567890123", 220, 1);
INSERT INTO Books(title, production_date, isbn, pages, author_id) VALUES("The Future World", '2005-09-10', "9876543210987", 310, 2);
INSERT INTO Books(title, production_date, isbn, pages, author_id) VALUES("The Future World II", "2007-09-10", "9876543210989", 309, 2);

CREATE TABLE Categories(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) UNIQUE NOT NULL
);

INSERT INTO Categories(name) VALUES("Fiction");
INSERT INTO Categories(name) VALUES("Science");
INSERT INTO Categories(name) VALUES("Adventure");
INSERT INTO Categories(name) VALUES("Pulp Fiction");

CREATE TABLE BookCategories(
	id int PRIMARY KEY AUTO_INCREMENT,
	book_id int NOT NULL UNIQUE,
    categorie_id int NOT NULL UNIQUE,
    FOREIGN KEY (book_id) REFERENCES Books(id),
    FOREIGN KEY (categorie_id) REFERENCES Categories(id)
);

INSERT INTO BookCategories(book_id, categorie_id) VALUES(3, 1);
INSERT INTO BookCategories(book_id, categorie_id) VALUES(2, 2);
INSERT INTO BookCategories(book_id, categorie_id) VALUES(1, 2);
INSERT INTO BookCategories(book_id, categorie_id) VALUES(2, 3);
INSERT INTO BookCategories(book_id, categorie_id) VALUES(1, 3);

-- 1. Retrieve Author Details
SELECT A.name, A.email, A.birthdate, D.biography, D.awards FROM Authors as A
LEFT JOIN AuthorDetails AS D
ON A.id = D.author_id;

-- 2. List of Books by an Author
SELECT A.name, B.title, B.publication_date, b.pages FROM Authors AS A
LEFT JOIN Books as B ON B.author_id = A.id;

-- 3. Books in a Category
SELECT C.name, B.title, A.name FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
LEFT JOIN Books AS B ON BC.book_id = B.id
LEFT JOIN Authors AS A ON A.id = B.author_id
WHERE C.name LIKE "Fiction";

-- 4. Count of Books in each Categorie
SELECT C.name, COUNT(BC.book_id) FROM Categories AS C
LEFT JOIN BookCategories AS BC ON C.id = BC.category_id
GROUP BY C.name;

-- 5. Authors with no Awards
SELECT A.name, AD.biography FROM Authors AS A
LEFT JOIN AuthorDetails as AD on AD.author_id = A.id
WHERE AD.awards IS NULL;

-- 6. Update book information
SELECT * FROM Books;
UPDATE Books SET pages = 501 WHERE Books.title like "The Future World";
SELECT * FROM Books;

-- 7. Delete an author

-- 8. Search books by title keyword
SELECT B.title, A.name FROM Books AS B
LEFT JOIN Authors AS A ON B.author_id = A.id
WHERE B.title LIKE "%World%";

-- 9. List of authors born before a ceratain year
SELECT A.name, A.birthdate FROM Authors AS A
WHERE A.birthdate < "1980-01-01";