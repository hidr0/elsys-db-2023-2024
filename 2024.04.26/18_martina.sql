drop database if exists Music;
create database Music;
use Music;

create table Artist(
	id varchar(128) not null primary key,
    name varchar(100) not null,
    email varchar(100) not null
);

insert into Artist(id, name, email) values(uuid(), "Jorge Rivera-Herrans", "jorge@yahoo.com");
insert into Artist(id, name, email) values(uuid(), "Talya Sindel", "talyas@gmail.com");

create table Label(
	id varchar(128) not null primary key,
    artist_id varchar(128) not null,
    name varchar(100) not null,
    adress varchar(100) not null,
    foreign key (artist_id) references Artist(id)
);

insert into Label(id, name, adress) values(uuid(), "Good Music Ent.", "New York");
insert into Label(id, name, adress) values(uuid(), "Happy Face", "New York");

-- ne e gotovo
