DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Doctors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE CHECK (email LIKE '%@%'),
  phone VARCHAR(15) NOT NULL
);

CREATE TABLE Patients (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  birthdate DATE NOT NULL,
  gender CHAR(1) CHECK (gender IN ('M', 'F')) NOT NULL,
  phone VARCHAR(15) NOT NULL
);

CREATE TABLE Specializations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  specialization VARCHAR(255) NOT NULL
);

CREATE TABLE DoctorSpecializations (
  id INT PRIMARY KEY AUTO_INCREMENT,
  doctor_id INT NOT NULL,
  specialization_id INT NOT NULL,
  FOREIGN KEY (doctor_id) REFERENCES Doctors(id),
  FOREIGN KEY (specialization_id) REFERENCES Specializations(id)
);

CREATE TABLE Appointments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  date DATETIME NOT NULL,
  reason TEXT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES Patients(id),
  FOREIGN KEY (doctor_id) REFERENCES Doctors(id)
);


INSERT INTO Patients (name, birthdate, gender, phone) VALUES 
('Carlos Ray', '1988-03-15', 'M', '555-0103'),
('Diana Grace', '1992-07-24', 'F', '555-0104'),
('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
('Alice Johnsonkov', '1990-05-21', 'F', '555-0101'),
('Bob Smithkov', '1985-08-30', 'M', '555-0102');

INSERT INTO Doctors(name, email, phone) VALUES
("Dr. Sarah Connor", "sarah.connor@clinic.com", "555-0203"),
("Dr. Lucy", "lucy.liu@clinic.com", "555-0204"),
("Dr. Omar Sharif", "omar.sharif@clinic.com", "555-0205"),
("Dr. Emily White", "emily.white@clinic.com", "555-0201"),
("Dr. John Davis", "john.davis@clinic.com", "555-0202");

INSERT INTO Specializations(specialization) VALUES
("Orthopedics"),
("General Medicine"),
("Dermatology"),
("Pediatrics");

INSERT INTO DoctorSpecializations (doctor_id, specialization_id) VALUES 
(1, 4),
(2, 3),
(3, 1),
(4, 2),
(5, 2);

INSERT INTO Appointments (patient_id, doctor_id, date, reason) VALUES
(1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
(2, 2, '2024-01-22 09:30', 'Follow-up Visit'),
(3, 3, '2024-01-25 16:00', 'Follow-up Visit'),
(4, 4, '2024-01-28 10:00', 'Follow-up Visit'),
(5, 5, '2024-01-30 11:00', 'Follow-up Visit');	

SELECT p.id AS PatientID, p.name AS PatientName, a.date AS AppointmentDate, a.reason AS AppointmentReason
FROM Patients p
LEFT JOIN Appointments a ON p.id = a.patient_id
LEFT JOIN Doctors d ON a.doctor_id = d.id;

SELECT d.id AS DoctorID, d.name AS DoctorName
FROM Doctors d
JOIN DoctorSpecializations ds ON d.id = ds.doctor_id
JOIN Specializations s ON ds.specialization_id = s.id
WHERE s.specialization = 'General Medicine';

SELECT  d.id AS DoctorID, d.name AS DoctorName, COUNT(a.id) AS NumberOfAppointments
FROM Doctors d
LEFT JOIN Appointments a ON d.id = a.doctor_id
GROUP BY d.id;

SELECT a.id AS AppointmentID, a.date AS AppointmentDate, a.reason AS AppointmentReason, p.name AS PatientName, d.name AS DoctorName
FROM Appointments a
JOIN Patients p ON a.patient_id = p.id
JOIN Doctors d ON a.doctor_id = d.id
ORDER BY a.date
LIMIT 5;

SELECT * FROM Appointments;
DELETE FROM Appointments WHERE date = '2024-01-20 14:00';
SELECT * FROM Appointments;

SELECT * FROM Patients;
UPDATE Patients SET gender = 'M' WHERE name LIKE '%kov%';
SELECT * FROM Patients;