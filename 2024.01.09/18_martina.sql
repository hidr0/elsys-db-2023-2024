drop database if exists Bookstore;
create database Bookstore;
use Bookstore;

create table Authors (
	id int primary key auto_increment,
	name varchar(100) not null check(length(name) > 3),
    email varchar(100) unique not null,
    birthdate date not null
);

insert into Authors(name, email, birthdate) values ("John Doe", "johndoe@example.com", "1975-04-12");
insert into Authors(name, email, birthdate) values ("Jane Smith", "janesmith@example.com", "1980-11-23");

create table AuthorDetails (
	id int primary key auto_increment,
    biography text,
    awards text,
    author_id int not null unique,
    foreign key (author_id) references Authors(id)
);

insert into AuthorDetails(biography, awards, author_id) values ("A prolific writer in the mystery genre.", "Best Mystery Writer 2003", 1);
insert into AuthorDetails(biography, awards, author_id) values ("Known for her science fiction works.", NULL, 2);

create table Books (
	id int primary key auto_increment,
    title varchar(200) not null,
    publication_date date,
    isbn varchar(20) unique not null,
    pages int check(pages > 0),
    author_id int not null,
    foreign key (author_id) references Authors(id)
);

insert into Books(title, publication_date, isbn, pages, author_id) values("Adventure in the Alps", "2001-07-16", 1234567890123, 220, 1);
insert into Books(title, publication_date, isbn, pages, author_id) values("The Future World", "2005-09-10", 9876543210987, 310, 2);
insert into Books(title, publication_date, isbn, pages, author_id) values("The Future World 2", "2007-09-10", 9876375210987, 306, 2);

create table Categories (
	id int primary key auto_increment,
	name varchar(100) not null
);

insert into Categories(name) values("Fiction");
insert into Categories(name) values("Science");
insert into Categories(name) values("Adventure");

create table BookCategories( 
	id int primary key auto_increment,
	category_id int not null,
    book_id int not null,
    foreign key (category_id) references Categories(id),
    foreign key (book_id) references Books(id)
);

insert into BookCategories(category_id, book_id) values(3, 1);
insert into BookCategories(category_id, book_id) values(3, 1);

-- 1 query
select A.name, A.email, A.birthdate, D.biography, D.awards from Authors as A 
left join AuthorDetails as D on A.id = D.author_id;

-- 2 query
select A. name, B.title, B.publication_date, B.pages 
from Authors as A left join Books as B on B.author_id = A.id;

-- 3 query 
select C.name from Categories as C
left join BookCategories as BC on C.id = BC.category_id
left join Books as B on BC.book_id = B.id
left join Authors as A on A.id = B.author_id
where C.name like "Fiction";

-- 4 query
select C.name, count(BC.book_id) from Categories as C 
left join BookCategories as BC on C.id = BC.category_id
group by C.name;

-- 5 query
select A.name, AD.biography from Authors as A 
left join AuthorDetails as AD on AD.author_id = A.id
where AD.awards is null;

-- 6 query
select * from Books;
update Books set pages = 501 where Books.title like "The Future World";
select * from Books;

-- 8 query
select B.title, A.name from Books as B
left join Authors as A on A.id = B.author_id
where B.title like "%World%";

-- 9
select A.name, A.birthdate from Authors as A
where A.birthdate < "1980-01-01";