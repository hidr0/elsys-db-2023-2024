DROP DATABASE IF EXISTS Clinic;
CREATE DATABASE Clinic;
USE Clinic;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Specializations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE Patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    birthdate DATE NOT NULL,
    gender VARCHAR(1) CHECK(gender IN ('M', 'F')),
    phone VARCHAR(20) NOT NULL
);
CREATE TABLE Doctors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL CHECK(email LIKE '%@%'),
    phone VARCHAR(20) NOT NULL,
    specialization_id INT,
    FOREIGN KEY (specialization_id) REFERENCES Specializations(id)
);
CREATE TABLE Appointments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    date DATETIME NOT NULL,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);

INSERT INTO Specializations (name) VALUES
('Orthopedics'),
('General Medicine'),
('Dermatology'),
('Pediatrics');

INSERT INTO Patients (name, birthdate, gender, phone) VALUES
('Carlos Ray', '1988-03-15', 'M', '555-0103'),
('Diana Grace', '1992-07-24', 'F', '555-0104'),
('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
('Alice Johnson', '1990-05-21', 'F', '555-0101'),
('Bob Smith', '1985-08-30', 'M', '555-0102');


INSERT INTO Doctors (name, email, phone, specialization_id) VALUES
('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203', 1), -- Orthopedics
('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204', 2),        -- General Medicine
('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205', 3),   -- Dermatology
('Dr. Emily White', 'emily.white@clinic.com', '555-0201', 4),   -- Pediatrics
('Dr. John Davis', 'john.davis@clinic.com', '555-0202', 2);     -- General Medicine

INSERT INTO Appointments (patient_id, doctor_id, date, reason) VALUES
(1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
(2, 2, '2024-01-22 09:30', 'Initial Consultation'),
(3, 3, '2024-01-25 16:00', 'Routine Checkup'),
(4, 4, '2024-01-28 10:00', 'Vaccination'),
(5, 5, '2024-01-30 11:00', 'Annual Physical Exam');

SELECT Patients.name, Appointments.date, Appointments.reason
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.id
WHERE Patients.name = 'Carlos Ray';

SELECT Doctors.name
FROM Doctors
JOIN Specializations ON Doctors.specialization_id = Specializations.id
WHERE Specializations.name = 'General Medicine';

SELECT Doctors.name, COUNT(*) as AppointmentCount
FROM Appointments
JOIN Doctors ON Appointments.doctor_id = Doctors.id
GROUP BY Doctors.name;

SELECT Appointments.date, Appointments.reason, Patients.name as PatientName, Doctors.name as DoctorName
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.id
JOIN Doctors ON Appointments.doctor_id = Doctors.id
ORDER BY Appointments.date
LIMIT 5;

DELETE FROM Appointments
WHERE DATE(Appointments.date) = '2023-01-01';

UPDATE Patients
SET gender = 'M'
WHERE LOWER(name) LIKE '%kov%';