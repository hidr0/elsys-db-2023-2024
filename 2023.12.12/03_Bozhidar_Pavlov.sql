drop database if exists booking;
create database booking;
use booking;

create table hotels (
	id serial primary key,
	name varchar(255),
	phone_number varchar(20),
	street varchar(255)
);

create table rooms (
	id serial primary key,
	floor tinyint unsigned check (floor > 0),
	name varchar(255),
	hotel_id bigint unsigned not null,
	
	foreign key (hotel_id) references hotels(id)
);

create table people (
	id serial primary key,
	name varchar(255)
);

create table people_rooms (
	person_id bigint unsigned not null,
	room_id bigint unsigned not null,
	primary key (person_id, room_id),
	foreign key (person_id) references people(id),
	foreign key (room_id) references rooms(id)
);

insert into hotels (name, phone_number, street) values
	('Hotel A', '123-456-7890', '123 Main Street'),
	('Hotel B', '987-654-3210', '456 Oak Avenue'),
	('Hotel C', '555-123-4567', '789 Pine Road');

insert into rooms (floor, name, hotel_id) values
	(1, 'Room 101', 1),
	(2, 'Room 201', 1),
	(1, 'Room 102', 2),
	(2, 'Room 202', 2),
	(1, 'Room 103', 3),
	(2, 'Room 203', 3);

insert into people (name) values
	('John Doe'),
	('Jane Smith'),
	('Bob Johnson');

insert into people_rooms (person_id, room_id) values
	(1, 1),
	(1, 3),
	(2, 2),
	(2, 4),
	(3, 5),
	(3, 6);

-- Колко посетители има всеки хотел?
select
    hotels.name,
    count(people_rooms.person_id)
from
    hotels
left join rooms on hotels.id = rooms.hotel_id
left join people_rooms on rooms.id = people_rooms.room_id
group by
    hotels.id;

-- Извадете хотела без посетители.
select
    hotels.*
from
    hotels
left join rooms on hotels.id = rooms.hotel_id
left join people_rooms on rooms.id = people_rooms.room_id
where
    people_rooms.room_id is null;

-- [Хотел, Стая, Човек] за всеки човек
select
    people.name,
    hotels.name,
    rooms.name
from
    people
join people_rooms on people.id = people_rooms.person_id
join rooms on people_rooms.room_id = rooms.id
join hotels on rooms.hotel_id = hotels.id;