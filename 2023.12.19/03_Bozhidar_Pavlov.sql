drop database if exists houses;
create database houses;
use houses;

create table people (
    id serial primary key,
    name varchar(255) not null,
    phone_number varchar(13) not null check (phone_number like '+359%' AND length(phone_number) = 10),
    email varchar(255) not null check (email like '%@%')
);

create table addresses (
    id serial primary key,
    city varchar(255) not null,
    zip_code varchar(10) not null
);

create table real_estate_agents (
    id serial primary key,
    name varchar(255) unique not null
);

create table houses (
    id serial primary key,
    price int not null check (price > 0),
    address_id bigint unsigned not null unique,
    real_estate_agent_id bigint unsigned not null,
    foreign key (address_id) references addresses(id),
    foreign key (real_estate_agent_id) references real_estate_agents(id)
);

create table people_houses (
    id serial primary key,
    person_id bigint unsigned not null,
    house_id bigint unsigned not null,
    unique (person_id, house_id),
    foreign key (person_id) references people(id),
    foreign key (house_id) references houses(id)
);

-- Въвеждане на dummy данни с фалшиви имена и имейли

insert into people (name, phone_number, email) values
    ('Ivan Ivanov', '+359888123', 'ivan@ivanov.email'),
    ('Petar Petrov', '+359888654', 'petar@petrov.email'),
    ('Georgi Georgiev', '+359888123', 'georgi@georgiev.email'),
    ('Stefan Stefanov', '+359888321', 'stefan@stefanov.email'),
    ('Ivaylo Ivaylov', '+359888456', 'ivaylo@ivanov.email'),
    ('Petko Petkov', '+359888654', 'petko@petkov.email');

insert into addresses (city, zip_code) values
    ('Sofia', '1000'),
    ('Plovdiv', '4000'),
    ('Varna', '9000'),
    ('Burgas', '8000'),
    ('Ruse', '7000'),
    ('Stara Zagora', '6000');

insert into real_estate_agents (name) values
    ('Ivan Agent'),
    ('Petar Agent'),
    ('Georgi Agent'),
    ('Stefan Agent'),
    ('Ivaylo Agent'),
    ('Petko Agent');

insert into houses (price, address_id, real_estate_agent_id) values
    (100000, 1, 1),
    (200000, 2, 2),
    (300000, 3, 3),
    (400000, 4, 4),
    (500000, 5, 5),
    (600000, 6, 6);

insert into people_houses (person_id, house_id) values
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6);

-- Заявки

-- 1. Извадете средната цена на къщите, които е гледал всеки човек
select avg(price)
from people
left join people_houses on people.id = people_houses.person_id
left join houses on people_houses.house_id = houses.id
group by people.id;

-- 2. Изведете най-високата цена за къщите, които предлага всеки агент
select max(price)
from real_estate_agents
left join houses on real_estate_agent_id = real_estate_agents.id
group by real_estate_agents.id;

-- 3. Изведете всички адреси, на които е бил всеки човек
select people.name, addresses.*
from people
left join people_houses on people.id = people_houses.person_id
left join houses on house_id = houses.id
left join addresses on houses.address_id = addresses.id;