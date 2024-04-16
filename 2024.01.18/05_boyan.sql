DROP DATABASE IF EXISTS Sport;
CREATE DATABASE Sport;
USE Sport;

CREATE TABLE Teams(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    founded_year INT CHECK (founded_year > 1900),
    home_city VARCHAR(50) NOT NULL
);

INSERT INTO Teams (name, founded_year, home_city) VALUES
('Dragons', 1998, 'Metropolis'),
('Warriors', 2003, 'Gotham');

CREATE TABLE TrainingSessions(
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_and_time DATETIME,
    location VARCHAR(300),
    teams_id INT,
    FOREIGN KEY (teams_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions (date_and_time, location, teams_id) VALUES
('2024-05-15 10:00', 'Metropolis Training Ground', 1),
('2024-05-16 09:00', 'Gotham City Field', 2);

CREATE TABLE Players(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK(age > 0),
    position ENUM('Forward', 'Goalkeeper', 'Defence'),
    teams_id INT,
    FOREIGN KEY (teams_id) REFERENCES Teams(id)
);

INSERT INTO Players (name, age, position, teams_id) VALUES
('Mike Johnson', 25, 'Forward', 1),
('Alex Green', 22, 'Goalkeeper', 2);

CREATE TABLE Coach(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    years INT NOT NULL,
    teams_id INT UNIQUE,
    FOREIGN KEY (teams_id) REFERENCES Teams(id)
);

INSERT INTO Coach (name, years, teams_id) VALUES
('Sarah Connor', 5, 1),
('John Smith', 7, 2);

CREATE TABLE Therapist(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE PlayersTherapist(
	id INT PRIMARY KEY AUTO_INCREMENT,
    date_and_time DATETIME,
    players_id INT,
    therapist_id INT,
    FOREIGN KEY (players_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(id)
);

INSERT INTO PlayersTherapist(date_and_time, players_id, therapist_id) 
VALUES('2024-05-15 14:00', (SELECT id FROM Players WHERE name = 'Mike Johnson'), (SELECT id FROM Therapist WHERE name = 'Emily White')),
('2024-05-16 15:00', (SELECT id FROM Players WHERE name = 'Alex Green'), (SELECT id FROM Therapist WHERE name = 'John Davis'));



SELECT TrainingSessions.location, TrainingSessions.date_and_time, Teams.name, Coach.name FROM TrainingSessions
LEFT JOIN
Teams ON TrainingSessions.teams_id = Teams.id
LEFT JOIN
Coach ON Teams.id = Coach.teams_id;



SELECT Teams.name FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.teams_id
WHERE TrainingSessions.id IS NULL;


SELECT Players.name, PlayersTherapist.date_and_time, Therapist.name FROM Players
LEFT JOIN
PlayersTherapist ON Players.id = PlayersTherapist.players_id
LEFT JOIN
Therapist ON PlayersTherapist.therapist_id = Therapist.id;


SELECT Therapist.name FROM Therapist
LEFT JOIN
PlayersTherapist ON Therapist.name = PlayersTherapist.therapist_id
LEFT JOIN
Players ON PlayersTherapist.players_id = Players.name
WHERE
Players.teams_id = 'Warriors';


SELECT Teams.name, COUNT(TrainingSessions.id) FROM Teams
LEFT JOIN
TrainingSessions ON Teams.id = TrainingSessions.teams_id
WHERE
DATE_FORMAT(TrainingSessions.date_and_time, '%Y-%m') = '2022-02'
GROUP BY
Teams.id, Teams.name;


SELECT name FROM Teams
ORDER BY founded_year ASC
LIMIT 1;


SELECT AVG(Teams.founded_year)FROM Teams
LEFT JOIN
Players ON Teams.id = Players.teams_id;


SELECT Teams.name, AVG(Players.age) FROM Teams
LEFT JOIN
Players ON Teams.id = Players.teams_id
GROUP BY
Teams.id, Teams.name;