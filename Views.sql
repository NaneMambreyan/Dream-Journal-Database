USE dreamjournal;
#1
DROP VIEW IF EXISTS no_supplement;
CREATE VIEW no_supplement AS
    SELECT 
        j.user_id, j.first_name, j.last_name
    FROM
        (SELECT 
            u.user_id,
                u.first_name,
                u.last_name,
                u.email,
                u.address,
                sp.pattern_id
        FROM
            users AS u
        JOIN sleep_pattern AS sp ON u.user_id = sp.user_id) AS j
    WHERE
        j.pattern_id NOT IN (SELECT 
                sp.pattern_id
            FROM
                sleep_pattern sp
                    JOIN
                sleep_supplements ss ON sp.pattern_id = ss.pattern_id);
SELECT 
    *
FROM
    no_supplement;
    
#2
DROP VIEW IF EXISTS supplement_users;
CREATE VIEW supplement_users AS
    SELECT 
        users.user_id,users.first_name,users.last_name, sleep_supplements.supplement_id,supplements.name, supplements.description
    FROM
        sleep_supplements
            JOIN
        sleep_pattern ON sleep_supplements.pattern_id = sleep_pattern.pattern_id
            JOIN
        users ON users.user_id = sleep_pattern.user_id join supplements on supplements.supplement_id=sleep_supplements.supplement_id;
SELECT 
    *
FROM
    supplement_users;
#3
DROP VIEW IF EXISTS scary_dream;
CREATE VIEW scary_dream AS
    SELECT 
        users.user_id, users.first_name, users.last_name
    FROM
        users
            JOIN
        sleep_pattern ON users.user_id = sleep_pattern.user_id
            JOIN
        dream ON dream.pattern_id = sleep_pattern.pattern_id
            JOIN
        dream_emotion de ON dream.dream_id = de.dream_id
    WHERE
        emotion_type = 'fear';
SELECT 
    *
FROM
    scary_dream;
#4
DROP VIEW IF EXISTS most_hours_slept;
CREATE VIEW most_hours_slept AS
    SELECT 
        users.user_id,
        TIMEDIFF('24:00:00',
                TIMEDIFF(sleep_time, wake_up_time)) hours_slpt
    FROM
        users
            JOIN
        sleep_pattern ON users.user_id = sleep_pattern.user_id
    WHERE
        TIMEDIFF('24:00:00',
                TIMEDIFF(sleep_time, wake_up_time)) >= ALL (SELECT 
                TIMEDIFF('24:00:00',
                            TIMEDIFF(sleep_time, wake_up_time))
            FROM
                sleep_pattern);
SELECT 
    *
FROM
    most_hours_slept;
#5
DROP VIEW IF EXISTS characters_users;
CREATE VIEW characters_users AS
    SELECT 
        users.user_id,
        users.first_name,
        users.last_name,
        dream_character.character_id,
        characters.name,
        characters.appearance
    FROM
        characters
            JOIN
        dream_character ON characters.character_id = dream_character.character_id
            JOIN
        dream ON dream.dream_id = dream_character.dream_id
            JOIN
        sleep_pattern ON sleep_pattern.pattern_id = dream.pattern_id
            JOIN
        users ON users.user_id = sleep_pattern.user_id;
SELECT 
    *
FROM
    characters_users;

#6 
DROP VIEW IF EXISTS min_max_temp;
CREATE VIEW min_max_temp AS
    SELECT 
        u.user_id,
        u.first_name,
        u.last_name,
        environment.temperature
    FROM
        users u
            JOIN
        sleep_pattern ON u.user_id = sleep_pattern.user_id
            JOIN
        environment ON sleep_pattern.environment_id = environment.environment_id
    WHERE
        environment.temperature <= ALL (SELECT 
                environment.temperature
            FROM
                environment) 
    UNION SELECT 
        u.user_id,
        u.first_name,
        u.last_name,
        environment.temperature
    FROM
        users u
            JOIN
        sleep_pattern ON u.user_id = sleep_pattern.user_id
            JOIN
        environment ON sleep_pattern.environment_id = environment.environment_id
    WHERE
        environment.temperature >= ALL (SELECT 
                environment.temperature
            FROM
                environment);
SELECT 
    *
FROM
    min_max_temp;

#7
DROP VIEW IF EXISTS user_sleep_info;
CREATE VIEW user_sleep_info AS
    SELECT 
        u.*,
        sp.quality,
        sp.sleep_time,
        sp.wake_up_time,
        dream.date_recorded,
        dream.type_name
    FROM
        users u
            JOIN
        sleep_pattern sp ON u.user_id = sp.user_id
            JOIN
        dream ON sp.pattern_id = dream.pattern_id;
SELECT 
    *
FROM
    user_sleep_info;

#8
DROP VIEW IF EXISTS int_desc;
CREATE VIEW int_desc AS
    SELECT 
        u.user_id, u.first_name, u.last_name, i.description
    FROM
        users u
            JOIN
        sleep_pattern sp ON u.user_id = sp.user_id
            JOIN
        dream d ON d.pattern_id = sp.pattern_id
            JOIN
        interpretation i ON i.dream_id = d.dream_id;
SELECT 
    *
FROM
    int_desc;

#9
DROP VIEW IF EXISTS users_theme;
CREATE VIEW users_theme AS
    SELECT 
        u.first_name, u.last_name, dream_theme.theme_type
    FROM
        users u
            JOIN
        sleep_pattern sp ON u.user_id = sp.user_id
            JOIN
        dream d ON d.pattern_id = sp.pattern_id
            JOIN
        dream_theme ON dream_theme.dream_id = d.dream_id;
SELECT 
    *
FROM
    users_theme;
    
#10
DROP VIEW IF EXISTS thriller_dream ;
CREATE VIEW thriller_dream AS
    SELECT 
        u.first_name, u.last_name
    FROM
        users u
            JOIN
        sleep_pattern sp ON u.user_id = sp.user_id
            JOIN
        dream d ON d.pattern_id = sp.pattern_id
    WHERE
        d.type_name = 'Thriller';
    
SELECT 
    *
FROM
    thriller_dream;