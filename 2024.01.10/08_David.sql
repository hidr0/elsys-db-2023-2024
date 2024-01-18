SET SQL_SAFE_UPDATES=0;

CREATE TABLE Patients (
    Name VARCHAR(100) NOT NULL,
    Birthdate DATE,
    Gender VARCHAR(10),
    Phone VARCHAR(15),
    PRIMARY KEY (Name)
);

CREATE TABLE Doctors (
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    PRIMARY KEY (Name)
);

CREATE TABLE Specializations (
    Name VARCHAR(100) NOT NULL,
    PRIMARY KEY (Name)
);

CREATE TABLE DoctorSpecializations (
    DoctorName VARCHAR(100) NOT NULL,
    SpecializationName VARCHAR(100) NOT NULL,
    PRIMARY KEY (DoctorName, SpecializationName),
    FOREIGN KEY (DoctorName) REFERENCES Doctors(Name),
    FOREIGN KEY (SpecializationName) REFERENCES Specializations(Name)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    DoctorName VARCHAR(100) NOT NULL,
    Date DATETIME,
    Reason VARCHAR(200),
    FOREIGN KEY (PatientName) REFERENCES Patients(Name),
    FOREIGN KEY (DoctorName) REFERENCES Doctors(Name)
);

INSERT INTO Patients (Name, Birthdate, Gender, Phone) VALUES
('Carlos Ray', '1988-03-15', 'Male', '555-0103'),
('Diana Grace', '1992-07-24', 'Female', '555-0104'),
('Ethan Hunt', '1979-11-02', 'Male', '555-0105'),
('Alice Johnson', '1990-05-21', 'Female', '555-0101'),
('Bob Smith', '1985-08-30', 'Male', '555-0102');

INSERT INTO Doctors (Name, Email, Phone) VALUES
('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

INSERT INTO Specializations (Name) VALUES
('Orthopedics'),
('General Medicine'),
('Dermatology'),
('Pediatrics');

INSERT INTO DoctorSpecializations (DoctorName, SpecializationName) VALUES
('Dr. Sarah Connor', 'Pediatrics'),
('Dr. Lucy Liu', 'Dermatology'),
('Dr. Omar Sharif', 'Orthopedics'),
('Dr. Emily White', 'General Medicine'),
('Dr. John Davis', 'General Medicine');

INSERT INTO Appointments (AppointmentID, PatientName, DoctorName, Date, Reason) VALUES
(1, 'Carlos Ray', 'Dr. Sarah Connor', '2024-01-20 14:00', 'Follow-up Visit'),
(2, 'Diana Grace', 'Dr. Lucy Liu', '2024-01-22 09:30', 'Initial Consultation'),
(3, 'Ethan Hunt', 'Dr. Omar Sharif', '2024-01-25 16:00', 'Routine Checkup'),
(4, 'Alice Johnson', 'Dr. Emily White', '2024-01-28 10:00', 'Vaccination'),
(5, 'Bob Smith', 'Dr. John Davis', '2024-01-30 11:00', 'Annual Physical Exam');

SET SQL_SAFE_UPDATES=1;

-- queries

SELECT PatientName, Date, Reason FROM Appointments WHERE PatientName = 'Carlos Ray';

SELECT D.Name FROM Doctors D
JOIN DoctorSpecializations DS ON D.Name = DS.DoctorName
JOIN Specializations S ON DS.SpecializationName = S.Name
WHERE S.Name = 'Orthopedics';

SELECT DoctorName, COUNT(*) AS AppointmentCount FROM Appointments GROUP BY DoctorName;

SELECT Date, Reason, PatientName, DoctorName FROM Appointments ORDER BY Date LIMIT 5;

DELETE FROM Appointments WHERE Date = '2023-01-01';

UPDATE Patients SET Gender = 'M' WHERE Name LIKE '%kov';
