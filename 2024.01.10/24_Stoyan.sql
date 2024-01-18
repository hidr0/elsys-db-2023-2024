DROP DATABASE IF EXISTS Clinic;
CREATE DATABASE Clinic;
USE Clinic;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Patients (
    Name VARCHAR(100) NOT NULL,
    Birthdate DATE NOT NULL,
    Gender VARCHAR(20),
    Phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (Name)
);

INSERT INTO Patients (Name, Birthdate, Gender, Phone)
VALUES
    ('Carlos Ray', '1988-03-15', 'Male', '555-0103'),
    ('Diana Grace', '1992-07-24', 'Female', '555-0104'),
    ('Ethan Hunt', '1979-11-02', 'Male', '555-0105'),
    ('Alice Johnson', '1990-05-21', 'Female', '555-0101'),
    ('Bob Smith', '1985-08-30', 'Male', '555-0102');

CREATE TABLE Doctors (
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    PRIMARY KEY (Name)
);

INSERT INTO Doctors (Name, Email, Phone)
VALUES
    ('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
    ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
    ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
    ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
    ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

CREATE TABLE Specializations (
    Specialization VARCHAR(50) NOT NULL,
    PRIMARY KEY (Specialization)
);

INSERT INTO Specializations (Specialization)
VALUES
    ('Orthopedics'),
    ('General Medicine'),
    ('Dermatology'),
    ('Pediatrics');

CREATE TABLE DoctorSpecializations (
    Doctor VARCHAR(100),
    Specialization VARCHAR(50),
    PRIMARY KEY (Doctor, Specialization),
    FOREIGN KEY (Doctor) REFERENCES Doctors(Name),
    FOREIGN KEY (Specialization) REFERENCES Specializations(Specialization)
);

INSERT INTO DoctorSpecializations (Doctor, Specialization)
VALUES
    ('Dr. Sarah Connor', 'Pediatrics'),
    ('Dr. Lucy Liu', 'Dermatology'),
    ('Dr. Omar Sharif', 'Orthopedics'),
    ('Dr. Emily White', 'General Medicine'),
    ('Dr. John Davis', 'General Medicine');

CREATE TABLE Appointments (
    AppointmentID INT,
    Patient VARCHAR(100) NOT NULL,
    Doctor VARCHAR(100) NOT NULL,
    DateAndTime DATETIME NOT NULL,
    Reason VARCHAR(200),
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (Patient) REFERENCES Patients(Name),
    FOREIGN KEY (Doctor) REFERENCES Doctors(Name)
);

INSERT INTO Appointments (AppointmentID, Patient, Doctor, DateAndTime, Reason)
VALUES
    (1, 'Carlos Ray', 'Dr. Sarah Connor', '2024-01-20 14:00', 'Follow-up Visit'),
    (2, 'Diana Grace', 'Dr. Lucy Liu', '2024-01-22 09:30', 'Initial Consultation'),
    (3, 'Ethan Hunt', 'Dr. Omar Sharif', '2024-01-25 16:00', 'Routine Checkup'),
    (4, 'Alice Johnson', 'Dr. Emily White', '2024-01-28 10:00', 'Vaccination'),
    (5, 'Bob Smith', 'Dr. John Davis', '2024-01-30 11:00', 'Annual Physical Exam');

ALTER TABLE DoctorSpecializations
ADD FOREIGN KEY (Doctor) REFERENCES Doctors(Name),
ADD FOREIGN KEY (Specialization) REFERENCES Specializations(Specialization);

SELECT Patients.Name AS PatientName, Appointments.DateAndTime AS AppointmentDate, Appointments.Reason AS AppointmentReason
FROM Appointments
JOIN Patients ON Appointments.Patient = Patients.Name
WHERE Patients.Name = 'YourPatientName';

SELECT Doctors.Name AS DoctorName
FROM Doctors
JOIN DoctorSpecializations ON Doctors.Name = DoctorSpecializations.Doctor
JOIN Specializations ON DoctorSpecializations.Specialization = Specializations.Specialization
WHERE Specializations.Specialization = 'General Medicine';

SELECT Doctors.Name AS DoctorName, COUNT(*) AS AppointmentCount
FROM Appointments
JOIN Doctors ON Appointments.Doctor = Doctors.Name
GROUP BY Doctors.Name;

SELECT Appointments.DateAndTime AS AppointmentDate, Appointments.Reason AS AppointmentReason,
       Patients.Name AS PatientName, Doctors.Name AS DoctorName
FROM Appointments
JOIN Patients ON Appointments.Patient = Patients.Name
JOIN Doctors ON Appointments.Doctor = Doctors.Name
ORDER BY Appointments.DateAndTime
LIMIT 5;

DELETE FROM Appointments
WHERE DATE(Appointments.DateAndTime) = '2023-01-01';

UPDATE Patients
SET Gender = 'M'
WHERE Name LIKE '%kov%';
