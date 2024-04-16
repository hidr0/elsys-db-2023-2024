DROP DATABASE IF EXISTS PhoneCalls;
CREATE DATABASE PhoneCalls;
USE PhoneCalls;

CREATE TABLE calls (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number VARCHAR(20),
    uuid VARCHAR(255) NOT NULL,
    country VARCHAR(50),
    caller_number INT
);

CREATE TABLE ping (
    id INT AUTO_INCREMENT PRIMARY KEY,
    url VARCHAR(255),
    response JSON DEFAULT '{"name": "Pesho", "age": "12", "gender": "male"}', 
    call_id INT,
    FOREIGN KEY (call_id) REFERENCES calls(id)
);

CREATE TABLE tag_value (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    call_id INT, 
    value VARCHAR(255)
);

CREATE TABLE tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tag_value_id INT,
    FOREIGN KEY (tag_value_id) REFERENCES tag_value(id)
);

CREATE TABLE tag_value_call (
    id INT PRIMARY KEY AUTO_INCREMENT,
    call_id INT,
    tag_value_id INT,
    FOREIGN KEY (call_id) REFERENCES calls(id),
    FOREIGN KEY (tag_value_id) REFERENCES tag_value(id)
);