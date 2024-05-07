DROP DATABASE IF EXISTS Tags;
CREATE DATABASE Tags;
USE Tags;

CREATE TABLE Calls(
    id INT PRIMARY KEY AUTO_INCREMENT,
    number VARCHAR(15) NOT NULL CHECK (LENGTH(number) > 7 AND LENGTH(number) < 15 AND number LIKE "+%"),
    uuid VARCHAR(255) NOT NULL UNIQUE,
    country VARCHAR(50) NOT NULL,
    caller_number VARCHAR(15) NOT NULL CHECK (LENGTH(caller_number) > 7 AND LENGTH(caller_number) < 15 AND caller_number LIKE "+%")
);

INSERT INTO Calls(number, uuid, country, caller_number) VALUES("+2908000", UUID(), "B", "+35987903380");
INSERT INTO Calls(number, uuid, country, caller_number) VALUES("+35987903380", UUID(), "Bulgaria", "+2908000");

CREATE TABLE Tag(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW()
);

INSERT INTO Tag(name) VALUES("Tag 1");
INSERT INTO Tag(name) VALUES("Tag 2");
INSERT INTO Tag(name) VALUES("Tag 3");

CREATE TABLE TagValue(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
	value TEXT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(tag_id) REFERENCES Tag(id)
);

INSERT INTO TagValue(name, value, tag_id) VALUES("Tag name 1", "value1", 1);
INSERT INTO TagValue(name, value, tag_id) VALUES("Tag name 2", "value2", 2);
INSERT INTO TagValue(name, value, tag_id) VALUES("Tag name 3", "value3", 3);

CREATE TABLE Ping(
    id INT PRIMARY KEY AUTO_INCREMENT,
    call_id INT NOT NULL,
    url VARCHAR(255) NOT NULL CHECK (url LIKE "https://%"),
    response JSON,
    FOREIGN KEY(call_id) REFERENCES Calls(id)
);

INSERT INTO Ping(call_id, url, response) VALUES(1, "https://google.com", JSON_OBJECT("name", "Iva", "age", "17", "gender", "female"));
INSERT INTO Ping(call_id, url, response) VALUES(2, "https://youtube.com", JSON_OBJECT("name", "Ivan", "age", "18", "gender", "male"));
INSERT INTO Ping(call_id, url, response) VALUES(1, "https://google.com", JSON_OBJECT("name", "Pesho", "age", "12", "gender", "male"));
INSERT INTO Ping(call_id, url, response) VALUES(2, "https://google.com", JSON_OBJECT("name", "Pesho", "age", "10", "gender", "male"));
INSERT INTO Ping(call_id, url, response) VALUES(2, "https://youtube.com", JSON_OBJECT("name", "Peshana", "age", "19", "gender", "female"));


-- 3 - Query all the calls that have a Ping response with key "name" and value "Pesho"
SELECT Calls.*
FROM Calls
LEFT JOIN Ping ON Calls.id = Ping.call_id
WHERE JSON_EXTRACT(Ping.response, '$.name') = 'Pesho';