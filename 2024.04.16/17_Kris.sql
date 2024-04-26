DROP DATABASE IF EXISTS classwork;
CREATE DATABASE classwork;
USE classwork;

CREATE TABLE Calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(12) NOT NULL CHECK(CHAR_LENGTH(number) >= 8 AND CHAR_LENGTH(number) <= 12 AND number LIKE '+%'),
    uid varchar(36) NOT NULL,
    country VARCHAR(50),
    caller_number VARCHAR(12) NOT NULL CHECK(CHAR_LENGTH(caller_number) >= 8 AND CHAR_LENGTH(caller_number) <= 12 AND caller_number LIKE '+%')
);

INSERT INTO Calls (number, uid, country, caller_number) 
VALUES 	('+12345678', UUID(), 'Bulgaria', '+98765432'),
		('+23456789', UUID(), 'Germany', '+87654321'),
		('+34567890', UUID(), 'Japan', '+76543210');

CREATE TABLE Tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Tag (name) 
VALUES 	('Tag 1'),
		('Tag 2'),
		('Tag 3');

CREATE TABLE TagValue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_id INT UNIQUE NOT NULL,
    value VARCHAR(255),
    FOREIGN KEY (tag_id) REFERENCES Tag(id)
);

INSERT INTO TagValue (tag_id, value) 
VALUES 	(1, 'Value 1'),
		(2, 'Value 2'),
		(3, 'Value 3');

CREATE TABLE TagCall (
	id INT AUTO_INCREMENT PRIMARY KEY,
    tagValue_id INT NOT NULL,
    call_id INT NOT NULL,
    FOREIGN KEY (tagValue_id) REFERENCES TagValue(id),
    FOREIGN KEY (call_id) REFERENCES CallS(id)
);

INSERT INTO TagCall (tagValue_id, call_id) 
VALUES 	(1, 1),
		(2, 2),
		(3, 3);

CREATE TABLE Ping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    call_id INT NOT NULL,
    url VARCHAR(255) NOT NULL CHECK(url LIKE "https://%"),
    response JSON,
    FOREIGN KEY (call_id) REFERENCES Calls(id)
);

INSERT INTO Ping (call_id, url, response) 
VALUES 	(1, 'https://example.com', '{"name": "Pesho", "age": "12", "gender": "male"}'),
		(2, 'https://test.com', '{"full name": "Pesho Petrov", "age": "14", "gender": "male"}'),
		(3, 'https://example.org', '{"name": "Gosho", "age": "16", "gender": "male"}');

SELECT * FROM Calls;
SELECT * FROM Tag;
SELECT * FROM TagValue;
SELECT * FROM Ping;

SELECT Calls.* FROM Calls
LEFT JOIN Ping ON Calls.id = Ping.call_id
WHERE JSON_CONTAINS(Ping.response, '{"name": "Pesho"}');
