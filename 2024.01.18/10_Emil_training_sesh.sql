DROP DATABASE IF EXISTS trainings;
CREATE DATABASE trainings;
USE trainings;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    founded_year INT NOT NULL CHECK (founded_year > 1900),
    coach VARCHAR(255) NOT NULL,
    years INT NOT NULL,
    home_city VARCHAR(255) NOT NULL
);

CREATE TABLE TrainingSessions (
    session_id INT AUTO_INCREMENT PRIMARY KEY,
    when_ DATETIME,
    location VARCHAR(255) NOT NULL,
    team_name VARCHAR(255) NOT NULL,
    coach_name VARCHAR(255) NOT NULL,
    
    FOREIGN KEY(team_name) REFERENCES Teams(name),
    FOREIGN KEY(coach_name) REFERENCES Teams(coach)
);

CREATE TABLE Coach (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    years INT NOT NULL,
    
    FOREIGN KEY(name) REFERENCES Teams(coach)
);

CREATE TABLE Players (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL CHECK (age > 0),
    position VARCHAR(50) CHECK (position IN ('Forward', 'Goalkeeper', 'Defence')),
    team_name VARCHAR(255) NOT NULL,
    
    FOREIGN KEY(team_name) REFERENCES Teams(name)
);

CREATE TABLE Therapists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE PlayerTherapist (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(255),
    therapist_name VARCHAR(255),
    massage DATETIME,
    
    FOREIGN KEY(player_name) REFERENCES Players(name),
    FOREIGN KEY(therapist_name) REFERENCES Therapists(name)
);


INSERT INTO Teams (name, coach, founded_year, years, home_city) VALUES
('Dragons', 'Sarah Connor', 1998, 5, 'Metropolis'),
('Warriors', 'John Smith', 2003, 3, 'Gotham');

INSERT INTO Players (name, age, position, team_name) VALUES
('Mike Johnson', 25, 'Forward', 'Dragons'),
('Alex Green', 22, 'Goalkeeper', 'Warriors');

INSERT INTO TrainingSessions (when_, location, team_name, coach_name) VALUES
('2024-05-15 10:00', 'Metropolis Training Ground', 'Dragons', 'Sarah Connor'),
('2024-05-16 09:00', 'Gotham City Field', 'Warriors', 'John Smith');

INSERT INTO PlayerTherapist (player_name, therapist_name, massage) VALUES
('Mike Johnson', 'Emily White', '2024-05-15 14:00'),
('Alex Green', 'John Davis', '2024-05-16 15:00');


SELECT TrainingSessions.location, TrainingSessions.when_, TrainingSessions.team_name, TrainingSessions.coach_name FROM TrainingSessions;

SELECT Teams.name FROM Teams
WHERE Teams.name NOT IN (SELECT DISTINCT TrainingSessions.team_name FROM TrainingSessions);

SELECT PlayerTherapist.player_name, PlayerTherapist.massage, Therapists.name AS therapist_name FROM PlayerTherapist
JOIN Therapists ON PlayerTherapist.therapist_name = Therapists.name;

SELECT Therapists.name AS therapist_name FROM Therapists
JOIN PlayerTherapist ON Therapists.name = PlayerTherapist.therapist_name
JOIN Players ON PlayerTherapist.player_name = Players.name
WHERE Players.team_name = 'Warriors';

SELECT TrainingSessions.team_name, COUNT(*) AS session_count FROM TrainingSessions
WHERE TrainingSessions.when_ >= '2022-02-01' AND TrainingSessions.when_ < '2022-03-01'
GROUP BY TrainingSessions.team_name;

SELECT Teams.name FROM Teams
ORDER BY Teams.founded_year ASC LIMIT 1;

SELECT AVG(Players.age) AS average_team_age FROM Teams
JOIN Players ON Teams.name = Players.team_name;

SELECT Teams.name, AVG(Players.age) AS average_age FROM Teams
JOIN Players ON Teams.name = Players.team_name
GROUP BY Teams.name;
