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
