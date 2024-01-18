DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Doctors (
    DoctorId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL CHECK (Email LIKE '%@%'),
    Phone VARCHAR(15) NOT NULL
);

CREATE TABLE Specializations (
    SpecializationId INT AUTO_INCREMENT PRIMARY KEY,
    Specialization VARCHAR(50) NOT NULL
);

CREATE TABLE DoctorSpecializations (
    DoctorSpecializationId INT AUTO_INCREMENT PRIMARY KEY,
    DoctorId INT,
    SpecializationId INT,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(DoctorId),
    FOREIGN KEY (SpecializationId) REFERENCES Specializations(SpecializationId),
    UNIQUE KEY UniqueDoctorSpecialization (DoctorId, SpecializationId)
);

CREATE TABLE Appointments (
    AppointmentId INT AUTO_INCREMENT PRIMARY KEY,
    PatientId INT,
    DoctorId INT,
    AppointmentDate DATE NOT NULL,
    Reason VARCHAR(200),
    FOREIGN KEY (DoctorId) REFERENCES Doctors(DoctorId)
    -- FOREIGN KEY (PatientId) REFERENCES Patients(PatientId)
);

CREATE TABLE Patients (
    PatientId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Birthdate DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Phone VARCHAR(15) NOT NULL
);


INSERT INTO Patients (Name, Birthdate, Gender, Phone)
VALUES
    ('Carlos Ray', '1988-03-15', 'M', '555-0103'),
    ('Diana Grace', '1992-07-24', 'F', '555-0104'),
    ('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
    ('Alice Johnson', '1990-05-21', 'F', '555-0101'),
    ('Bob Smith', '1985-08-30', 'M', '555-0102');

INSERT INTO Doctors (Name, Email, Phone)
VALUES
    ('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
    ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
    ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
    ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
    ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

INSERT INTO Specializations (Specialization)
VALUES
    ('Orthopedics'), ('General Medicine'), ('Dermatology'), ('Pediatrics'), ('Cardiology');

INSERT INTO DoctorSpecializations (DoctorName, Specialization)
VALUES
    ('Dr. Sarah Connor', 'Pediatrics'),
    ('Dr. Lucy Liu', 'Dermatology'),
    ('Dr. Omar Sharif', 'Orthopedics'),
    ('Dr. Emily White', 'General Medicine'),
    ('Dr. John Davis', 'Cardiology');

INSERT INTO Appointments (AppointmentID, PatientName, DoctorName, AppointmentDate, Reason)
VALUES
    (1, 'Carlos Ray', 'Dr. Sarah Connor', '2024-01-20', 'Follow-up Visit'),
    (2, 'Diana Grace', 'Dr. Lucy Liu', '2024-01-22', 'Initial Consultation'),
    (3, 'Ethan Hunt', 'Dr. Omar Sharif', '2024-01-25', 'Routine Checkup'),
    (4, 'Alice Johnson', 'Dr. Emily White', '2024-01-28', 'Vaccination'),
    (5, 'Bob Smith', 'Dr. John Davis', '2024-01-30', 'Annual Physical Exam');


SELECT Patients.Name AS PatientName, Appointments.AppointmentDate, Appointments.Reason FROM Patients
JOIN Appointments ON Patients.Name = Appointments.PatientName;

SELECT Doctors.Name AS DoctorName, Doctors.Email, Doctors.Phone FROM Doctors
JOIN DoctorSpecializations ON Doctors.Name = DoctorSpecializations.DoctorName
JOIN Specializations ON DoctorSpecializations.Specialization = Specializations.Specialization
WHERE Specializations.Specialization = 'Dermatology';

SELECT Doctors.Name AS DoctorName, COUNT(Appointments.AppointmentID) AS AppointmentCount FROM Doctors
LEFT JOIN Appointments ON Doctors.Name = Appointments.DoctorName
GROUP BY Doctors.Name;

SELECT Appointments.AppointmentDate, Appointments.Reason, Patients.Name AS PatientName, Doctors.Name AS DoctorName FROM Appointments
JOIN Patients ON Appointments.PatientName = Patients.Name
JOIN Doctors ON Appointments.DoctorName = Doctors.Name
WHERE Appointments.AppointmentDate >= CURRENT_DATE()
ORDER BY Appointments.AppointmentDate LIMIT 5;

DELETE FROM Appointments
WHERE DATE(AppointmentDate) = '2023-01-01';

UPDATE Patients
SET Gender = 'M'
WHERE RIGHT(Name, 3) = 'kov';
