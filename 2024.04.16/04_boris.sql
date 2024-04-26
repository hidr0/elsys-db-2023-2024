drop database if exists db;
create database db;
use db;

create table Calls (
	id int primary key auto_increment,
    number varchar(13) not null check(number like "+%" and length(number) >= 8 and length(number) <= 13),
    uuid varchar(36) not null,
    country varchar(64) not null,
    caller_number varchar(13) not null check(caller_number like "+%" and length(caller_number) >= 8 and length(caller_number) <= 13)
);

create table Tags (
	id int primary key auto_increment,
    name varchar (64) not null,
    created_at datetime not null default NOW()
);

create table Pings (
	id int primary key auto_increment,
    call_id int not null,
    url varchar(128) not null check(url like "https://%"),
    response json not null,
    foreign key(call_id) references Calls(id)
);

create table TagValues (
	id int primary key auto_increment,
    tag_id int not null,
    name varchar(64) not null,
    value varchar(64) not null,
    foreign key(tag_id) references Tags(id)
);

create table Call_TagValue (
	id int primary key auto_increment,
    call_id int not null,
    tagvalue_id int not null,
    foreign key(call_id) references Calls(id),
    foreign key(tagvalue_id) references TagValues(id)
);

-- 3 calls, 5 pings each
INSERT INTO Calls(number, uuid, country, caller_number) VALUES
('+1123456789', UUID(), 'USA', '+44987654321'),
('+1987654321', UUID(), 'Canada', '+359123456789'),
('+44555666777', UUID(), 'UK', '+1999888777');

INSERT INTO Pings(call_id, url, response) VALUES
(1, 'https://google.com', '{"name": "Pesho", "age": 34, "gender": "male"}'),
(1, 'https://google.com', '{"name": "Alice", "age": 25, "gender": "female"}'),
(1, 'https://google.com', '{"name": "Bob", "age": 40, "gender": "male"}'),
(1, 'https://google.com', '{"name": "Emily", "age": 35, "gender": "female"}'),
(1, 'https://google.com', '{"name": "David", "age": 28, "gender": "male"}'),
(2, 'https://google.com', '{"name": "Sarah", "age": 32, "gender": "female"}'),
(2, 'https://google.com', '{"name": "Michael", "age": 45, "gender": "male"}'),
(2, 'https://google.com', '{"name": "Sophia", "age": 29, "gender": "female"}'),
(2, 'https://google.com', '{"name": "Chris", "age": 38, "gender": "male"}'),
(2, 'https://google.com', '{"name": "Emma", "age": 27, "gender": "female"}'),
(3, 'https://google.com', '{"name": "Pesho", "age": 34, "gender": "male"}'),
(3, 'https://google.com', '{"name": "Olivia", "age": 31, "gender": "female"}'),
(3, 'https://google.com', '{"name": "Liam", "age": 36, "gender": "male"}'),
(3, 'https://google.com', '{"name": "Ava", "age": 26, "gender": "female"}'),
(3, 'https://google.com', '{"name": "Pesho", "age": 34, "gender": "male"}');

SELECT DISTINCT Calls.number, Calls.uuid, Calls.country, Calls.number, Calls.caller_number
FROM Pings
LEFT JOIN Calls ON Calls.id = Pings.call_id
WHERE JSON_EXTRACT(Pings.response, "$.name") like '\"Pesho\"';