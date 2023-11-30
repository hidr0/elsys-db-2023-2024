drop database if exists school;
create database school;
use school;

create table addresses(
	id serial primary key,
    street varchar(200)
);

insert into addresses(street)
values
	("Mladost 4, 12, 437"),
    ("Malinova Dolina, bl 70");

select * from addresses;

create table students(
	id serial primary key,
    name varchar(200) not null unique,
    address_id bigint unsigned unique not null,
    foreign key(address_id) references addresses(id)
);

insert into students(name, address_id)
values
	("Misho", 1),
   --  ("Pesho", 1), -- 11:50:40	Error Code: 1062. Duplicate entry '1' for key 'students.address_id'
    ("Strahil", 2);

select * from students;

create table subjects(
	id serial primary key,
    name enum("math", "databases")
);

insert into subjects(name)
values ("math"), ("databases");

create table grades(
	id serial primary key,
    grade tinyint unsigned not null check(grade in (2, 3, 4, 5, 6)),
    subject_id bigint unsigned not null,
    foreign key(subject_id) references subjects(id),
    student_id bigint unsigned not null,
    foreign key(student_id) references students(id)
);

insert into grades(grade, subject_id, student_id)
values
	(6, 1, 1),
    (4, 1, 1),
    (5, 1, 2),
    (3, 2, 2),
	(6, 2, 2);
    
insert into addresses(street) values ("ulica bez ocenki");
insert into students(name, address_id)
values ("uchenik bez ocenka", 3);

select * from addresses;
select * from students;
select * from grades;

-- (addresses.street, students.name) ∀ student ∈ students
-- (addresses.street, students.name) ∀ student ∈ students
-- (addresses.street, students.name) ∀ student ∈ students
-- (addresses.street, students.name) ∀ student ∈ students
-- (addresses.street, students.name) ∀ student ∈ students