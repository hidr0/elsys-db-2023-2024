DROP DATABASE IF EXISTS Bookdb;
CREATE DATABASE Bookdb;
USE Bookdb;

-- Table creation
CREATE TABLE Authors
(
    Id        INT PRIMARY KEY AUTO_INCREMENT        NOT NULL,
    Name      VARCHAR(100) CHECK (LENGTH(Name) > 3) NOT NULL,
    Email     VARCHAR(100) UNIQUE                   NOT NULL,
    Birthdate DATE                                  NOT NULL
);

CREATE TABLE Authordetails
(
    Id        INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Author_Id INT                            NOT NULL,
    Biography TEXT,
    Awards    TEXT,
    FOREIGN KEY (Author_Id) REFERENCES Authors (Id) ON DELETE CASCADE
);

CREATE TABLE Books
(
    Id               INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Title            VARCHAR(200)                   NOT NULL,
    Author_Id        INT                            NOT NULL,
    Publication_Date DATE,
    Isbn             VARCHAR(20) UNIQUE             NOT NULL,
    Pages            INT CHECK (Pages > 0),
    FOREIGN KEY (Author_Id) REFERENCES Authors (Id) ON DELETE CASCADE
);

CREATE TABLE Categories
(
    Id   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name VARCHAR(100)                   NOT NULL
);

CREATE TABLE Bookcategories
(
    Id          INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Book_Id     INT                            NOT NULL,
    Category_Id INT                            NOT NULL,
    FOREIGN KEY (Book_Id) REFERENCES Books (Id) ON DELETE CASCADE,
    FOREIGN KEY (Category_Id) REFERENCES Categories (Id) ON DELETE CASCADE
);


-- Insertions
INSERT INTO Authors (Name, Email, Birthdate)
VALUES ('John Doe', 'johndoe@example.com', '1975-04-12'),
       ('Doe John', 'doejohn@example.com', '1974-05-13'),
       ('Jane Smith', 'janesmith@example.com', '1980-11-23');

INSERT INTO Authordetails (Author_Id, Biography, Awards)
VALUES (1, 'A prolific writer in the mystery genre.', 'Best Mystery Writer 2003'),
       (2, 'A writer of various genres.', NULL),
       (3, 'Known for her science fiction works.', 'Sci-Fi Author of the Year 2006');

-- Insert data into Books Table
INSERT INTO Books (Title, Author_Id, Publication_Date, Isbn, Pages)
VALUES ('Adventure in the Alps', 1, '2001-07-16', '1234567890123', 270),
       ('The Future World', 3, '2005-09-10', '9876543210987', 310),
       ('The Future World ||', 3, '2006-09-10', '9876543210988', 270);

-- Insert data into Categories Table
INSERT INTO Categories (Name)
VALUES ('Fiction'),
       ('Science'),
       ('Adventure');

-- Insert data into BookCategories Table
INSERT INTO Bookcategories (Book_Id, Category_Id)
VALUES (1, 3),
       (2, 2),
       (2, 1),
       (3, 2);


-- (1) Retrieve Author Details
SELECT Authors.Name            AS Name,
       Authors.Email           AS Email,
       Authors.Birthdate       AS 'DATE OF BIRTH',
       Authordetails.Biography AS Biography,
       Authordetails.Awards    AS Awards
FROM Authors
         JOIN Authordetails ON Authors.Id = Authordetails.Author_Id
WHERE Authors.Name = 'John Doe';

-- (2) List of Books by an Author
SELECT Title AS Title, Publication_Date AS 'PUBLICATION DATE', Pages AS Pages
FROM Books
         LEFT JOIN Authors ON Authors.Id = Books.Author_Id
WHERE Authors.Name = 'John Doe';

-- (3) Books in a Category
SELECT Books.Title AS Title, Authors.Name AS Author
FROM Books
         JOIN Bookcategories ON Books.Id = Bookcategories.Book_Id
         JOIN Authors ON Books.Author_Id = Authors.Id
         JOIN Categories ON Bookcategories.Category_Id = Categories.Id
WHERE Categories.Name = 'Science';

-- (4) Count of Books in Each Category
SELECT Categories.Name AS Name, COUNT(Bookcategories.Category_Id) AS 'NUMBER OF BOOKS'
FROM Categories
         LEFT JOIN Bookcategories ON Categories.Id = Bookcategories.Category_Id
GROUP BY Categories.Name;

-- (5) Authors with No Awards
SELECT Authors.Name, Authordetails.Biography
FROM Authors
         JOIN Authordetails ON Authors.Id = Authordetails.Author_Id
WHERE Authordetails.Awards IS NULL;

-- (6) Update Book Information
UPDATE Books
SET Pages = 501
WHERE Title = 'The Future World';

-- (7) Delete books from author
DELETE
FROM Books
WHERE Books.Pages > 200
  AND Author_Id = (SELECT Id
                   FROM Authors
                   WHERE Name = 'John Doe');

-- (8) Search Books by Title Keyword
SELECT Title AS Title, Authors.Name AS Author
FROM Books
         JOIN Authors ON Books.Author_Id = Authors.Id
WHERE Title LIKE '%Alps%';

-- (9) List of Authors Born Before a Certain Year
SELECT Name AS Name, Birthdate AS 'BIRTH DATE'
FROM Authors
WHERE Birthdate < '1980-01-01';


