DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

SET SQL_SAFE_UPDATES=0;
CREATE TABLE Doctor(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) not null,
    email varchar(50) not null unique check(email like "%@%"),
    phone varchar(15) not null
);

INSERT INTO Doctor(name,email,phone) VALUES("Sarah Connor", "sarah.connor@clinic.com", "555-0203");
INSERT INTO Doctor(name,email,phone) VALUES("Dr. Lucy Liu", "lucy.liu@clinic.com", "555-0204");
INSERT INTO Doctor(name,email,phone) VALUES("Dr. Omar Sharif","omar.sharif@clinic.com", "555-0205");
INSERT INTO Doctor(name,email,phone) VALUES("Dr. Emily White", "emily.white@clinic.com", "555-0201");
INSERT INTO Doctor(name,email,phone) VALUES("Dr. John Davis", "john.davis@clinic.com", "555-0202");
SELECT * FROM Doctor;


CREATE TABLE Specialisation(
	id int PRIMARY KEY AUTO_INCREMENT,
    specialisation text not null
);

INSERT INTO Specialisation(specialisation) VALUES("Orthopedics");
INSERT INTO Specialisation(specialisation) VALUES("General Medicine");
INSERT INTO Specialisation(specialisation) VALUES("Dermatology");
INSERT INTO Specialisation(specialisation) VALUES("Pediatrics");
SELECT * FROM Specialisation;

CREATE TABLE DoctorSpecialisation(
	id int PRIMARY KEY AUTO_INCREMENT,
    doctor_id int not null,
    specialisation_id int not null,
    FOREIGN KEY(doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY(specialisation_id) REFERENCES Specialisation(id)
);

INSERT INTO DoctorSpecialisation(doctor_id,specialisation_id) VALUES(1,4);
INSERT INTO DoctorSpecialisation(doctor_id,specialisation_id) VALUES(2,3);
INSERT INTO DoctorSpecialisation(doctor_id,specialisation_id) VALUES(3,1);
INSERT INTO DoctorSpecialisation(doctor_id,specialisation_id) VALUES(4,2);
INSERT INTO DoctorSpecialisation(doctor_id,specialisation_id) VALUES(5,2);

CREATE TABLE Patient(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(50) not null,
    birth_date date not null,
    gender enum("M","F"),
    phone text not null
); 

INSERT INTO Patient(name,birth_date,gender,phone) VALUES("Carlos Ray", "1988-03-11","M", "555-0103");
INSERT INTO Patient(name,birth_date,gender,phone) VALUES("Anton Mihalkov", "1992-07-24", "F", "555-0104");
INSERT INTO Patient(name,birth_date,gender,phone) VALUES("Ethan Hunt", "1979-11-02", "M", "555-0105");
INSERT INTO Patient(name,birth_date,gender,phone) VALUES("Alice Johnson", "1990-05-21", "F", "555-0101");
INSERT INTO Patient(name,birth_date,gender,phone) VALUES("Bob Smith", "1985-08-30", "M", "555-0102");
SELECT * FROM Patient;

CREATE TABLE Appointment(
	id int PRIMARY KEY AUTO_INCREMENT,
    date date not null,
    reason text,
    doctor_id int not null,
    patient_id int not null,
    FOREIGN KEY(doctor_id) REFERENCES Doctor(id),
    FOREIGN KEY(patient_id) REFERENCES Patient(id)
);

INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2024-02-20", "Follow-up Visit",1,1);
INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2024-01-22", "Initial Consultation",2,2);
INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2024-01-25", "Routine Checkup",3,3);
INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2024-01-20", "Pre-Routine Checkup",2,3);
INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2024-01-28", "Vaccination",4,4);
INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2024-01-30", "Annual Physical Exam",1,5);
INSERT INTO Appointment(date,reason,doctor_id,patient_id) VALUES("2023-01-01", "Annual Anatomical Exam",2,3);

SELECT * FROM Appointment;
    
-- 1
SELECT P.name, A.date, A.reason FROM Appointment as A
LEFT JOIN Patient as P
ON P.id = A.patient_id;    
    
-- 2 List all doctors with specific specialisation
SELECT S.specialisation,D.name FROM Doctor as D
LEFT JOIN DoctorSpecialisation as DS
ON DS.doctor_id = D.id
LEFT JOIN Specialisation as S
ON DS.specialisation_id = S.id 
WHERE S.specialisation like "General Medicine";

-- 3
SELECT D.name, COUNT(A.id) as appointment_count FROM Doctor as D
LEFT JOIN Appointment as A
ON D.id = A.doctor_id
GROUP BY D.id;

-- 4 
SELECT A.date, A.reason, P.name, D.name FROM Appointment as A
LEFT JOIN Doctor as D
ON D.id = A.doctor_id
LEFT JOIN Patient as P
ON P.id = A.patient_id
WHERE A.date > now()
ORDER BY A.date ASC
LIMIT 5;

-- 5
DELETE FROM Appointment WHERE date = "2023-01-01";

SELECT * FROM Appointment;

-- 6 
UPDATE Patient
SET gender = "M"
WHERE name like "%kov";

SELECT * FROM Patient;