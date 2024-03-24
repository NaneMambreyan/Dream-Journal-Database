USE dreamjournal;

-- 1) slept_hours()
-- SET GLOBAL log_bin_trust_function_creators = 1;
DROP FUNCTION IF EXISTS slept_hours;
DELIMITER //
CREATE FUNCTION slept_hours (sleepTime TIME, wakeUpTime TIME) 
RETURNS DECIMAL(5,2) -- precision 2 decimal places, overall 5 digits 455.55
BEGIN
    DECLARE hours DECIMAL(5,2);
    SET hours = ABS(TIME_TO_SEC(TIMEDIFF(wakeUpTime, sleepTime))) / 3600;
    
    RETURN hours;
END //
DELIMITER ;

SELECT slept_hours(sleep_time, wake_up_time) 
AS hours_slept 
FROM sleep_pattern;


-- 2) Given the dream_id get all its interpretations
DROP PROCEDURE IF EXISTS DreamInterpretations;
DELIMITER //
CREATE PROCEDURE DreamInterpretations(dreamId INT)
BEGIN
    SELECT interpretation_id, description
    FROM interpretation
    WHERE dream_id = dreamId;
END //
DELIMITER ;

CALL DreamInterpretations(1);
CALL DreamInterpretations(4);
CALL DreamInterpretations(5);


-- 3) Get the most popular dream theme of the given month 
DROP FUNCTION IF EXISTS MostFrequentThemeOfMonth;
DELIMITER //
CREATE FUNCTION MostFrequentThemeOfMonth(monthNum INT)
RETURNS VARCHAR(50)
BEGIN
    DECLARE mostFrequentTheme VARCHAR(50);
    SELECT theme_type
    INTO mostFrequentTheme
    FROM (        
        SELECT MONTHNAME(d.date_recorded), dt.theme_type, count(*) theme_count_per_month
		FROM dream d, dream_theme dt 
		WHERE d.dream_id = dt.dream_id AND MONTH(d.date_recorded) = monthNum
		GROUP BY d.date_recorded, dt.theme_type 
		ORDER BY count(*) DESC
        LIMIT 1
        ) AS subquery; 
    RETURN mostFrequentTheme;
END //
DELIMITER ;

SELECT MostFrequentThemeOfMonth(5); 


-- 4) We want to know how the noise level affects THE user's sleeping time). Given the noise level find avergae sleeping time of THE user (user id is also given)
DROP FUNCTION IF EXISTS AverageSleepTime;
DELIMITER //

CREATE FUNCTION AverageSleepTime(userID INT, noiseLVL INT)
RETURNS INT
BEGIN
	DECLARE avg_time INT;
	SELECT result 
    INTO avg_time
    FROM
		(
        SELECT AVG(ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time))) / 3600) as result
		FROM sleep_pattern s, environment e
		WHERE s.environment_id = e.environment_id
			  AND  (s.user_id, e.noise_level) = (userID, noiseLVL)
		) AS subquery;
        
	RETURN avg_time;
END //
DELIMITER ;			
    
SELECT AverageSleepTime(4, 5); 


-- 5) What emotions do people experience during certain type of dream (dream type is given)
DROP PROCEDURE IF EXISTS TypeAssociatedEmotions;
DELIMITER //
CREATE PROCEDURE TypeAssociatedEmotions(dreamType VARCHAR(50))
BEGIN
        SELECT DISTINCT emotion_type 
        FROM dream d, dream_emotion de
		WHERE (d.dream_id, d.type_name) = (de.dream_id, dreamType);
END //
DELIMITER ;

CALL TypeAssociatedEmotions('Adventure');




-- 6) For a certain user what is the probability of having some dream during sleep pattern (dreams/sleep_patterns)

INSERT IGNORE INTO sleep_pattern (quality, sleep_time, wake_up_time, user_id, environment_id)
VALUES
	(8, '23:00:00', '07:00:00', 1, 1);

DROP FUNCTION IF EXISTS DreamProb;
DELIMITER //
CREATE FUNCTION DreamProb(userID INT)
RETURNS DECIMAL(3, 2)
BEGIN
	DECLARE dream_prob DECIMAL(3, 2);
	SELECT * 
    INTO dream_prob
    FROM
		(
		 with required_info(pattern_id, dream_id) as
			(select s.pattern_id, dream_id
			 from sleep_pattern s left join dream d
			 on s.pattern_id = d.pattern_id
			 where user_id = userID)
		select ((select count(*) from required_info where dream_id is not null) / count(*))  as dreamProb
 		from required_info
		) AS subquery;
        
	RETURN dream_prob;
END //
DELIMITER ;	

SELECT DreamProb(1);
SELECT DreamProb(3);

        
-- 6) Change THE users' addresses to the provided value if it is null.
INSERT INTO users (user_id, first_name, last_name, email)
VALUES
    (777, 'Artak', 'Beyleryan', 'artakbeyleryan@example.com');
    
DROP FUNCTION IF EXISTS setAddress;
DELIMITER //

CREATE FUNCTION setAddress(userID INT, addressLine VARCHAR(50))
RETURNS BOOL
BEGIN
    DECLARE updated BOOL;
    
    SET updated = FALSE;
    
    UPDATE users
    SET address = CASE
        WHEN address IS NULL THEN addressLine
        ELSE address
    END
    WHERE user_id = userID AND address IS NULL;
    
    IF ROW_COUNT() > 0 THEN
        SET updated = TRUE;
    END IF;
    
    RETURN updated;
END //
DELIMITER ;

SELECT setAddress(1, 'aaa');
SELECT setAddress(777, 'aaa');
SELECT * FROM users WHERE user_id = 777;

DELETE FROM users
WHERE email = 'artakbeyleryan@example.com';


-- 7) Having the user_id get all their info
DROP PROCEDURE IF EXISTS GetUserByID;
DELIMITER //
CREATE PROCEDURE GetUserByID(userID INT)
BEGIN
        SELECT u.user_id, 
			   u.first_name, 
               u.last_name, 
               u.email, 
               u.address,
               sp.pattern_id AS sleep_pattern_id, 
               sp.quality, 
               sp.sleep_time, 
               sp.wake_up_time,
               d.dream_id, 
               d.date_recorded, 
               d.description, 
               d.type_name
        FROM users u
        LEFT JOIN sleep_pattern sp USING(user_id)
        LEFT JOIN dream d USING(pattern_id)
        WHERE u.user_id = userID;
END //
DELIMITER ;


CALL GetUserByID(1);


-- 8) Get info about the most sleepy user
DROP PROCEDURE IF EXISTS GetTheSleepy;
DELIMITER //

CREATE PROCEDURE GetTheSleepy()
BEGIN
        SELECT u.user_id, 
			   u.first_name, 
               u.last_name, 
               u.email, 
               u.address, 
               COUNT(sp.pattern_id) AS sleep_pattern_count
        FROM users u
        LEFT JOIN sleep_pattern sp USING(user_id)
        GROUP BY u.user_id
        ORDER BY sleep_pattern_count DESC
        LIMIT 1;
END //
DELIMITER ;

call GetTheSleepy();





-- 9) Find the user with max slept hours with all()
DROP PROCEDURE IF EXISTS GetMaxHourSleeper;
DELIMITER //

CREATE PROCEDURE GetMaxHourSleeper()
BEGIN
        SELECT u.user_id, 
			   first_name, 
               ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time)))/3600 hours_slept
		FROM sleep_pattern JOIN users u USING(user_id)
		WHERE ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time))) >= ALL (SELECT ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time)))
																		   FROM sleep_pattern);
END //
DELIMITER ;

call GetMaxHourSleeper();



-- 10) Find top 3 user according to slept hours with some()
DROP PROCEDURE IF EXISTS Top3Sleepers;
DELIMITER //

CREATE PROCEDURE Top3Sleepers()
BEGIN
        SELECT u.user_id, 
			   first_name, 
               ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time)))/3600 hours_slept
		FROM sleep_pattern JOIN users u USING(user_id)
		WHERE ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time))) >= SOME (SELECT ABS(TIME_TO_SEC(TIMEDIFF(wake_up_time, sleep_time))) FROM sleep_pattern)
		ORDER BY hours_slept desc
        LIMIT 3;
END //
DELIMITER ;

CALL Top3Sleepers();

