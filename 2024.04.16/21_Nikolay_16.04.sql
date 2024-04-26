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
INSERT INTO Calls(number,country,caller_number,uuid) VALUES("+359666666666","Somalia","+35555555555",uuid());
SELECT * FROM Calls;
CREATE TABLE Tags(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(127) not null,
    created_at datetime not null DEFAULT now()
);
INSERT INTO Tags(name) VALUES("Tag1");
INSERT INTO Tags(name) VALUES("Tag2");
INSERT INTO Tags(name) VALUES("Tag3");
SELECT * FROM Tags;

CREATE TABLE TagValues(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) not null,
    tag_id int not null,
    FOREIGN KEY(tag_id) REFERENCES Tags(id),
    value varchar(127) not null
);
INSERT TagValues(name,value,tag_id) VALUES("Tag value 1","23",1);
INSERT TagValues(name,value,tag_id) VALUES("Tag value 2","32",2);
INSERT TagValues(name,value,tag_id) VALUES("Tag value 3","-12",1);
INSERT TagValues(name,value,tag_id) VALUES("Tag value 4","230",3);
SELECT * FROM TagValues;
CREATE TABLE Ping(
	id int PRIMARY KEY AUTO_INCREMENT,
    call_id int not null,
    FOREIGN KEY(call_id) REFERENCES Calls(id),
    url varchar(255) not null check(url like "https://%"),
    response json
);
INSERT INTO Ping(url,response,call_id) VALUES("https://google.com",json_object("name","Pesho","age","12","gender","male"),1);
INSERT INTO Ping(url,response,call_id) VALUES("https://youtube.com",json_object("name","Ivan","age","12","gender","male"),2);
INSERT INTO Ping(url,response,call_id) VALUES("https://classroom.com",json_object("name","Pesho","age","12","gender","female"),2);
INSERT INTO Ping(url,response,call_id) VALUES("https://google.com",json_object("name","Gosho","age","12","gender","male"),1);
SELECT * FROM Ping;

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
INSERT INTO CallsTagValues(tag_value_id, call_id) VALUES(1,1);
INSERT INTO CallsTagValues(tag_value_id, call_id) VALUES(2,2);
INSERT INTO CallsTagValues(tag_value_id, call_id) VALUES(3,1);

SELECT Calls.number, Calls.caller_number, Tags.name, TagValues.name, TagValues.value FROM CallsTagValues as CTV
LEFT JOIN Calls 
ON Calls.id = CTV.call_id
LEFT JOIN TagValues
ON TagValues.id = CTV.tag_value_id
LEFT JOIN Tags
ON Tags.id = TagValues.tag_id;
