DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

SET SQL_SAFE_UPDATES=0;

CREATE TABLE Patient(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    gender ENUM("Male", "Female"),
    phone VARCHAR(20) NOT NULL
);

INSERT INTO Patient(name, birthdate, gender, phone) VALUES('Carlos Ray', '1988-03-15', 'Male', '555-0103');
INSERT INTO Patient(name, birthdate, gender, phone) VALUES('Diana Grace', '1992-07-24', 'Female', '555-0104');
INSERT INTO Patient(name, birthdate, gender, phone) VALUES('Ethan Hunt', '1979-11-02', 'Male', '555-0105');
INSERT INTO Patient(name, birthdate, gender, phone) VALUES('Alice Johnson', '1990-05-21', 'Female', '555-0101');
INSERT INTO Patient(name, birthdate, gender, phone) VALUES('Bob Smith', '1985-08-30', 'Male', '555-0102');

CREATE TABLE Doctor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL CHECK(email LIKE "%@%"),
    phone VARCHAR(100) NOT NULL
);

INSERT INTO Doctor(name, email, phone) VALUES('Dr. Sarah Connor', 'sarah.connor@clinic.com', '555-0203');
INSERT INTO Doctor(name, email, phone) VALUES('Dr. Lucy Liu', 'lucy.liu@clinic.com', '555-0204');
INSERT INTO Doctor(name, email, phone) VALUES('Dr. Omar Sharif', 'omar.sharif@clinic.com', '555-0205');
INSERT INTO Doctor(name, email, phone) VALUES('Emily White', 'emily.white@clinic.com', '555-0201');
INSERT INTO Doctor(name, email, phone) VALUES('Dr. John Davis', 'john.davis@clinic.com', '555-0202');


CREATE TABLE Appointment(
	id INT PRIMARY KEY AUTO_INCREMENT,
    date DATETIME NOT NULL,
    reason TEXT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    FOREIGN KEY(patient_id) REFERENCES Patient(id),
    FOREIGN KEY(doctor_id) REFERENCES Doctor(id)
);

INSERT INTO Appointment(date, reason, patient_id, doctor_id) VALUES('2024-01-20 14:00', 'Follow-up Visit', 1,1);
INSERT INTO Appointment(date, reason, patient_id, doctor_id) VALUES('2024-01-22 09:30', 'Initial Consultation', 2,2);
INSERT INTO Appointment(date, reason, patient_id, doctor_id) VALUES('2024-01-25 16:00', 'Routine Checkup', 3,3);
INSERT INTO Appointment(date, reason, patient_id, doctor_id) VALUES('2024-01-28 10:00', 'Vaccination', 4,4);
INSERT INTO Appointment(date, reason, patient_id, doctor_id) VALUES('2024-01-30 11:00', 'Annual Physical Exam', 5,5);

CREATE TABLE Specializations(
	id INT PRIMARY KEY AUTO_INCREMENT,
	specialization VARCHAR(100) NOT NULL
);

INSERT INTO Specializations(specialization) VALUES('Orthopedics');
INSERT INTO Specializations(specialization) VALUES('General Medicine');
INSERT INTO Specializations(specialization) VALUES('Dermatology');
INSERT INTO Specializations(specialization) VALUES('Pediatrics');

CREATE TABLE DoctorSpecializations(
	id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT NOT NULL,
    specialization_id INT NOT NULL,
    FOREIGN KEY(doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY(specialization_id) REFERENCES Specializations(id)
);

INSERT INTO DoctorSpecializations(doctor_id, specialization_id) VALUES(1, 4);
INSERT INTO DoctorSpecializations(doctor_id, specialization_id) VALUES(2, 3);
INSERT INTO DoctorSpecializations(doctor_id, specialization_id) VALUES(3, 1);
INSERT INTO DoctorSpecializations(doctor_id, specialization_id) VALUES(3, 1);
INSERT INTO DoctorSpecializations(doctor_id, specialization_id) VALUES(5, 2);


-- 1

SELECT P.name, A.date, A.reason FROM Appointment AS A
LEFT JOIN Patient AS P ON A.patient_id = P.id;

-- 2

SELECT D.name FROM Doctor AS D
LEFT JOIN DoctorSpecializations AS DS ON DS.doctor_id = D.id
LEFT JOIN Specializations AS S ON S.id = DS.specialization_id
WHERE S.specialization LIKE "Orthopedics";

-- 3

SELECT D.name, COUNT(A.id) FROM Doctor AS D
LEFT JOIN Appointment AS A ON A.doctor_id = D.id
GROUP BY D.name;

-- 4

SELECT A.date, A.reason, P.name, D.name FROM Appointment AS A
LEFT JOIN Patient AS P ON P.id = A.patient_id
LEFT JOIN Doctor AS D ON D.id = A.doctor_id
WHERE A.date >= NOW()
ORDER BY A.date
LIMIT 5;

-- 5

DELETE FROM Appointment AS A
WHERE DATE(A.date) LIKE '2023-01-01';

-- 6

UPDATE Patient AS P SET gender = 'Male'
WHERE P.name LIKE "%kov%";