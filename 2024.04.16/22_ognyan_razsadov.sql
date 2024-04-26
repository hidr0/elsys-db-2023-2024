DROP DATABASE IF EXISTS calls;
CREATE DATABASE calls;
USE calls;

CREATE TABLE Calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(13) NOT NULL CHECK(CHAR_LENGTH(number) >= 8 AND CHAR_LENGTH(number) <= 13 AND number LIKE '+%'),
    uuid varchar(36) NOT NULL UNIQUE,
    country VARCHAR(50),
    caller_number VARCHAR(13) NOT NULL CHECK(CHAR_LENGTH(caller_number) >= 8 AND CHAR_LENGTH(caller_number) <= 13 AND caller_number LIKE '+%')
);

CREATE TABLE Tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(127) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE TagValue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_id INT NOT NULL,
    name VARCHAR(127) NOT NULL,
    value VARCHAR(127) NOT NULL,
    FOREIGN KEY(tag_id) REFERENCES Tag(id)
);

CREATE TABLE CallTagValue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    call_id INT NOT NULL,
    tag_value_id INT NOT NULL,
    FOREIGN KEY(call_id) REFERENCES Calls(id),
    FOREIGN KEY(tag_value_id) REFERENCES TagValue(id)
);

CREATE TABLE Ping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    call_id INT NOT NULL,
    url VARCHAR(255) NOT NULL CHECK(url LIKE 'https://%'),
    response JSON,
    FOREIGN KEY(call_id) REFERENCES Calls(id)
);

INSERT INTO Tag (name) VALUES ('call_type'), ('call_reason');

INSERT INTO TagValue (tag_id, name, value) VALUES (1, 'call_type', 'Входящ'), (1, 'call_type', 'Изходящ'), (2, 'call_reason', 'Рекламация'), (2, 'call_reason', 'Въпрос'), (2, 'call_reason', 'Друго');

INSERT INTO Calls (number, uuid, country, caller_number) VALUES ('+359888123456', UUID(), 'Bulgaria', '+359888123456');
INSERT INTO Calls (number, uuid, country, caller_number) VALUES ('+359888123457', UUID(), 'Bulgaria', '+359888123457');

INSERT INTO CallTagValue (call_id, tag_value_id) VALUES (1, 1), (1, 4), (2, 2), (2, 5);

INSERT INTO Ping (call_id, url, response) VALUES (1, 'https://example.com', '{
  "name": "Pesho",
  "age": "12",
  "gender": "male"
}'), (2, 'https://example.com', '{
  "name": "Pesho",
  "age": "12",
  "gender": "male"
}');

SELECT Calls.*
FROM Ping
LEFT JOIN Calls ON Calls.id = Ping.call_id
WHERE JSON_CONTAINS(Ping.response, '"Pesho"', '$.name')
GROUP BY Calls.id;