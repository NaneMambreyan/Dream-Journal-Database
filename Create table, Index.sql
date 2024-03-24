-- DROP DATABASE IF EXISTS dreamjournal;
CREATE DATABASE  IF NOT EXISTS dreamjournal;
USE dreamjournal;
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    address VARCHAR(50),
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS emotion (
    emotion_type VARCHAR(50),
    PRIMARY KEY (emotion_type)
);

CREATE TABLE IF NOT EXISTS characters (
    character_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    appearance VARCHAR(250),
    PRIMARY KEY (character_id)
);

CREATE TABLE IF NOT EXISTS type (
    type_name VARCHAR(50),
    PRIMARY KEY (type_name)
);

CREATE TABLE IF NOT EXISTS environment (
    environment_id INT AUTO_INCREMENT,
    temperature INT NOT NULL,
    noise_level INT NOT NULL,
    lighting INT NOT NULL,
    PRIMARY KEY (environment_id)
);

CREATE TABLE IF NOT EXISTS sleep_pattern (
    pattern_id INT AUTO_INCREMENT,
    quality INT NOT NULL,
    sleep_time TIME NOT NULL,
    wake_up_time TIME NOT NULL,
    user_id INT NOT NULL,
    environment_id INT NOT NULL,
    PRIMARY KEY (pattern_id),
    FOREIGN KEY (user_id)
        REFERENCES users (user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (environment_id)
        REFERENCES environment (environment_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS dream (
    dream_id INT AUTO_INCREMENT,
    date_recorded DATE NOT NULL,
    description VARCHAR(250),
    pattern_id INT NOT NULL,
    type_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dream_id),
    FOREIGN KEY (pattern_id)
        REFERENCES sleep_pattern (pattern_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (type_name)
        REFERENCES type (type_name)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS dream_emotion (
    dream_id INT NOT NULL,
    emotion_type VARCHAR(50) NOT NULL,
    FOREIGN KEY (dream_id)
        REFERENCES dream (dream_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (emotion_type)
        REFERENCES emotion (emotion_type)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (dream_id , emotion_type)
);

CREATE TABLE IF NOT EXISTS dream_character (
    character_id INT NOT NULL,
    dream_id INT NOT NULL,
    FOREIGN KEY (character_id)
        REFERENCES characters (character_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (dream_id)
        REFERENCES dream (dream_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (character_id , dream_id)
);

CREATE TABLE IF NOT EXISTS theme (
    theme_type VARCHAR(50),
    PRIMARY KEY (theme_type)
);

CREATE TABLE IF NOT EXISTS dream_theme (
    theme_type VARCHAR(50) NOT NULL,
    dream_id INT NOT NULL,
    FOREIGN KEY (theme_type)
        REFERENCES theme (theme_type)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (dream_id)
        REFERENCES dream (dream_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (theme_type , dream_id)
);

CREATE TABLE IF NOT EXISTS interpretation (
    dream_id INT NOT NULL,
    interpretation_id INT NOT NULL,
    description VARCHAR(500) NOT NULL,
    FOREIGN KEY (dream_id)
        REFERENCES dream (dream_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (interpretation_id , dream_id)
);

CREATE TABLE IF NOT EXISTS supplements (
    supplement_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(250),
    PRIMARY KEY (supplement_id)
);

CREATE TABLE IF NOT EXISTS sleep_supplements (
    pattern_id INT NOT NULL,
    supplement_id INT NOT NULL,
    FOREIGN KEY (pattern_id)
        REFERENCES sleep_pattern (pattern_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (supplement_id)
        REFERENCES supplements (supplement_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (pattern_id , supplement_id)
);





-- Indexing

CREATE INDEX name_idx ON users (last_name, first_name);
SHOW INDEX FROM users;

CREATE INDEX temp_idx ON environment (temperature);
SHOW INDEX FROM environment;

CREATE INDEX name_idx ON supplements (name);
SHOW INDEX FROM supplements;

CREATE INDEX date_idx ON dream (date_recorded);
CREATE INDEX pattern_idx ON dream (pattern_id);
SHOW INDEX FROM dream;

CREATE INDEX dream_idx ON interpretation (dream_id);
SHOW INDEX FROM interpretation;

CREATE INDEX id_type_idx ON dream_theme (dream_id,theme_type);
SHOW INDEX FROM dream_theme;

CREATE INDEX id_emotion_idx ON dream_emotion (dream_id,emotion_type);
SHOW INDEX FROM dream_emotion;

CREATE INDEX name_idx ON characters (name);
SHOW INDEX FROM characters;
