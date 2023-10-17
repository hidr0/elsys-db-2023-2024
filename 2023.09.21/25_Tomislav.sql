drop database if exists students; -- (1)
create database student; -- (2)

USE student; -- (3)

CREATE TABLE table_name( -- (4)
	name varchar(255), -- (5)
    age int NOT NULL
    CHECK(age > 0)
);


