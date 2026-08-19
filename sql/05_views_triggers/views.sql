USE G13_hospital_db;
SELECT DATABASE();
CREATE VIEW vw_patient_appointments AS
SELECT
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
    a.appointment_date,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name
FROM G13_appointments a
JOIN G13_patients p
    ON a.patient_id = p.patient_id
JOIN G13_doctors d
    ON a.doctor_id = d.doctor_id;
    
SELECT * FROM vw_patient_appointments;

CREATE TABLE IF NOT EXISTS G13_doctor_user_map (
    mysql_username VARCHAR(100) PRIMARY KEY,
    doctor_id INT NOT NULL,

    FOREIGN KEY (doctor_id)
        REFERENCES G13_doctors(doctor_id)
);

CREATE OR REPLACE
SQL SECURITY DEFINER
VIEW vw_doctor_schedule AS
SELECT
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    a.appointment_id,
    a.appointment_date,
    a.appointment_time,
    a.status,
    CONCAT(p.first_name, ' ', p.last_name) AS patient_name
FROM G13_appointments a
JOIN G13_doctors d
    ON a.doctor_id = d.doctor_id
JOIN G13_patients p
    ON a.patient_id = p.patient_id
JOIN G13_doctor_user_map m
    ON d.doctor_id = m.doctor_id
WHERE m.mysql_username =
      SUBSTRING_INDEX(USER(), '@', 1);
SELECT * FROM vw_doctor_schedule;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';

