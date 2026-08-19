# G13 Hospital Database — Commented Code Guide

This guide explains the actual SQL/scripts in this repository in simple language so a group member can read the code and understand what each part is doing.

## 1. Schema — `sql/01_schema/create_tables.sql`

```sql
-- Create the hospital database.
CREATE DATABASE G13_hospital_db;

-- Select that database so all tables are created inside it.
USE G13_hospital_db;

-- Confirm which database MySQL is currently using.
SELECT DATABASE();

-- Create the patient table.
CREATE TABLE G13_patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique ID generated automatically.
    first_name VARCHAR(50) NOT NULL,           -- Patient's first name; required.
    last_name VARCHAR(50) NOT NULL,            -- Patient's surname; required.
    date_of_birth DATE NOT NULL,               -- Patient's date of birth.
    gender VARCHAR(20) NOT NULL,               -- Patient's gender.
    phone_number VARCHAR(20) NOT NULL,         -- Patient contact number.
    email VARCHAR(100),                         -- Optional email address.
    address VARCHAR(255),                       -- Optional home/address information.
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE), -- Registration date.
    blood_group VARCHAR(5),                     -- Custom hospital attribute: useful in emergencies.
    emergency_contact VARCHAR(20)              -- Custom hospital attribute: emergency contact number.
);

-- Display the columns and definitions of the patient table.
DESCRIBE G13_patients;
```

The same pattern is used for the other tables. The important things to recognise are:

- `PRIMARY KEY` uniquely identifies a row.
- `AUTO_INCREMENT` makes MySQL generate the ID automatically.
- `NOT NULL` means a value must be supplied.
- `UNIQUE` prevents duplicate values, such as duplicate doctor emails or license numbers.
- `FOREIGN KEY` connects one table to another.
- `CHECK` prevents invalid values, such as negative fees.

### Doctors

```sql
CREATE TABLE G13_doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique doctor ID.
    first_name VARCHAR(50) NOT NULL,          -- Doctor's first name.
    last_name VARCHAR(50) NOT NULL,           -- Doctor's surname.
    specialization VARCHAR(100) NOT NULL,    -- Medical specialty.
    phone_number VARCHAR(20) NOT NULL,        -- Doctor's contact number.
    email VARCHAR(100) UNIQUE NOT NULL,       -- Email must be unique.
    license_number VARCHAR(50) UNIQUE NOT NULL,-- Medical license must be unique.
    years_experience INT NOT NULL,            -- Number of years practicing.
    CHECK (years_experience >= 0)             -- Prevent negative experience.
);
```

### Appointments

```sql
CREATE TABLE G13_appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT, -- Unique appointment ID.
    patient_id INT NOT NULL,                       -- Patient attending.
    doctor_id INT NOT NULL,                        -- Doctor handling appointment.
    appointment_date DATE NOT NULL,                -- Appointment date.
    appointment_time TIME NOT NULL,                -- Appointment time.
    status VARCHAR(20) NOT NULL,                   -- Completed, Scheduled, Cancelled, etc.
    consultation_fee DECIMAL(10,2) NOT NULL,       -- Amount charged for consultation.
    appointment_type VARCHAR(50) NOT NULL,         -- Type of appointment.
    reason_for_visit VARCHAR(255),                 -- Why the patient came.
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Connect this appointment to an existing patient.
    FOREIGN KEY (patient_id) REFERENCES G13_patients(patient_id),

    -- Connect this appointment to an existing doctor.
    FOREIGN KEY (doctor_id) REFERENCES G13_doctors(doctor_id),

    -- Consultation fees cannot be negative.
    CHECK (consultation_fee >= 0)
);
```

The remaining tables are `G13_treatments`, `G13_medications`, `G13_prescriptions`, `G13_payments`, and `G13_admissions`. They extend the hospital system to cover treatment, drugs, prescriptions, payments and inpatient admission. `G13_doctor_user_map` links a MySQL doctor username to a specific `doctor_id`, which is later used to restrict the doctor schedule view.

## 2. Data Population — `sql/02_data/insert_data.sql`

The data file uses `INSERT INTO` to place sample records into the tables.

```sql
-- Select the hospital database first.
USE G13_hospital_db;

-- Insert the required 15 patient records.
INSERT INTO G13_patients (...)
VALUES (...);
```

The important idea is that one `INSERT` statement can insert many rows. The repository contains 15 patient records, 6 doctors, 20 appointments and 12 treatments, satisfying the main numerical requirements. It also contains 10 medications and additional prescription/payment/admission records.

For an appointment such as:

```sql
INSERT INTO G13_appointments
(patient_id, doctor_id, appointment_date, appointment_time,
 status, consultation_fee, appointment_type, reason_for_visit)
VALUES
(1, 1, DATE_SUB(CURDATE(), INTERVAL 6 DAY), '09:00:00',
 'Completed', 180.00, 'General Consultation', 'Fever and headache');
```

Read it as:

1. Add one appointment.
2. `patient_id = 1` means the appointment belongs to patient 1.
3. `doctor_id = 1` means doctor 1 is handling it.
4. The date is six days before today.
5. The appointment starts at 09:00.
6. Its status is `Completed`.
7. The consultation fee is 180.00.
8. The appointment type and reason explain the clinical context.

`DATE_SUB(CURDATE(), INTERVAL 6 DAY)` is deliberately relative to today's date, which keeps the sample data useful when the script is run on another date.

## 3. Role 4 — Q1 to Q3 — `sql/03_queries/queries_q1_q3.sql`

### Q1 — Patient appointment statistics

```sql
-- Show each patient's ID and combine first and last name into one value.
SELECT G13_patients.patient_id,
       CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS full_name,

       -- Count how many appointments belong to this patient.
       COUNT(G13_appointments.appointment_id) AS total_appointments,

       -- Calculate the patient's average consultation fee.
       AVG(G13_appointments.consultation_fee) AS average_consultation_fee

-- Start with the patient table.
FROM G13_patients

-- Connect patients to their appointments.
JOIN G13_appointments
  ON G13_patients.patient_id = G13_appointments.patient_id

-- Produce one result row per patient.
GROUP BY G13_patients.patient_id;
```

`CONCAT()` joins text together. `COUNT()` counts appointments. `AVG()` calculates the average fee. `GROUP BY patient_id` makes the calculations happen separately for each patient.

Important exam note: the current repository uses `JOIN`, which is an inner join. Therefore, patients with zero appointments will not appear. Because the assignment says **all patients**, a safer version is:

```sql
FROM G13_patients
LEFT JOIN G13_appointments
  ON G13_patients.patient_id = G13_appointments.patient_id
```

A `LEFT JOIN` keeps patients even when they have no matching appointment.

### Q2 — Doctor with highest revenue

```sql
SELECT G13_doctors.doctor_id,
       CONCAT(G13_doctors.first_name, ' ', G13_doctors.last_name) AS full_name,
       G13_doctors.specialization,

       -- Add the consultation fees earned from completed appointments.
       SUM(G13_appointments.consultation_fee) AS total_revenue,

       -- Count the completed appointments.
       COUNT(G13_appointments.appointment_id) AS number_of_appointment

FROM G13_doctors

-- Match each doctor with their appointments.
JOIN G13_appointments
  ON G13_doctors.doctor_id = G13_appointments.doctor_id

-- Only completed appointments count as collected revenue.
WHERE G13_appointments.status = 'Completed'

-- Calculate totals separately for each doctor.
GROUP BY G13_doctors.doctor_id

-- Put the highest revenue first.
ORDER BY total_revenue DESC

-- Keep only the highest-revenue doctor.
LIMIT 1;
```

Read the logic as: **join doctors to appointments → keep completed appointments → add each doctor's fees → count completed appointments → sort highest to lowest → take the first doctor.**

### Q3 — Appointments for the current week

```sql
SELECT G13_appointments.appointment_id,
       CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS patient_name,
       CONCAT(G13_doctors.first_name, ' ', G13_doctors.last_name) AS doctor_name,
       G13_appointments.appointment_date,
       G13_appointments.appointment_time,
       G13_appointments.status

FROM G13_appointments

-- Add the patient name.
JOIN G13_patients
  ON G13_appointments.patient_id = G13_patients.patient_id

-- Add the doctor name.
JOIN G13_doctors
  ON G13_appointments.doctor_id = G13_doctors.doctor_id

-- Find the Monday of the current week.
WHERE G13_appointments.appointment_date >=
      DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY)

-- Stop before the Monday of the following week.
AND G13_appointments.appointment_date <
    DATE_ADD(
        DATE_SUB(CURDATE(), INTERVAL WEEKDAY(CURDATE()) DAY),
        INTERVAL 7 DAY
    )

-- Display appointments from earliest to latest.
ORDER BY G13_appointments.appointment_date;
```

`CURDATE()` gives today's date. `WEEKDAY()` gives the weekday number, where Monday is 0. The first expression calculates this week's Monday; the second calculates next Monday. Together they define the current Monday-to-Sunday week.

## 4. Role 5 — Q4 to Q7 — `sql/03_queries/queries_q4_q7.sql`

### Q4 — Patients who never booked an appointment

```sql
-- Select the patient information required by the examiner.
SELECT G13_patients.patient_id,
       CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS patient_name,
       G13_patients.registration_date

FROM G13_patients

-- Keep every patient, even if no appointment exists.
LEFT JOIN G13_appointments
  ON G13_patients.patient_id = G13_appointments.patient_id

-- If appointment_id is NULL, no appointment matched that patient.
WHERE G13_appointments.appointment_id IS NULL;
```

This is a classic **LEFT JOIN + IS NULL** pattern for finding records that have no related record.

### Q5 — Monthly summary

```sql
SELECT MONTH(G13_appointments.appointment_date) AS appointment_month,
       COUNT(G13_appointments.appointment_id) AS total_appointments,
       SUM(G13_appointments.consultation_fee) AS total_revenue,
       AVG(G13_appointments.consultation_fee) AS average_appointment_fee

FROM G13_appointments

-- Put all appointments from the same month into one group.
GROUP BY MONTH(G13_appointments.appointment_date)

-- Display January before February, etc.
ORDER BY appointment_month;
```

`MONTH(date)` extracts the month number. `COUNT`, `SUM`, and `AVG` then calculate statistics for each month.

Exam improvement: grouping by month alone combines January 2025 and January 2026. A production-quality report should normally group by both year and month, e.g. `GROUP BY YEAR(appointment_date), MONTH(appointment_date)`.

### Q6 — Join appointments to patients and doctors

```sql
SELECT G13_appointments.appointment_id,
       CONCAT(G13_patients.first_name, ' ', G13_patients.last_name) AS patient_name,
       CONCAT(G13_doctors.first_name, ' ', G13_doctors.last_name) AS doctor_name,
       G13_doctors.specialization,
       G13_appointments.appointment_date,
       G13_appointments.status,
       G13_appointments.consultation_fee

FROM G13_appointments

-- Match each appointment to its patient.
JOIN G13_patients
  ON G13_appointments.patient_id = G13_patients.patient_id

-- Match each appointment to its doctor.
JOIN G13_doctors
  ON G13_appointments.doctor_id = G13_doctors.doctor_id

-- Show appointments in ID order.
ORDER BY G13_appointments.appointment_id;
```

This query demonstrates how foreign keys are used to retrieve meaningful information instead of showing only numeric IDs.

### Q7 — Duplicate patient records

```sql
SELECT G13_patients.*,
       duplicate_list.duplicate_count

FROM G13_patients

-- The subquery finds repeated combinations of first name,
-- last name and phone number.
JOIN (
    SELECT first_name,
           last_name,
           phone_number,
           COUNT(*) AS duplicate_count
    FROM G13_patients

    -- Treat identical name + phone combinations as one group.
    GROUP BY first_name, last_name, phone_number

    -- Only keep combinations appearing more than once.
    HAVING COUNT(*) > 1
) AS duplicate_list

-- Match the duplicate groups back to the full patient records.
ON G13_patients.first_name = duplicate_list.first_name
AND G13_patients.last_name = duplicate_list.last_name
AND G13_patients.phone_number = duplicate_list.phone_number;
```

The inner query finds the duplicate pattern. The outer query retrieves **all columns** of the affected patient records, as required by the question.

The sample data intentionally contains two `Adwoa Nyarko` records with the same phone number, so Q7 has a duplicate to find.

## 5. Role 6 — Security — `sql/04_security/roles_and_privileges.sql`

```sql
-- Create the three required roles.
CREATE ROLE IF NOT EXISTS
    'G13_admin'@'%',
    'G13_doctor'@'%',
    'G13_receptionist'@'%';
```

`G13_admin` is the administrator role. `G13_doctor` is the doctor role. `G13_receptionist` is the receptionist role. `'%'` means the account can connect from any host, subject to MySQL/network security.

```sql
-- Administrator can do everything in the database.
GRANT ALL PRIVILEGES
ON G13_hospital_db.*
TO 'G13_admin'@'%';
```

```sql
-- Doctors can read, insert and update appointments.
GRANT SELECT, INSERT, UPDATE
ON G13_hospital_db.G13_appointments
TO 'G13_doctor'@'%';

-- Doctors can also read, insert and update treatments.
GRANT SELECT, INSERT, UPDATE
ON G13_hospital_db.G13_treatments
TO 'G13_doctor'@'%';
```

```sql
-- Receptionists can read and create appointments.
GRANT SELECT, INSERT
ON G13_hospital_db.G13_appointments
TO 'G13_receptionist'@'%';

-- Receptionists can read and register patients.
GRANT SELECT, INSERT
ON G13_hospital_db.G13_patients
TO 'G13_receptionist'@'%';
```

`SHOW GRANTS` is then used to verify what each role actually has permission to do.

The repository also creates six doctor login accounts, assigns them the doctor role, and stores a mapping between each MySQL username and `doctor_id`. This mapping is what allows the doctor-specific view to determine which doctor is logged in.

Security warning: the current repository contains example doctor passwords directly in the SQL file. These should **not** be used as real production passwords and should not be committed to a public repository. For the assignment, replace them with safe test credentials or create accounts manually outside the repository.

## 6. Role 7 — Views — `sql/05_views_triggers/views.sql`

### Patient appointments view

```sql
-- Create a simplified view that does not expose phone numbers or emails.
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
```

A **view** is a saved query that behaves like a virtual table. This view intentionally exposes only patient name, appointment date and doctor name, avoiding sensitive contact information.

### Doctor schedule view

```sql
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
WHERE m.mysql_username = SUBSTRING_INDEX(USER(), '@', 1);
```

The important security line is:

```sql
WHERE m.mysql_username = SUBSTRING_INDEX(USER(), '@', 1)
```

`USER()` tells MySQL which account is logged in. `SUBSTRING_INDEX(..., '@', 1)` extracts the username before the `@`. The username is then matched to `G13_doctor_user_map`, which identifies the doctor's `doctor_id`. Therefore, a doctor only receives appointments mapped to that doctor's account.

## 7. Role 7 — Trigger — `sql/05_views_triggers/trigger.sql`

```sql
-- Change the delimiter temporarily because the trigger contains several statements.
DELIMITER //

-- Run this trigger before any appointment row is updated.
CREATE TRIGGER trg_update_appointment_timestamp
BEFORE UPDATE ON G13_appointments
FOR EACH ROW
BEGIN
    -- Replace last_updated with the exact time of the modification.
    SET NEW.last_updated = CURRENT_TIMESTAMP;
END//

-- Return to the normal MySQL delimiter.
DELIMITER ;
```

The trigger automatically records when an appointment row is modified. This is useful for hospital records because staff can tell when an appointment record was last changed.

The later `SELECT` and `UPDATE` statements in the file are tests. They check the value before and after changing an appointment so that the trigger's behaviour can be demonstrated.

## 8. Role 7 — Backup — `sql/06_backup/backup_script.sql`

This file is **PowerShell**, not SQL. Its job is to call MySQL's `mysqldump` utility.

```powershell
# Create a timestamp such as 2026-08-19_10-30-00.
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Build a unique backup filename.
$backupFile = "G13_hospital_db_$timestamp.sql"
```

The script then searches for `mysqldump.exe`. If it cannot find it in the system PATH, it checks common MySQL installation folders.

```powershell
# Perform the full database backup.
& $mysqldump `
    -h viaduct.proxy.rlwy.net `       # MySQL server host.
    -P 58769 `                         # MySQL server port.
    -u root `                          # Database username.
    -p `                               # Ask for the password.
    --single-transaction `             # Consistent backup for transactional tables.
    --routines `                       # Include stored routines.
    --triggers `                       # Include triggers.
    --events `                         # Include scheduled events.
    --databases G13_hospital_db `      # Back up this database.
    --result-file="$backupFile"       # Save the dump to the timestamped file.
```

Finally, `$LASTEXITCODE` is checked. If the command succeeds and the file exists, the script reports success. Otherwise it reports a failure.

## 9. How the whole project fits together

Think of the project in this order:

**Schema → Data → Queries → Security → Views/Trigger → Backup**

1. `create_tables.sql` creates the database structure.
2. `insert_data.sql` puts realistic hospital records into that structure.
3. `queries_q1_q3.sql` and `queries_q4_q7.sql` answer the seven examiner questions.
4. `roles_and_privileges.sql` controls who can access which tables.
5. `views.sql` creates safer, simplified ways to read data.
6. `trigger.sql` automatically updates `last_updated` whenever an appointment is changed.
7. `backup_script.sql` creates a full timestamped database backup.

## 10. Quick SQL vocabulary for the presentation

`SELECT` = retrieve data.

`FROM` = identify the table being queried.

`JOIN` = combine related rows from different tables.

`LEFT JOIN` = keep every row from the left table, even without a match.

`WHERE` = filter rows before grouping.

`GROUP BY` = put similar rows into groups for calculations.

`HAVING` = filter groups after `GROUP BY`.

`COUNT()` = count rows.

`SUM()` = add numeric values.

`AVG()` = calculate an average.

`CONCAT()` = combine text values.

`ORDER BY` = sort the result.

`LIMIT 1` = return only one row.

`PRIMARY KEY` = unique identifier for a table row.

`FOREIGN KEY` = link to a primary key in another table.

`VIEW` = saved query presented like a virtual table.

`TRIGGER` = automatic action caused by an INSERT, UPDATE or DELETE event.

`GRANT` = give database privileges.

`REVOKE` = remove database privileges.

`CURDATE()` = today's date.

`CURRENT_TIMESTAMP` = current date and time.
