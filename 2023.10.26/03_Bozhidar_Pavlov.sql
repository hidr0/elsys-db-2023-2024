-- (1) Setup
drop database if exists SchoolLibrary;

create database SchoolLibrary;
use SchoolLibrary;

create table Books (
	BookID serial primary key,
    Title text,
    Author text,
    Genre text,
    YearPublished int,
	CopiesAvailable int unsigned,
    TotalPages int unsigned
);

-- (2) INSERT INTO
insert into Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
values
	("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
	("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
	("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
	("1984", "George Orwell", "Dystopian", 1949, 1, 328),
	("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

-- (3) SELECT, WHERE, AND, OR, NOT

-- List all the books in the database.
select * from Books;

-- Find books written by "J.K. Rowling".
select *
from Books
where Author = "J.K. Rowling";

-- Find books that belong to the "Classic" or "Dystopian" genre.
select *
from Books
where Genre = "Classic" or Genre = "Dystopian";

-- Find books that are not from the "Fantasy" genre.
select *
from Books
where Genre <> "Fantasy";

-- (4) ORDER BY
-- List all books, ordered by the YearPublished column.
select *
from Books
order by YearPublished;

-- (5) UPDATE
-- Update the "CopiesAvailable" column for a specific book of your choice.
update Books
set CopiesAvailable = CopiesAvailable + 1
where BookID = 4;

select *
from Books
where BookID = 4;

-- (6) DELETE
--  Delete a book from the table based on its title.
delete
from Books
where Title = "1984";

select *
from Books
where Title = "1984";

-- (7) LIMIT
-- Display only the first three books in the table.
select *
from Books
limit 3;

-- (8) MIN, MAX, COUNT, AVG, SUM

-- Find the book with the minimum and maximum number of pages.

-- Minimum
select *
from Books
order by TotalPages asc
limit 1;

-- Maximum
select *
from Books
order by TotalPages desc
limit 1;

-- Count the total number of books in the library.
select count(*)
from Books;

-- Find the average number of pages across all books.
select avg(TotalPages)
from Books;

-- Calculate the total number of pages in the library.
select sum(TotalPages)
from Books;

-- (9) LIKE and Wildcards
-- Find books that have a title starting with "The".
select *
from Books
where Title like "The%";

-- (10) NULL Values

-- Add a new column for "ISBN" which can be NULL to the Books table.
alter table Books
add (ISBN text);

-- Find books where the ISBN value is NULL.
select *
from Books
where ISBN is null;