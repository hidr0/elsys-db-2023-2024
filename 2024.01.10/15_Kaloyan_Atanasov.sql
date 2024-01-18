SET SQL_SAFE_UPDATES=0;
DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Patients(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    birthdate date NOT NULL,
    gender varchar(1) CHECK(gender = 'M' OR gender = 'F'),
    phone varchar(10)
);

INSERT INTO Patients(name, birthdate, gender, phone) VALUES("Carlos Ray", "1988-03-15", "M", "555-0103");
INSERT INTO Patients(name, birthdate, gender, phone) VALUES("Diana Grace", "1992-07-24", "F", "555-0104");
INSERT INTO Patients(name, birthdate, gender, phone) VALUES("Ethan Hunt", "1979-11-02", "M", "555-0105");
INSERT INTO Patients(name, birthdate, gender, phone) VALUES("Alice Johnson", "1990-05-21", "F", "555-0101");
INSERT INTO Patients(name, birthdate, gender, phone) VALUES("Bob Smith", "1985-08-30", "M", "555-0102");

CREATE TABLE Doctors(
	id int PRIMARY KEY AUTO_INCREMENT,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL CHECK(email LIKE '%@%'),
    phone varchar(10) NOT NULL
);

INSERT INTO Doctors(name, email, phone) VALUES("Dr. Sarah Connor", "sarah.connor@clinic.com", "555-0203");
INSERT INTO Doctors(name, email, phone) VALUES("Dr. Lucy Liu", "lucy.liu@clinic.com", "555-0204");
INSERT INTO Doctors(name, email, phone) VALUES("Dr. Omar Sharif", "omar.sharif@clinic.com", "555-0205");
INSERT INTO Doctors(name, email, phone) VALUES("Dr. Emily White", "emily.white@clinic.com", "555-0201");
INSERT INTO Doctors(name, email, phone) VALUES("Dr. John Davis", "jhon.davis@clinic.com", "555-0202");

CREATE TABLE Specialisations(
	id int PRIMARY KEY AUTO_INCREMENT,
    specialisation varchar(100)
);

INSERT INTO Specialisations(specialisation) VALUES("Orthopedics");
INSERT INTO Specialisations(specialisation) VALUES("General Medicine");
INSERT INTO Specialisations(specialisation) VALUES("Dermatology");
INSERT INTO Specialisations(specialisation) VALUES("Pediatrics");

CREATE TABLE DoctorsSpecialisations(
	id int PRIMARY KEY AUTO_INCREMENT,
    doctor_id int,
    spec_id int,
    FOREIGN KEY(doctor_id) REFERENCES Doctors(id),
	FOREIGN KEY(spec_id) REFERENCES Specialisations(id)
);

INSERT INTO DoctorsSpecialisations(doctor_id, spec_id) VALUES(1, 4);
INSERT INTO DoctorsSpecialisations(doctor_id, spec_id) VALUES(2, 3);
INSERT INTO DoctorsSpecialisations(doctor_id, spec_id) VALUES(3, 1);
INSERT INTO DoctorsSpecialisations(doctor_id, spec_id) VALUES(4, 2);
INSERT INTO DoctorsSpecialisations(doctor_id, spec_id) VALUES(5, 2);

CREATE TABLE Appointments(
	id int PRIMARY KEY AUTO_INCREMENT,
    dat datetime NOT NULL,
    doctor_id int,
    patient_id int,
    reason varchar(255),
    FOREIGN KEY(doctor_id) REFERENCES Doctors(id),
	FOREIGN KEY(patient_id) REFERENCES Patients(id)
);

INSERT INTO Appointments(dat, doctor_id, patient_id, reason) VALUES("2024-01-20 14:00", 1, 1, "Follow-up Visit");
INSERT INTO Appointments(dat, doctor_id, patient_id, reason) VALUES("2024-01-20 14:00", 2, 2, "Initial Consultation");
INSERT INTO Appointments(dat, doctor_id, patient_id, reason) VALUES("2024-01-20 14:00", 3, 3, "Routine Checkup");
INSERT INTO Appointments(dat, doctor_id, patient_id, reason) VALUES("2024-01-20 14:00", 4, 4, "Vaccination");
INSERT INTO Appointments(dat, doctor_id, patient_id, reason) VALUES("2024-01-20 14:00", 5, 5, "Annual Physical Exam");

SELECT Patients.name, Appointments.dat, Appointments.reason
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.id
WHERE Patients.name = 'Alice Johnson';

SELECT Doctors.name AS DoctorName
FROM Doctors
JOIN DoctorsSpecialisations ON Doctors.id = DoctorsSpecialisations.doctor_id
JOIN Specialisations ON DoctorsSpecialisations.spec_id = Specialisations.id
WHERE Specialisations.specialisation = 'Pediatrics';

SELECT Doctors.name, COUNT(Appointments.id)
FROM Doctors
LEFT JOIN Appointments ON Doctors.id = Appointments.doctor_id
GROUP BY Doctors.name;

SELECT Appointments.dat, Appointments.reason, Patients.name, Doctors.name AS DoctorName
FROM Appointments
JOIN Patients ON Appointments.patient_id = Patients.id
JOIN Doctors ON Appointments.doctor_id = Doctors.id
ORDER BY Appointments.dat
LIMIT 5;

DELETE FROM Appointments
WHERE DATE(Appointments.dat) = '2023-01-01';

UPDATE Patients
SET gender = 'M'
WHERE LOWER(Patients.name) LIKE '%kov';