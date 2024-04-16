DROP DATABASE IF EXISTS Calling;
CREATE DATABASE Calling;
USE Calling;

CREATE TABLE calls (
    number_ VARCHAR(15) NOT NULL,
    country VARCHAR(50) NOT NULL,
    caller_number VARCHAR(12) NOT NULL
);

CREATE TABLE Tag (
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE TagValue (
    name VARCHAR(50) NOT NULL,
    value INT
);






















CREATE TABLE Car (
    CarID INT PRIMARY KEY AUTO_INCREMENT,
    BrandID INT,
    Model VARCHAR(50) NOT NULL,
    Year INT CHECK (Year > 1900),
    FOREIGN KEY (BrandID) REFERENCES Brand(BrandID)
);

