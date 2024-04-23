drop database if exists calls;
create database calls;
use calls;

create table calls (
	id serial primary key,
    uuid binary(16) unique not null default (uuid_to_bin(uuid())),
    country varchar(255) not null,
    number varchar(12) not null check (length(number) >= 8)
);

create table tags (
	id serial primary key,
	name varchar(255) not null,
    -- 5) created_at трябва да взема стойността на записване в момента, по подразбиране.
    created_at datetime not null default now()
);

create table tag_values (
	id serial primary key,
    name varchar(255) not null,
    value varchar(255) not null,
    tag_id bigint unsigned not null,
    foreign key (tag_id) references tags (id)
);

create table calls_tag_values (
	id serial primary key,
    call_id bigint unsigned not null,
    tag_value_id bigint unsigned not null,
    foreign key (call_id) references calls(id),
    foreign key (tag_value_id) references tag_values(id),
    unique (call_id, tag_value_id)
);

create table pings (
	id serial primary key,
	url text not null check (url like 'https://%'),
    response json not null,
    call_id bigint unsigned not null,
    foreign key (call_id) references calls(id)
);

insert into calls (country, number) values 
    ('USA', '12345678'),
    ('UK', '98765432'),
    ('Germany', '45678901');

insert into tags (name) values 
    ('Tag1'),
    ('Tag2'),
    ('Tag3');

insert into tag_values (name, value, tag_id) values 
    ('Tag1', 'Value1', 1),
    ('Tag2', 'Value2', 2),
    ('Tag3', 'Value3', 3);

insert into calls_tag_values (call_id, tag_value_id) values 
    (1, 1),
    (2, 2),
    (3, 3);

-- 2) Add this json in the response in table Ping
insert into pings (url, response, call_id) values 
    ('https://example.com', '{"name": "Pesho", "age": "12", "gender": "male"}', 1);

-- 3) Query all the calls that have a Ping response with key "name" and value "Pesho" 
select * from calls c
left join pings p on p.call_id = c.id
where json_extract(p.response, '$.name') = 'Pesho';

-- 5) Нормализирана ли е базата, ако не защо?

-- Базата не е нормализирана, тъй като текстови данни country се повтарят на всеки ред