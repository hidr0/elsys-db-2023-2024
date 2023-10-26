drop database if exists SchoolLibrary;
create database SchoolLibrary;
use SchoolLibrary;

create table Books (
    BookID int auto_increment primary key,
    Title varchar(255) not null,
    Author varchar(255) not null,
    Genre varchar(50),
    YearPublished int,
    CopiesAvailable int,
    TotalPages int
);

insert into Books (Title, Author, Genre, YearPublished, CopiesAvailable, TotalPages)
values
("Harry Potter and the Philosopher's Stone", "J.K. Rowling", "Fantasy", 1997, 5, 309),
("To Kill a Mockingbird", "Harper Lee", "Classic", 1960, 2, 281),
("The Great Gatsby", "F. Scott Fitzgerald", "Classic", 1925, 3, 180),
("1984", "George Orwell", "Dystopian", 1949, 1, 328),
("A Wrinkle in Time", "Madeleine L'Engle", "Sci-Fi", 1962, 3, 211);

select * from Books;
select * from Books where Author = "J.K. Rowling";
select * from Books where Genre = "Classic" or Genre = "Dystopian" and not Genre = "Fantasy";
select * from Books order by YearPublished;
update Books set CopiesAvailable = 2 where Title = '1984';
delete from Books where Title = '1984';
select * from Books limit 3;

select count(*) as TotalBooks from Books;
select avg(TotalPages) as AvgPages from Books;
select sum(TotalPages) as TotalPages from Books;
select * from Books where Title like 'The%';

alter table Books add ISBN varchar(50) null;
select * from Books where ISBN is null;
