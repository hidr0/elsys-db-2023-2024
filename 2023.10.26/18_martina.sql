drop database if exists SchoolLibrary;
create database SchoolLibrary;
use SchoolLibrary;

create table Books (
	BookID int primary key auto_increment,
    Title varchar(256),
    Author varchar(256),
    Genre varchar(256),
    YearPublished int,
    CopiesAvailable int,
    TotalPages int
);

INSERT INTO Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
VALUES
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

select * from Books;
select * from Books where Author = "J.K. Rowling";
select * from Books where Genre = "Classic" or Genre = "Dystopian";
select * from Books where not Genre = "Fantasy";

select * from Books order by YearPublished;

update Books set CopiesAvailable = 2 where Title = "Harry Potter and the Philosopher's Stone";

delete from Books where Title = "To Kill a Mockingbird";

select * from Books limit 3;

select * from Books order by TotalPages asc limit 1;
select * from Books order by TotalPages desc limit 1;
select max(TotalPages) from Books;
select count(Title) from Books;
select avg(TotalPages) from Books;
select sum(TotalPages) from Books;

select * from Books where Title like "The%";

alter table Books add ISBN int;
select * from Books where ISBN is null;