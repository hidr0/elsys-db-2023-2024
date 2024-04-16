SET SQL_SAFE_UPDATES=0;
DROP TABLE IF EXISTS Teams, Coaches, Players, TrainingSessions, Massages, Therapists, TeamTherapists;

CREATE TABLE Coaches (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CoachName VARCHAR(100) NOT NULL,
    CoachAge INT NOT NULL
);

CREATE TABLE Teams (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL,
    CoachID INT NOT NULL,
    FoundedYear INT CHECK (FoundedYear < 1900) NOT NULL,
    HomeCity VARCHAR(100) NOT NULL,
    FOREIGN KEY (CoachID) REFERENCES Coaches(ID)
);

CREATE TABLE Players (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age > 0) NOT NULL,
    Position ENUM('Forward', 'Goalkeeper', 'Defense') NOT NULL,
    TeamID INT NOT NULL,
    FOREIGN KEY (TeamID) REFERENCES Teams(ID)
);

CREATE TABLE TrainingSessions (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    SessionDate DATE NOT NULL,
    SessionTime TIME NOT NULL,
    Location VARCHAR(100) NOT NULL,
    TeamID INT NOT NULL,
    FOREIGN KEY (TeamID) REFERENCES Teams(ID)
);

CREATE TABLE Massages (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentDateTime DATETIME NOT NULL,
    PlayerID INT NOT NULL,
    TherapistID INT NOT NULL,
    FOREIGN KEY (PlayerID) REFERENCES Players(ID),
    FOREIGN KEY (TherapistID) REFERENCES Therapists(ID)
);

CREATE TABLE Therapists (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TherapistName VARCHAR(100) NOT NULL
);

CREATE TABLE TeamTherapists (
    TeamID INT NOT NULL,
    TherapistID INT NOT NULL,
    PRIMARY KEY (TeamID, TherapistID),
    FOREIGN KEY (TeamID) REFERENCES Teams(ID),
    FOREIGN KEY (TherapistID) REFERENCES Therapists(ID)
);

INSERT INTO Coaches (CoachName, CoachAge) VALUES
('Sarah Connor', 45),
('John Smith', 50);

INSERT INTO Teams (TeamName, CoachID, FoundedYear, HomeCity) VALUES
('Dragons', 1, 1998, 'Metropolis'),
('Warriors', 2, 2003, 'Gotham');

INSERT INTO Players (PlayerName, Age, Position, TeamID) VALUES
('Mike Johnson', 25, 'Forward', 1),
('Alex Green', 22, 'Goalkeeper', 2);

INSERT INTO TrainingSessions (SessionDate, SessionTime, Location, TeamID) VALUES
('2024-05-15', '10:00', 'Metropolis Training Ground', 1),
('2024-05-16', '09:00', 'Gotham City Field', 2);

INSERT INTO Massages (AppointmentDate, AppointmentTime, PlayerID, TherapistID) VALUES
('2024-05-15', '14:00', 1, 1),
('2024-05-16', '15:00', 2, 2);

INSERT INTO Therapists (TherapistName) VALUES
('Emily White'),
('John Davis');

INSERT INTO TeamTherapists (TeamID, TherapistID) VALUES
(1, 1),
(2, 2);

-- 1. List all Training sessions for all teams [Location, when, team.name, coach.name]
SELECT T.Location, TS.SessionDate AS "when", T.TeamName, C.CoachName
FROM TrainingSessions TS
JOIN Teams T ON TS.TeamID = T.ID
JOIN Coaches C ON T.CoachID = C.ID;

-- 2. List all Team that do not have any training sessions. [team.name]
SELECT T.TeamName
FROM Teams T
WHERE T.ID NOT IN (SELECT DISTINCT TeamID FROM TrainingSessions);

-- 3. List all therapy sessions for a player [Player.name, massage.date, Therapist.name]
SELECT P.PlayerName, M.AppointmentDate AS "massage.date", TH.TherapistName
FROM Massages M
JOIN Players P ON M.PlayerID = P.ID
JOIN Therapists TH ON M.TherapistID = TH.ID;

-- 4. List all the Therapists for the "Warriors"
SELECT DISTINCT TH.TherapistName
FROM Therapists TH
JOIN Massages M ON TH.ID = M.TherapistID
JOIN Players P ON M.PlayerID = P.ID
JOIN Teams TM ON P.TeamID = TM.ID
WHERE TM.TeamName = 'Warriors';

-- 5. Count the number of training sessions each team has in Feb 2022.
SELECT T.TeamName, COUNT(TS.ID) AS SessionCount
FROM Teams T
LEFT JOIN TrainingSessions TS ON T.ID = TS.TeamID AND YEAR(TS.SessionDate) = 2022 AND MONTH(TS.SessionDate) = 2
GROUP BY T.TeamName;

-- 6. Get the name of the oldest team.
SELECT TeamName
FROM Teams
ORDER BY FoundedYear ASC
LIMIT 1;

-- 7. Get the average team age of all teams.
SELECT AVG(YEAR(CURRENT_DATE) - T.FoundedYear) AS AverageTeamAge
FROM Teams T;

-- 8. List the team name and average team age of all players. [Name, average age]
SELECT T.TeamName, AVG(YEAR(CURRENT_DATE) - P.BirthYear) AS AveragePlayerAge
FROM Players P
JOIN Teams T ON P.TeamID = T.ID
GROUP BY T.TeamName;
