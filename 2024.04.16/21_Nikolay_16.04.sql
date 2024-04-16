DROP DATABASE IF EXISTS Telecom;
CREATE DATABASE Telecom;
USE Telecom;
CREATE TABLE Calls(
	id int PRIMARY KEY AUTO_INCREMENT,
	number varchar(15) not null check(length(number)>=8 and length(number)<=13 and number like "+%"),
    uuid varchar(200) not null,
    country varchar(50) not null,
    caller_number varchar(15)  not null check(length(caller_number)>=8 and length(caller_number)<=13 and caller_number like "+%")
);
INSERT INTO Calls(number,country,caller_number,uuid) VALUES("+359888888888","Bulgaria","+359777777777",uuid());
SELECT * FROM Calls;
CREATE TABLE Tags(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(127) not null,
    created_at datetime not null DEFAULT now()
);
INSERT INTO Tags(name) VALUES("Tag1");
INSERT INTO Tags(name) VALUES("Tag2");
SELECT * FROM Tags;

CREATE TABLE TagValues(
	id int PRIMARY KEY AUTO_INCREMENT,
    tag_id int not null,
    FOREIGN KEY(tag_id) REFERENCES Tags(id),
    value varchar(127) not null
);

CREATE TABLE Ping(
	id int PRIMARY KEY AUTO_INCREMENT,
    call_id int not null,
    FOREIGN KEY(call_id) REFERENCES Calls(id),
    url varchar(255) not null check(url like "https://%"),
    response json
);
INSERT INTO Ping(url,response,call_id) VALUES("https://google.com",json_object("name","Pesho","age","12","gender","male"),1);

SELECT Calls.number, Calls.uuid, Calls.country, Calls.caller_number FROM Ping 
LEFT JOIN Calls
ON Ping.call_id = Calls.id
where json_extract(Ping.response,"$.name") like "\"Pesho\"";

CREATE TABLE CallsTagValues(
	id int PRIMARY KEY AUTO_INCREMENT,
    tag_value_id int not null,
    call_id int not null,
    FOREIGN KEY(tag_value_id) REFERENCES TagValues(id),
    FOREIGN KEY(call_id) REFERENCES Calls(id)
);
    