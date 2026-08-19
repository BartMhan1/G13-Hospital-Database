USE G13_hospital_db;

/* A3(a): Create the three required G13 roles. */
CREATE ROLE IF NOT EXISTS
    'G13_admin'@'%',
    'G13_doctor'@'%',
    'G13_receptionist'@'%';

/* A3(b): Admin has full access to the hospital database. */
GRANT ALL PRIVILEGES
ON G13_hospital_db.*
TO 'G13_admin'@'%';

/* A3(b): Doctor has SELECT, INSERT, and UPDATE on appointments and treatments only. */
GRANT SELECT, INSERT, UPDATE
ON G13_hospital_db.G13_appointments
TO 'G13_doctor'@'%';

GRANT SELECT, INSERT, UPDATE
ON G13_hospital_db.G13_treatments
TO 'G13_doctor'@'%';

/* A3(b): Receptionist has SELECT and INSERT on appointments and patients only. */
GRANT SELECT, INSERT
ON G13_hospital_db.G13_appointments
TO 'G13_receptionist'@'%';

GRANT SELECT, INSERT
ON G13_hospital_db.G13_patients
TO 'G13_receptionist'@'%';

SHOW GRANTS FOR 'G13_admin'@'%';
SHOW GRANTS FOR 'G13_doctor'@'%';
SHOW GRANTS FOR 'G13_receptionist'@'%';

/* =========================================================
   Create login accounts for the six doctors
   ========================================================= */

CREATE USER IF NOT EXISTS 'g13_doctor_daniel'@'%'
IDENTIFIED BY 'Daniel@G13';

CREATE USER IF NOT EXISTS 'g13_doctor_priscilla'@'%'
IDENTIFIED BY 'Priscilla@G13';

CREATE USER IF NOT EXISTS 'g13_doctor_michael'@'%'
IDENTIFIED BY 'Michael@G13';

CREATE USER IF NOT EXISTS 'g13_doctor_linda'@'%'
IDENTIFIED BY 'Linda@G13';

CREATE USER IF NOT EXISTS 'g13_doctor_samuel'@'%'
IDENTIFIED BY 'Samuel@G13';

CREATE USER IF NOT EXISTS 'g13_doctor_rebecca'@'%'
IDENTIFIED BY 'Rebecca@G13';

/* =========================================================
   Assign the G13_doctor role to all six doctor accounts
   ========================================================= */

GRANT 'G13_doctor'@'%'
TO
    'g13_doctor_daniel'@'%',
    'g13_doctor_priscilla'@'%',
    'g13_doctor_michael'@'%',
    'g13_doctor_linda'@'%',
    'g13_doctor_samuel'@'%',
    'g13_doctor_rebecca'@'%';
    
    /* =========================================================
   Make the doctor role active automatically after login
   ========================================================= */

SET DEFAULT ROLE 'G13_doctor'@'%'
TO
    'g13_doctor_daniel'@'%',
    'g13_doctor_priscilla'@'%',
    'g13_doctor_michael'@'%',
    'g13_doctor_linda'@'%',
    'g13_doctor_samuel'@'%',
    'g13_doctor_rebecca'@'%';
    
    /* =========================================================
   Map each MySQL doctor login to the correct doctor_id
   ========================================================= */

INSERT INTO G13_doctor_user_map
    (mysql_username, doctor_id)
VALUES
    ('g13_doctor_daniel', 1),
    ('g13_doctor_priscilla', 2),
    ('g13_doctor_michael', 3),
    ('g13_doctor_linda', 4),
    ('g13_doctor_samuel', 5),
    ('g13_doctor_rebecca', 6);
    
SELECT * FROM G13_doctor_user_map;

GRANT SELECT
ON G13_hospital_db.vw_doctor_schedule
TO 'G13_doctor'@'%';

SHOW GRANTS FOR 'G13_doctor'@'%';