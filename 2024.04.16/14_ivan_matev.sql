SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS calls;
CREATE DATABASE calls;
USE calls;

CREATE TABLE CallTable (
    call_id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(12) NOT NULL,
    uuid VARCHAR(36) NOT NULL,
    country VARCHAR(50) NOT NULL,
    caller_number VARCHAR(12) NOT NULL,
    CHECK (caller_number LIKE '+%' AND LENGTH(caller_number) BETWEEN 8 AND 12),
    CHECK (number LIKE '+%' AND LENGTH(number) BETWEEN 8 AND 12)
);


CREATE TABLE Tag (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Tag_Value (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_id INT NOT NULL,
    call_id INT NOT NULL,
    value VARCHAR(255) NOT NULL,
    FOREIGN KEY (tag_id) REFERENCES Tag(tag_id) ON DELETE CASCADE,
    FOREIGN KEY (call_id) REFERENCES CallTable(call_id) ON DELETE CASCADE
);

CREATE TABLE Ping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    call_id INT NOT NULL,
    url VARCHAR(255) NOT NULL CHECK (url LIKE 'https://%'),
    response JSON,
    FOREIGN KEY (call_id) REFERENCES CallTable(call_id) ON DELETE CASCADE
);

INSERT INTO CallTable (number, uuid, country, caller_number) 
VALUES  ('+1112223333', UUID(), 'Tajikistan', '+35989200401'),
		('+35989200401', UUID(), 'Bulgaria', '+1112223333');

INSERT INTO Tag (name) 
VALUES  ('Important'), 
		('Urgent');

INSERT INTO Tag_Value (tag_id, call_id, value) 
VALUES  (1, 1, 'High Priority'),
		(2, 2, 'ASAP');


INSERT INTO Ping (call_id, url, response) 
VALUES  (1, 'https://ne.raboti', '{"nqmash": "kusmet"}'),
		(2, 'https://pesho.org', '{"name": "Pesho","age": "12","gender": "male"}');


SELECT * FROM Ping;

SELECT CallTable.* FROM CallTable
JOIN Ping ON CallTable.call_id = Ping.call_id
WHERE JSON_CONTAINS(Ping.response, '{"name": "Pesho"}');
