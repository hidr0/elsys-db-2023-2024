DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Doctor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL CHECK (email LIKE '%@%'),
    phone VARCHAR(20) NOT NULL
);

INSERT INTO Doctor (name, email, phone) VALUES
('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

CREATE TABLE Patient(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F'),
    phone VARCHAR(20) NOT NULL
);

INSERT INTO Patient (name, birthdate, gender, phone) VALUES
('Carlos Ray', '1988-03-15', 'M', '555-0103'),
('Diana Grace', '1992-07-24', 'F', '555-0104'),
('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
('Alice Johnson', '1990-05-21', 'F', '555-0101'),
('Bob Smith', '1985-08-30', 'M', '555-0102');


CREATE TABLE Appointment(
	id INT PRIMARY KEY AUTO_INCREMENT,
	date DATE NOT NULL,
    reason VARCHAR(300),
    doctor_id INT,
    patient_id INT,
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (patient_id) REFERENCES Patient(id)
);
-- Appointment: 1, Patient: Carlos Ray, Doctor: Dr. Sarah Connor, Date: 2024-01-20 14:00, Reason: Follow-up Visit
-- Appointment: 2, Patient: Diana Grace, Doctor: Dr. Lucy Liu, Date: 2024-01-22 09:30, Reason: Initial Consultation
-- Appointment: 3, Patient: Ethan Hunt, Doctor: Dr. Omar Sharif, Date: 2024-01-25 16:00, Reason: Routine Checkup
-- Appointment: 4, Patient: Alice Johnson, Doctor: Dr. Emily White, Date: 2024-01-28 10:00, Reason: Vaccination
-- Appointment: 5, Patient: Bob Smith, Doctor: Dr. John Davis, Date: 2024-01-30 11:00, Reason: Annual Physical Exam
-- Inserting data into the Appointment table
INSERT INTO Appointment (patient_id, doctor_id, date, reason) VALUES
(1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
(2, 2, '2024-01-22 09:30', 'Initial Consultation'),
(3, 3, '2024-01-25 16:00', 'Routine Checkup'),
(4, 4, '2024-01-28 10:00', 'Vaccination'),
(5, 5, '2024-01-30 11:00', 'Annual Physical Exam');


CREATE TABLE Specialization(
	id INT PRIMARY KEY AUTO_INCREMENT,
    specialization VARCHAR(50) NOT NULL
);

INSERT INTO Specialization(specialization) VALUES('Orthopedics'), ('General Medicine'), ('Dermatology'), ('Pediatrics'), ('Cardiology');

CREATE TABLE Doctor_Specialization (
	
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

INSERT INTO Doctor_Specialization(doctor_id, specialization_id) VALUES(1, 4),(2, 3), (3, 1), (4, 2), (5, 2), (4, 5);

SELECT Patient.name, Appointment.date, Appointment.reason FROM Patient
LEFT JOIN Appointment ON Patient.id = Appointment.patient_id;

SELECT Doctor.name FROM Doctor
LEFT JOIN Doctor_Specialization ON Doctor.id = Doctor_Specialization.doctor_id
LEFT JOIN Specialization ON Doctor_Specialization.specialization_id = Specialization.id
WHERE Specialization.specialization = 'Cardiology';

SELECT Doctor.name, COUNT(Appointment.id) FROM Doctor
LEFT JOIN Appointment ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.name;

SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name FROM Appointment
LEFT JOIN Patient ON Appointment.patient_id = Patient.id
LEFT JOIN Doctor ON Appointment.doctor_id = Doctor.id
WHERE Appointment.date > '2024-01-01'
ORDER BY Appointment.date
LIMIT 5;


DELETE FROM Appointment
WHERE date = '2023-01-01';

UPDATE Patient
SET gender = 'M'
WHERE name LIKE '%kov%';

