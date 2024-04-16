DROP DATABASE IF EXISTS sports;
CREATE DATABASE sports;
USE sports;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Teams(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(60) not null,
    founded_year int not null check(founded_year > 1900),
    home_city varchar(100) not null
);

INSERT INTO Teams(name,founded_year,home_city) VALUES("Dragons", 1998, "Metropolis");
INSERT INTO Teams(name,founded_year,home_city) VALUES("Warriors", 2003, "Gotham");
INSERT INTO Teams(name,founded_year,home_city) VALUES("Bulls", 1982, "Sofia");

SELECT * FROM Teams;

CREATE TABLE Coach(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(60) not null,
    years int not null check(years>0),
	team_id int not null unique,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);
INSERT INTO Coach(name,years,team_id) VALUES("Sarah Connor",34,1);
INSERT INTO Coach(name,years,team_id) VALUES("John Smith",56,2);

SELECT * FROM Coach;


CREATE TABLE TrainingSessions(
	id int PRIMARY KEY AUTO_INCREMENT,
    when_ datetime not null,
    location varchar(255) not null, 
    team_id int not null,
    FOREIGN kEY(team_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions(when_,location,team_id) VALUES("2024-05-15 10:00","Metropolis Training Ground", 1);
INSERT INTO TrainingSessions(when_,location,team_id) VALUES("2024-05-16 09:00", "Gotham City Field", 2);
INSERT INTO TrainingSessions(when_,location,team_id) VALUES("2022-02-16 09:00", "Gotham City Field", 2);


SELECT * FROM TrainingSessions;

CREATE TABLE Players(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(60) not null,
    age int not null check(age>0),
    position ENUM("Forward", "Goalkeeper","Defence"),
    team_id int not null,
    FOREIGN KEY(team_id) REFERENCES Teams(id)
);

INSERT INTO Players(name,age,position,team_id) VALUES("Mike Johnson", 25, "Forward", 1);
INSERT INTO Players(name,age,position,team_id) VALUES("Alex Green",22, "Goalkeeper", 2);
INSERT INTO Players(name,age,position,team_id) VALUES("Michael",31, "Defence", 2);

SELECT * FROM Players;

CREATE TABLE Therapist(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(60) not null
);

INSERT INTO Therapist(name) VALUES("Dr. Ivanov");
INSERT INTO Therapist(name) VALUES("Dr. Petrova");
INSERT INTO Therapist(name) VALUES("Dr. Pavlov");

CREATE TABLE Massages(
	id int PRIMARY KEY AUTO_INCREMENT,
    time datetime,
    player_id int not null,
    therapist_id int not null,
    FOREIGN KEY(player_id) REFERENCES Players(id),
    FOREIGN KEY(therapist_id) REFERENCES Therapist(id)
);

INSERT INTO Massages(time,player_id,therapist_id) VALUES("2024-05-15 14:00", 1, 1); 
INSERT INTO Massages(time,player_id,therapist_id) VALUES("2024-05-16 15:00", 2, 1); 
INSERT INTO Massages(time,player_id,therapist_id) VALUES("2024-04-12 23:00", 1, 3);    
INSERT INTO Massages(time,player_id,therapist_id) VALUES("2024-03-10 19:34", 1, 2); 

SELECT * FROM Massages;
    
    
-- 1 
SELECT TS.location, TS.when_,T.name,C.name FROM Teams as T
LEFT JOIN TrainingSessions as TS
ON TS.team_id = T.id
LEFT JOIN Coach as C
ON C.team_id = T.id;  

-- 2
SELECT T.name FROM Teams as T
LEFT JOIN TrainingSessions as TS
ON TS.team_id = T.id
GROUP BY T.id
HAVING COUNT(TS.id) = 0; 

-- 3 
SELECT P.name, M.time, Th.name FROM Players as P
LEFT JOIN Massages as M
ON M.player_id = P.id
LEFT JOIN Therapist as Th
ON M.therapist_id = Th.id;


-- 4
SELECT Th.name FROM Teams as T
LEFT JOIN Players as P
ON P.team_id = T.id
LEFT JOIN Massages as M
ON M.player_id = P.id
LEFT JOIN Therapist as Th
ON Th.id = M.therapist_id
WHERE T.name = "Warriors";

-- 5
SELECT TS.team_id, COUNT(TS.team_id) FROM TrainingSessions as TS
WHERE TS.when_ >= "2022-02-01 00:00:00" and TS.when_ <= "2022-02-28 23:59:59"
GROUP BY TS.team_id;

-- 6
SELECT Teams.name FROM Teams 
ORDER BY founded_year ASC
LIMIT 1;

-- 7 
SELECT AVG(year(now())-Teams.founded_year) FROM Teams;

-- 8 List the team name and average team age of all players.[Name, average age]
SELECT Teams.name, AVG(P.age) FROM Teams
LEFT JOIN Players as P
ON P.team_id = Teams.id
GROUP BY Teams.id;


