-- 1 - Proveryavane dali db sushtestvuva
-- 2 - syzdavame db
-- 3 - izpolzvame bazite ot 2
-- 4 - suzdavame tablici
-- 5 - dobavyame koloni
-- 6 - dobavyame redove
-- 7 - proveryavame go

DROP DATABASE IF EXISTS Students;

CREATE DATABASE Students;

-- CREATE DATABASE if not exists students; -- (1) and (2) /drugoto poveche mi haresva/

USE Students; -- (3)

create table if not exists students_table( -- (4)
	id int AUTO_INCREMENT PRIMARY KEY,
	FirstName varchar(255),
    LastName varchar(255),
    Age int
);

INSERT INTO students_table(FirstName, LastName, Age) VALUES (Gosho, Goshov, 120); -- (5) and (6)
INSERT INTO students_table(FirstName, LastName, Age) VALUES (Petkan, Petkanov, 12); -- (5) and (6)
INSERT INTO students_table(FirstName, LastName, Age) VALUES (Dragan, Draganov, 120); -- (5) and (6)

SELECT * FROM students; -- (7)