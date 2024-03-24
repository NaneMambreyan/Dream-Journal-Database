USE dreamjournal;
#1
DELIMITER //
DROP TRIGGER IF EXISTS check_quality_range //
CREATE TRIGGER check_quality_range
BEFORE INSERT ON sleep_pattern
FOR EACH ROW
BEGIN
    IF NEW.quality > 10 OR NEW.quality < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quality value must be between 0 and 10';
    END IF;
END //
DELIMITER ;
-- INSERT INTO sleep_pattern (quality, sleep_time, wake_up_time, user_id, environment_id)
-- VALUES (11, '22:00:00', '06:00:00', 1, 2);

#2
DELIMITER //
DROP TRIGGER IF EXISTS check_description_length //
CREATE TRIGGER check_description_length
BEFORE INSERT ON dream
FOR EACH ROW
BEGIN
    IF LENGTH(NEW.description) < 4 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Description must be at least 4 characters long.';
    END IF;
END //
DELIMITER ;
-- INSERT INTO dream (date_recorded, description, pattern_id, type_name)
-- VALUES ('2023-05-19', 'ab', 1, 'Thriller');

#3
DELIMITER //
DROP TRIGGER IF EXISTS update_date_recorded//
CREATE TRIGGER update_date_recorded
BEFORE INSERT ON dream
FOR EACH ROW
BEGIN
    IF NEW.date_recorded IS NULL THEN
        SET NEW.date_recorded = CURDATE();
    END IF;
END//
DELIMITER ;

#4
DELIMITER //
DROP TRIGGER IF EXISTS insert_interpretation//
CREATE TRIGGER insert_interpretation
AFTER INSERT ON dream
FOR EACH ROW
BEGIN
    INSERT INTO interpretation (dream_id, interpretation_id, description)
    VALUES (NEW.dream_id, 1, 'No interpretation available.');
END //
DELIMITER ;

INSERT INTO dream(date_recorded,description, pattern_id, type_name)
VALUES (NULL,'My Dream Without Date', 1, 'Nostalgia');
SELECT 
    *
FROM
    dream;
SELECT 
    *
FROM
    interpretation;

#5
DELIMITER //
DROP TRIGGER IF EXISTS delete_dream_character//
CREATE TRIGGER delete_dream_character
AFTER DELETE ON dream
FOR EACH ROW
BEGIN
    DELETE FROM dream_character
    WHERE dream_id = OLD.dream_id;
END//
DELIMITER ;

DELETE FROM dream 
WHERE
    dream_id = 18;
SELECT 
    *
FROM
    dream_character;
