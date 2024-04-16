SET SQL_SAFE_UPDATES=0;

DROP DATABASE IF EXISTS SportTeams;
CREATE DATABASE SportTeams;
USE SportTeams;

CREATE TABLE Coach(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL
);

INSERT INTO Coach (name, years) VALUES
('Sarah Connor', 5),
('John Smith', 10),
('Mary Jane', 2);

CREATE TABLE Teams (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    founded_year INT NOT NULL CHECK ( founded_year > 1900 ),
    home_city VARCHAR(255) NOT NULL,
    coach_id INT NOT NULL UNIQUE,
    FOREIGN KEY (coach_id) REFERENCES Coach(id)
);

INSERT INTO Teams (name, founded_year, home_city, coach_id) VALUES
('Dragons', 1998, 'Metropolis', 1),
('Warriors', 2003, 'Gotham', 2),
('Test', 2005, 'Test City', 3);

CREATE TABLE TrainingSessions(
    id INT PRIMARY KEY AUTO_INCREMENT,
    `when` DATETIME,
    location VARCHAR(255) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO TrainingSessions (`when`, location, team_id) VALUES
('2024-05-15 10:00', 'Metropolis Training Ground', 1),
('2024-05-16 09:00', 'Gotham City Field', 2);

CREATE TABLE Players(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK ( age > 0 ),
    position ENUM('Forward', 'Goalkeeper', 'Defence') NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(id)
);

INSERT INTO Players (name, age, position, team_id) VALUES
('Mike Johnson', 25, 'Forward', 1),
('Alex Green', 22, 'Goalkeeper', 2);

CREATE TABLE Therapist(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

INSERT INTO Therapist (name) VALUES
('Emily White'),
('John Davis');

CREATE Table Massages(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date DATETIME,
    player_id INT NOT NULL,
    therapist_id INT NOT NULL,
    FOREIGN KEY (player_id) REFERENCES Players(id),
    FOREIGN KEY (therapist_id) REFERENCES Therapist(id)
);

INSERT INTO Massages (date, player_id, therapist_id) VALUES
('2024-05-15 14:00', 1, 1),
('2024-05-16 15:00', 2, 2);

# List all Training sessions for all teams [location, when, team.name, coach.name]
SELECT TrainingSessions.location, TrainingSessions.`when`, Teams.name, Coach.name FROM TrainingSessions
LEFT JOIN Teams ON TrainingSessions.team_id = Teams.id
LEFT JOIN Coach ON Teams.coach_id = Coach.id;

# List all Team that do not have any training sessions [team.name]
SELECT Teams.name FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
WHERE TrainingSessions.id IS NULL;

# List all therapy sessions for a player[Player.name, message.when, therapist.name]
SELECT Players.name, Massages.date, Therapist.name FROM Players
LEFT JOIN Massages ON Players.id = Massages.player_id
LEFT JOIN Therapist ON Massages.therapist_id = Therapist.id;

# List all the Therapists for the "Warriors" team
SELECT Therapist.name FROM Therapist
LEFT JOIN Massages ON Therapist.id = Massages.therapist_id
LEFT JOIN Players ON Massages.player_id = Players.id
LEFT JOIN Teams ON Players.team_id = Teams.id
WHERE Teams.name = 'Warriors';

# Count the number of training sessions each team has in Feb 2022
SELECT Teams.name, COUNT(TrainingSessions.id) FROM Teams
LEFT JOIN TrainingSessions ON Teams.id = TrainingSessions.team_id
AND TrainingSessions.`when` BETWEEN '2022-02-01' AND '2022-02-28'
GROUP BY Teams.name;


# Get the name of the oldest team
SELECT Teams.name FROM Teams
ORDER BY Teams.founded_year ASC
LIMIT 1;

# Get the average teams age of all teams based on founded year
SELECT AVG(YEAR(CURDATE()) - Teams.founded_year) FROM Teams;

# List the team name and average team age of all players. [Name, average age]
SELECT Teams.name, AVG(Players.age) FROM Teams
LEFT JOIN Players ON Teams.id = Players.team_id
GROUP BY Teams.name;

