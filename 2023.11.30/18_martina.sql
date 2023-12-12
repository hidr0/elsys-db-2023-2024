drop database if exists school;
create database school;
use school;

create table Address (
	id int primary key auto_increment,
    street varchar(200)
); 
    
insert into Address(street) values ("mladost 4, blok 437");
insert into Address(street) values ("malinova dolina, bl 78");

select * from Address;

create table Student (
	id int primary key auto_increment,
    name varchar(200) not null unique,
    address_id int not null unique,
    foreign key(address_id) references Address(id)
);

insert into Student(name, address_id) values("misho", 1);
insert into Student(name, address_id) values("strahil", 2);

select * from Student;

create table Subject (
	id int primary key auto_increment,
    name enum("mat", "bazi danni")
);

insert into Subject(name) values("mat");
insert into Subject(name) values("bazi danni");

select * from Subject;

create table Grade(
	id int primary key auto_increment,
    grade int not null check(grade in (2, 3, 4, 5, 6)),
    subject_id int not null ,
    foreign key(subject_id) references Subject(id),
    student_id int not null ,
    foreign key(student_id) references Student(id)
);

insert into Grade(grade, subject_id, student_id) values(6, 1, 1);
insert into Grade(grade, subject_id, student_id) values(4, 1, 1);
insert into Grade(grade, subject_id, student_id) values(5, 1, 2);
insert into Grade(grade, subject_id, student_id) values(3, 2, 2);
insert into Grade(grade, subject_id, student_id) values(6, 2, 2);

insert into Address(street) values ("tues");
insert into Student(name, address_id) values("uchenik bez ocenka", 3);

select * from Address;
select * from Student;
select * from Grade;

-- [Улица, Ученик] За всеки ученик.
select * from Address left join Student on Address.id = Student.address_id;

-- [Ученик, оценка] За всяка оценка.
select * from Student left join Grade on Grade.student_id = Student.id;

-- [Ученик, среден успех] За всеки ученик сортирани от най-нисък към най-голям. 
select name, avg(grade) from Student 
left join Grade on Grade.student_id = Student.id 
group by Student.id order by avg(grade) asc;

-- Името на ученика с най-висок среден успех.
select name from Student 
left join Grade on Grade.student_id = Student.id 
group by Student.id order by avg(grade) desc limit 1;

-- [Ученик, брой оценки] За всеки ученик.
select name, count(grade) from Student 
left join Grade on Grade.student_id = Student.id group by Student.id;

-- [Ученик, оценка, предмет] За всяка оценка. 
select Student.name, grade, Subject.name from Grade 
join Student on Grade.student_id = Student.id
join Subject on Grade.subject_id = Subject.id;

-- [Ученик, предмет, среден успех] Всеки ученик.
select Student.name, Subject.name , avg(grade) from Student 
join Grade on Grade.student_id = Student.id
join Subject on Grade.subject_id = Subject.id group by Student.id, Subject.id;

