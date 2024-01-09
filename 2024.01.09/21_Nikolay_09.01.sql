DROP DATABASE IF EXISTS publisher;
CREATE DATABASE publisher;
USE publisher;

CREATE TABLE Authors(
	id int PRIMARY KEY AUTO_INCREMENT,
	name varchar(100) not null check (length(name) > 3),
	email varchar(100) unique not null,
	birthdate DATE not null
);

INSERT INTO Authors(name,email,birthdate) VALUES("John Doe", "johndoe@example.com", "1975-04-12");
INSERT INTO Authors(name,email,birthdate) VALUES("Jane Smith", "janesmith@example.com","1980-11-23");
INSERT INTO Authors(name,email,birthdate) VALUES("Ivan Ivanov", "iivanov@example.com","1100-11-13");

CREATE TABLE AuthorDetails(
	id int PRIMARY KEY AUTO_INCREMENT,
	biography text,
	awards text,
    author_id int unique not null,
    FOREIGN KEY(author_id) REFERENCES Authors(id)
);

INSERT INTO AuthorDetails(biography,awards,author_id) VALUES("A prolific writer in the mystery genre.","Best Mystery Writer 2003",1);
INSERT INTO AuthorDetails(biography,awards,author_id) VALUES("Known for her science fiction works.", "Sci-Fi Author of the Year 2006",2);
INSERT INTO AuthorDetails(biography,author_id) VALUES("Amazing author from Kaspichan",3);

CREATE TABLE Books(
	id int PRIMARY KEY AUTO_INCREMENT,
	title varchar(200) not null,
    author_id int not null,
    FOREIGN KEY(author_id) REFERENCES Authors(id),
	publication_date date,
	isbn varchar(20) unique not null,
	pages int check (pages > 0)
);

INSERT INTO Books(title,publication_date,isbn,pages,author_id) VALUES("Adventure in the Alps", "2001-07-16", "1234567890123", 220,1);
INSERT INTO Books(title,publication_date,isbn,pages,author_id) VALUES("The Future World", "2005-09-10", "9876543210987", 310,2);
INSERT INTO Books(title,publication_date,isbn,pages,author_id) VALUES("The Future World II", "2007-09-10", "9476123210987", 890,2);

CREATE TABLE Categories (
    id int PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

INSERT INTO Categories(name) VALUES("Fiction");
INSERT INTO Categories(name) VALUES("Science");
INSERT INTO Categories(name) VALUES("Adventure");
INSERT INTO Categories(name) VALUES("Pulp fiction");

CREATE TABLE BookCategories(
	id int PRIMARY KEY AUTO_INCREMENT,
    category_id int not null,
    book_id int not null,
    FOREIGN KEY(category_id) REFERENCES Categories(id),
    FOREIGN KEY(book_id) REFERENCES Books(id)
);

INSERT INTO BookCategories(category_id,book_id) VALUES(3,1);
INSERT INTO BookCategories(category_id,book_id) VALUES(1,2);
INSERT INTO BookCategories(category_id,book_id) VALUES(2,2);
INSERT INTO BookCategories(category_id,book_id) VALUES(1,3);
INSERT INTO BookCategories(category_id,book_id) VALUES(2,3);

-- 1 
SELECT A.name, A.email, A.birthdate, D.biography, D.awards FROM Authors as A
LEFT JOIN AuthorDetails as D
ON A.id = D.author_id;

-- 2
SELECT A.name, B.title, B.publication_date, B.pages FROM Authors as A
LEFT JOIN Books as B
ON B.author_id = A.id;

-- 3
SELECT C.name, B.title, A.name FROM Categories AS C
LEFT JOIN BookCategories As BC
ON C.id = BC.category_id
LEFT JOIN Books as B
ON BC.book_id = B.id
LEFT JOIN Authors as A
ON B.author_id = A.id
WHERE C.name like "Fiction";

-- 4
SELECT C.name, COUNT(BC.book_id) FROM Categories as C
LEFT JOIN BookCategories AS BC 
ON C.id = BC.category_id
GROUP BY C.id;

-- 5
SELECT A.name, AD.biography FROM Authors as A
LEFT JOIN AuthorDetails as AD
ON AD.author_id = A.id
WHERE AD.awards is null;

-- 6
UPDATE Books 
SET PAGES = 501
WHERE Books.title like "The future world";

SELECT * FROM Books;

-- 8 
SELECT B.title, A.name FROM Books as B
LEFT JOIN Authors AS A ON B.author_id = A.id
WHERE B.title LIKE "%World%";

-- 9
SELECT A.name, A.birthdate FROM Authors AS A
WHERE A.birthdate < "1980-01-01";