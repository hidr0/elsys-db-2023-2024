drop database if exists db;
create database db;
use db;

CREATE TABLE _Call (
    number INT PRIMARY KEY,
    uuid VARCHAR(255) NOT NULL,
    country VARCHAR(50),
    caller_number VARCHAR(20)
);

CREATE TABLE Tag (
    name VARCHAR(50) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE TagValue (
    name VARCHAR(50),
    value VARCHAR(255),
    PRIMARY KEY (name, value),
    FOREIGN KEY (name) REFERENCES Tag(name)
);

CREATE TABLE Call_TagValue (
    call_number INT,
    tag_name VARCHAR(50),
    tag_value VARCHAR(255),
    PRIMARY KEY (call_number, tag_name, tag_value),
    FOREIGN KEY (call_number) REFERENCES _Call(number),
    FOREIGN KEY (tag_name, tag_value) REFERENCES TagValue(name, value)
);
