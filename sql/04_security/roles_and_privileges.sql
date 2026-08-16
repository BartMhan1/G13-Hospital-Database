USE G13_hospital_db;

/* Create the three hospital-system roles. */
CREATE ROLE IF NOT EXISTS
    'G13_admin'@'localhost',
    'G13_doctor'@'localhost',
    'G13_receptionist'@'localhost';

/* G13_admin: full access to the hospital database. */
GRANT ALL PRIVILEGES
ON G13_hospital_db.*
TO 'G13_admin'@'localhost';

/* G13_doctor: access only to appointments and treatments. */
GRANT SELECT, INSERT, UPDATE
ON G13_hospital_db.G13_appointments
TO 'G13_doctor'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON G13_hospital_db.G13_treatments
TO 'G13_doctor'@'localhost';

/* G13_receptionist: access only to appointments and patients. */
GRANT SELECT, INSERT
ON G13_hospital_db.G13_appointments
TO 'G13_receptionist'@'localhost';

GRANT SELECT, INSERT
ON G13_hospital_db.G13_patients
TO 'G13_receptionist'@'localhost';
