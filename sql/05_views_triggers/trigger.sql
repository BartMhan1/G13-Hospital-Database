DELIMITER //

CREATE TRIGGER trg_update_appointment_timestamp
BEFORE UPDATE ON G13_appointments
FOR EACH ROW
BEGIN
    SET NEW.last_updated = CURRENT_TIMESTAMP;
END//

DELIMITER ;

SELECT appointment_id, status, last_updated
FROM G13_appointments
WHERE appointment_id = 1;

UPDATE G13_appointments
SET status = 'Completed'
WHERE appointment_id = 1;

SELECT appointment_id, status, last_updated
FROM G13_appointments
WHERE appointment_id = 1;

UPDATE G13_appointments
SET status = 'failed'
WHERE appointment_id = 1;

SELECT appointment_id, status, last_updated
FROM G13_appointments
WHERE appointment_id = 1;

UPDATE G13_appointments
SET status = 'Completed'
WHERE appointment_id = 1