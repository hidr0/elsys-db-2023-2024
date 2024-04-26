DROP DATABASE IF EXISTS PhoneCalls;
CREATE DATABASE PhoneCalls;
USE PhoneCalls;

CREATE TABLE calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(20),
    uuid VARCHAR(36) NOT NULL,
    country VARCHAR(50),
    caller_number INT
);

CREATE TABLE ping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255),
    response JSON,
    call_id INT,
    FOREIGN KEY (call_id) REFERENCES calls(id)
);

CREATE TABLE tag_value (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value VARCHAR(255)
);

CREATE TABLE tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tag_value_id INT,
    FOREIGN KEY (tag_value_id) REFERENCES tag_value(id)
);

CREATE TABLE call_tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    call_id INT,
    tag_id INT,
    FOREIGN KEY (call_id) REFERENCES calls(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

INSERT INTO calls (number, uuid, country, caller_number) VALUES 
    ('238710854', REPLACE(UUID(), '-', ''), 'BG', 285018295),
    ('357381924', REPLACE(UUID(), '-', ''), 'US', 285839523);

INSERT INTO ping (url, response, call_id)
VALUES 
    ('https://example.com/', '{"name": "Pesho", "age": "12", "gender": "male"}', 1),
    ('https://example.com/', '{"name": "Pesho", "age": "18", "gender": "male"}', 2);
     
SELECT calls.*
FROM calls
INNER JOIN ping ON calls.id = ping.call_id
WHERE JSON_EXTRACT(ping.response, '$.name') = 'Pesho';

ALTER TABLE tag MODIFY created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;