DROP DATABASE IF EXISTS Clinic;
CREATE DATABASE Clinic;
USE Clinic;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE Doctor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL CHECK (email LIKE '%@%'),
    phone VARCHAR(10) NOT NULL
);

CREATE TABLE Specialization (
    id INT PRIMARY KEY AUTO_INCREMENT,
    specialization VARCHAR(50) NOT NULL
);

CREATE TABLE DoctorSpecialization (
    doctor_id INT NOT NULL,
    specialization_id INT NOT NULL,
    PRIMARY KEY (doctor_id, specialization_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (specialization_id) REFERENCES Specialization(id)
);

CREATE TABLE Patient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    phone VARCHAR(10) NOT NULL
);

CREATE TABLE Appointment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    patient_id INT NOT NULL,
    date DATETIME NOT NULL,
    reason VARCHAR(100),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY (patient_id) REFERENCES Patient(id)
);

-- - **Patients**:
--   - Name: Carlos Ray, Birthdate: 1988-03-15, Gender: Male, Phone: 555-0103
--   - Name: Diana Grace, Birthdate: 1992-07-24, Gender: Female, Phone: 555-0104
--   - Name: Ethan Hunt, Birthdate: 1979-11-02, Gender: Male, Phone: 555-0105
--   - Name: Alice Johnson, Birthdate: 1990-05-21, Gender: Female, Phone: 555-0101
--   - Name: Bob Smith, Birthdate: 1985-08-30, Gender: Male, Phone: 555-0102

INSERT INTO Patient(name, birthdate, gender, phone)
VALUES('Carlos Ray', '1988-03-15', 'M', '555-0103'),
      ('Diana Grace', '1992-07-24', 'F', '555-0104'),
      ('Ethan Hunt', '1979-11-02', 'M', '555-0105'),
      ('Alice Johnson', '1990-05-21', 'F', '555-0101'),
      ('Bob Smith', '1985-08-30', 'M', '555-0102');

-- - **Doctors**:
--   - Name: Dr. Sarah Connor, Email: sarah.connor@clinic.com, Phone: 555-0203
--   - Name: Dr. Lucy Liu, Email: lucy.liu@clinic.com, Phone: 555-0204
--   - Name: Dr. Omar Sharif, Email: omar.sharif@clinic.com, Phone: 555-0205
--   - Name: Dr. Emily White, Email: emily.white@clinic.com, Phone: 555-0201
--   - Name: Dr. John Davis, Email: john.davis@clinic.com, Phone: 555-0202

INSERT INTO Doctor(name, email, phone)
VALUES('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203'),
      ('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204'),
      ('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205'),
      ('Dr. Emily White', 'emily.white@clinic.com', '555-0201'),
      ('Dr. John Davis', 'john.davis@clinic.com', '555-0202');

-- - **Specializations**:
--   - Specialization: Orthopedics
--   - Specialization: General Medicine
--   - Specialization: Dermatology
--   - Specialization: Pediatrics

INSERT INTO Specialization (specialization) 
VALUES ('Orthopedics'), 
       ('General Medicine'), 
       ('Dermatology'), 
       ('Pediatrics');

-- - **DoctorSpecializations**:
--   - Doctor: Dr. Sarah Connor, Specialization: Pediatrics
--   - Doctor: Dr. Lucy Liu, Specialization: Dermatology
--   - Doctor: Dr. Omar Sharif, Specialization: Orthopedics
--   - Doctor: Dr. Emily White, Specialization: General Medicine
--   - Doctor: Dr. John Davis, Specialization: General Medicine

INSERT INTO DoctorSpecialization (doctor_id, specialization_id)
VALUES (1, 4),
       (2, 3),
       (3, 1),
       (4, 2),
       (5, 2);

-- - **Appointments**:
--   - Appointment: 1, Patient: Carlos Ray, Doctor: Dr. Sarah Connor, Date: 2024-01-20 14:00, Reason: Follow-up Visit
--   - Appointment: 2, Patient: Diana Grace, Doctor: Dr. Lucy Liu, Date: 2024-01-22 09:30, Reason: Initial Consultation
--   - Appointment: 3, Patient: Ethan Hunt, Doctor: Dr. Omar Sharif, Date: 2024-01-25 16:00, Reason: Routine Checkup
--   - Appointment: 4, Patient: Alice Johnson, Doctor: Dr. Emily White, Date: 2024-01-28 10:00, Reason: Vaccination
--   - Appointment: 5, Patient: Bob Smith, Doctor: Dr. John Davis, Date: 2024-01-30 11:00, Reason: Annual Physical Exam

INSERT INTO Appointment(doctor_id, patient_id, date, reason)
VALUES(1, 1, '2024-01-20 14:00', 'Follow-up Visit'),
      (2, 2, '2024-01-22 09:30', 'Initial Consultation'),
      (3, 3, '2024-01-25 16:00', 'Routine Checkup'),
      (4, 4, '2024-01-28 10:00', 'Vaccination'),
      (5, 5, '2024-01-30 11:00', 'Annual Physical Exam');

-- Queries

SELECT Patient.name, Appointment.date, Appointment.reason
FROM Patient
JOIN Appointment ON Patient.id = Appointment.patient_id
WHERE Patient.name = 'Carlos Ray';

SELECT Doctor.name
FROM Doctor
JOIN Specialization ON Doctor.id = Specialization.id
WHERE Specialization.specialization = 'Cardiology';

SELECT Doctor.name, Count(*)
FROM Doctor
JOIN Appointment ON Doctor.id = Appointment.doctor_id
GROUP BY Doctor.name;

SELECT Appointment.date, Appointment.reason, Patient.name, Doctor.name
FROM Appointment
JOIN Patient ON Appointment.patient_id = Patient.id
JOIN Doctor ON Appointment.doctor_id = Doctor.id
WHERE Appointment.date > NOW()
ORDER BY Appointment.date ASC
LIMIT 5;

DELETE FROM Appointment
WHERE DATE(Appointment.date) = '2023-01-01';

UPDATE Patient
SET Patient.phone = '555-0106'
WHERE Patient.name LIKE '%kov%' AND gender = 'M';

