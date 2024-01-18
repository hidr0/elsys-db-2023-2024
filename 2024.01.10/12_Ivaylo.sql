DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

CREATE TABLE Patient (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('Male', 'Female'),
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO Patient (name, birthdate, gender, phone) VALUES ('Carlos Ray','1988-03-15', 'Male', '555-0103'),
('Diana Grace', '1992-07-24', 'Female', '555-0104'),
('Ethan Hunt', '1979-11-02', 'Male', '555-0105'),
('Alice Johnson', '1990-05-21', 'Female', '555-0101'),
('Bob Smith', '1985-08-30', 'Male', '555-0102');


CREATE TABLE Specialization (
    id INT AUTO_INCREMENT PRIMARY KEY,
    specialization VARCHAR(50) NOT NULL
);

INSERT INTO Specialization (specialization) VALUES ('Orthopedics'),
('General Medicine'),
('Derrmatology'),
('Pediatrics');

CREATE TABLE Doctor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE
);

INSERT INTO Doctor (name, email, phone) VALUES
('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

CREATE TABLE Appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    date DATETIME,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patient(id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id)
);


INSERT INTO Appointments (patient_id, doctor_id, date, reason) VALUES
(1, 1, '2024-01-20 14:00', 'Follow-up Visit'), 
(2, 2, '2024-01-22 09:30', 'Initial Consultation'), 
(3, 3, '2024-01-25 16:00', 'Routine Checkup'), 
(4, 4, '2024-01-28 10:00', 'Vaccination'),
(5, 5, '2024-01-30 11:00', 'Annual Physical Exam'); 



CREATE TABLE DoctorSpecializations (
    doctor_id INT,
    specialization_id INT,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

INSERT INTO DoctorSpecializations (doctor_id, specialization_id) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 4),
(5, 4);

-- find all appointments scheduled for a specidic patient by nam

SELECT Patient.name, Appointments.date, Appointments.reason
FROM Appointments
JOIN Patient ON Appointments.patient_id = Patient.id
WHERE Patient.name = 'Carlos Ray';

-- list all doctors with a specific specialization

SELECT Doctor.name, Specialization.specialization
FROM Doctor
JOIN DoctorSpecializations ON Doctor.id = DoctorSpecializations.doctor_id
JOIN Specialization ON DoctorSpecializations.specialization_id = Specialization.id
WHERE Specialization.specialization = 'Orthopedics';

-- count the number of appointments each doctor has

SELECT Doctor.name, COUNT(Appointments.id)
FROM Doctor
LEFT JOIN Appointments ON Doctor.id = Appointments.doctor_id
GROUP BY Doctor.id, Doctor.name;

-- retrieve the details of the next 5 appointments scheduled at the hospital

SELECT Patient.name, Doctor.name, Appointments.date, Appointments.reason
FROM Appointments
JOIN Patient ON Appointments.patient_id = Patient.id
JOIN Doctor ON Appointments.doctor_id = Doctor.id
WHERE Appointments.date >= NOW()
ORDER BY Appointments.date
LIMIT 5;

-- delete all appointments on 2023-01-01

DELETE FROM Appointments
WHERE DATE(Appointments.date) = '2023-01-01';

-- update all patients with "kov" in their name to have a gender "Male"

UPDATE Patient
SET gender = 'Male'
WHERE name LIKE '%kov%';




