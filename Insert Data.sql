USE dreamjournal;

-- Insert data into users table
INSERT IGNORE INTO users (first_name, last_name, email, address)
VALUES
	('Areg', 'Amirjanyan', 'aregamirjanyan@examole.com', 'Davit Malyan'),
	('Nane', 'Mambreyan', 'nanemambreyan@example.com', 'Moldovakan'),
    ('Mariam', 'Yayloyyan', 'mariamyayloyan@example.com', 'addressline'),
    ('John', 'Doe', 'johndoe@example.com', '123 Main St'),
    ('Jane', 'Smith', 'janesmith@example.com', '456 Elm St'),
    ('Michael', 'Johnson', 'michaeljohnson@example.com', '789 Oak St'),
    ('Sarah', 'Williams', 'sarahwilliams@example.com', '321 Pine St'),
    ('David', 'Brown', 'davidbrown@example.com', '654 Maple St'),
    ('Emily', 'Taylor', 'emilytaylor@example.com', '987 Cedar St'),
    ('James', 'Anderson', 'jamesanderson@example.com', '741 Birch St'),
    ('Jessica', 'Thomas', 'jessicathomas@example.com', '852 Walnut St'),
    ('Matthew', 'Clark', 'matthewclark@example.com', '369 Chestnut St'),
    ('Olivia', 'White', 'oliviawhite@example.com', '963 Spruce St'),
    ('Daniel', 'Hall', 'danielhall@example.com', '159 Fir St'),
    ('Sophia', 'Lee', 'sophialee@example.com', '753 Sycamore St'),
    ('Andrew', 'Lopez', 'andrewlopez@example.com', '258 Ash St'),
    ('Elizabeth', 'Harris', 'elizabethharris@example.com', '852 Pine St'),
    ('William', 'Young', 'williamyoung@example.com', '753 Oak St');
    

-- Insert data into emotion table
INSERT IGNORE INTO emotion (emotion_type)
VALUES
    ('Relaxation'),
    ('Peace'),
    ('Adventure'),
	('Enchantment'),
    ('Adventurous'),
    ('Humor'),
    ('Adrenaline'),
    ('Magic'),
    ('Fear'),
    ('Excitement'),
    ('Futuristic'),
    ('Mystery'),
    ('Wonder'),
    ('Thrill'),
	('Love'),
    ('Anxiety'),
    ('Suspense'),
    ('Intrigue'),
    ('Grateful'),
    ('Awe'),
    ('Connected'),
    ('Joy'),
    ('Stressed'),
    ('Embarrassed'),
    ('Safety'),
    ('Calmness'),
    ('Curosity'),
    ('Cozy'),
    ('Energetic'),
    ('Lonely'),
    ('Ashamed'),
    ('Curiosity'),
    ('Happiness'),
    ('Disappointment'),
    ('Amazement'),
    ('Jealousy'),
    ('Pride'),
    ('Embarrassment'),
    ('Guilt'),
    ('Hope'),
    ('Nostalgia');
    
    
-- Insert data into characters table
INSERT IGNORE INTO characters (name, appearance)
VALUES
	('Meshok Papik', 'scary, with a bag'),
    ('Cat', 'cute, little'),
    ('Mom', 'lovely, caring'),
    ('Mentor', 'Old, wise-looking'),
    ('Villain', 'Scarred face, menacing'),
    ('Sibling', 'Red hair, freckles'),
    ('Pet', 'Golden retriever'),
    ('Detective', 'Trench coat, fedora'),
    ('Sorcerer', 'Robes, staff'),
    ('Artist', 'Messy hair, paint-stained hands'),
    ('Warrior', 'Armor, sword'),
    ('Explorer', 'Hat, backpack'),
    ('Scientist', 'Lab coat, glasses'),
    ('Musician', 'Guitar, charismatic'),
    ('Athlete', 'Muscular build, sports attire'),
    ('Chef', 'Apron, chef hat'),
    ('Actor', 'Dramatic, expressive'),
    ('Boss', 'Suit, authoritative'),
    ('Boyfirend', 'handsome'),
    ('Flying cars', 'new, strange'),
    ('Smiling clouds', 'white, soft, appealing'),
    ('Dolphin', 'kind'),
    ('Dinosaurs', 'horrifying, gigantic'),
    ('Magician', 'had a magical stick'),
    ('Ghost', 'scary'),
    ('Palm tree', 'strange, unusual, pink'),
    ('Mumia', 'dead human whose soft tissues and organs were preserved');


-- Insert data into type table
INSERT IGNORE INTO type (type_name)
VALUES
	('Nightmare'),
    ('Lucid Dream'),
    ('Recurring Dream'),
    ('Fantasy'),
    ('Adventure'),
    ('Romantic'),
    ('Comedy'),
    ('Sci-Fi'),
    ('Historical'),
    ('Nostalgia'),
    ('Action'),
    ('Horror'),
    ('Relaxation'),
    ('Thriller');
    
    
-- Insert data into environment table
INSERT IGNORE INTO environment (temperature, noise_level, lighting)
VALUES
	(20, 0, 1),
    (-3, 3, 3),
    (-5, 1, 4),
    (16, 5, 8),
    (30, 2, 4),
    (42, 3, 5),
    (-7, 4, 4),
    (3, 4, 5),
    (27, 2, 3),
    (19, 1, 4),
    (21, 3, 2),
    (-7, 4, 4),
    (3, 4, 5),
    (24, 4, 1),
    (19, 1, 4),
    (21, 3, 2),
    (24, 4, 1),
    (22, 2, 3);
    
    
-- Insert data into theme table
INSERT IGNORE INTO theme (theme_type)
VALUES
	('Romantic'),
	('War'),
    ('Friendship'),
    ('Success'),
    ('Nature'),
    ('Super Power'),
    ('Chasing'),
    ('Exams'),
    ('Conflict'),
    ('Transformation'),
    ('Dreams'),
    ('Time'),
    ('Identity'),
    ('Power'),
    ('Family');
    
    

-- Insert data into sleep_pattern table
INSERT IGNORE INTO sleep_pattern (quality, sleep_time, wake_up_time, user_id, environment_id)
VALUES
    (8, '23:00:00', '07:00:00', 1, 1),
    (7, '22:30:00', '06:30:00', 2, 2),
    (6, '23:45:00', '07:30:00', 3, 3),
    (9, '22:00:00', '06:00:00', 4, 4),
    (8, '23:30:00', '07:30:00', 5, 5),
    (7, '23:15:00', '07:15:00', 6, 6),
    (6, '23:30:00', '07:30:00', 7, 7),
    (9, '22:30:00', '06:30:00', 8, 8),
    (8, '23:45:00', '07:00:00', 9, 9),
    (7, '22:45:00', '06:45:00', 10, 10),
    (6, '23:15:00', '07:15:00', 11, 11),
    (9, '22:15:00', '06:15:00', 12, 12),
    (8, '23:30:00', '07:30:00', 13, 13),
    (7, '23:00:00', '07:00:00', 14, 14),
    (6, '23:45:00', '07:30:00', 15, 15),
    (9, '22:30:00', '06:30:00', 16, 16),
    (8, '23:30:00', '07:30:00', 17, 17),
    (7, '23:15:00', '07:15:00', 18, 18);

-- Insert data into dream table
INSERT IGNORE INTO dream (date_recorded, description, pattern_id, type_name)
VALUES
	('2023-05-02', 'I saw Meshok Papik who was chasing me', 1, 'Nightmare'),
    ('2023-05-02', 'I was having a conversation with a talking cat.', 2, 'Adventure'),
    ('2023-05-03', 'I was reliving a childhood memory with my mom at the beach.', 3, 'Nostalgia'),
    ('2023-05-04', 'I was solving a complex puzzle in a mysterious room which felt like my exams.', 4, 'Thriller'),
    ('2023-05-05', 'I was attending a grand masquerade ball with my boyfriend.', 5, 'Romantic'),
    ('2023-05-06', 'I was exploring an ancient temple and discovering hidden treasures.', 6, 'Adventure'),
    ('2023-05-07', 'I was performing on stage in front of a large audience.', 7, 'Comedy'),
    ('2023-05-08', 'I was on a space mission, exploring distant galaxies.', 8, 'Sci-Fi'),
    ('2023-05-09', 'I was a detective solving a mysterious murder case.', 9, 'Thriller'),
    ('2023-05-10', 'I was in a futuristic city, surrounded by advanced technology.', 10, 'Sci-Fi'),
	('2023-05-01', 'I was flying in the sky and exploring new lands.', 11, 'Fantasy'),
    ('2023-05-12', 'I was time-traveling to different historical eras.', 12, 'Historical'),
    ('2023-05-13', 'I was participating in a thrilling car race.', 13, 'Action'),
    ('2023-05-14', 'I was attending a magical wizarding school.', 14, 'Fantasy'),
    ('2023-05-15', 'I was exploring a haunted mansion filled with ghosts.', 15, 'Horror'),
    ('2023-05-16', 'I was on a tropical island, relaxing under palm trees.', 16, 'Relaxation'),
    ('2023-05-17', 'I was solving a complex mystery in an ancient Egyptian pyramid.', 17, 'Adventure'),
	('2023-05-11', 'I was swimming with dolphins in crystal clear waters.', 18, 'Adventure');


-- Insert data into dream_emotion table
INSERT IGNORE INTO dream_emotion (dream_id, emotion_type)
VALUES
    (1, 'Fear'),
    (1, 'Anxiety'),
    (2, 'Curiosity'),
    (2, 'Excitement'),
    (3, 'Happiness'),
    (3, 'Nostalgia'),
    (4, 'Suspense'),
    (4, 'Intrigue'),
    (5, 'Love'),
    (5, 'Enchantment'),
    (6, 'Adventurous'),
    (6, 'Thrill'),
    (7, 'Humor'),
    (7, 'Happiness'),
    (8, 'Wonder'),
    (8, 'Amazement'),
    (9, 'Mystery'),
    (9, 'Suspense'),
    (10, 'Futuristic'),
    (10, 'Excitement'),
    (11, 'Curiosity'),
    (11, 'Wonder'),
    (12, 'Curiosity'),
    (13, 'Excitement'),
    (13, 'Adrenaline'),
    (14, 'Magic'),
    (14, 'Wonder'),
    (15, 'Fear'),
    (15, 'Suspense'),
    (16, 'Relaxation'),
    (16, 'Peace'),
    (17, 'Adventure'),
    (17, 'Mystery'),
    (18, 'Adventure'),
    (18, 'Joy');
    


-- Insert data into dream_character table
INSERT IGNORE INTO dream_character (character_id, dream_id)
VALUES
	(1,1),
	(2,2),
	(3,3),
	(4,4),
	(19, 5),
	(12, 6),
	(14, 7),
	(13, 8),
	(8, 9),
	(20,10),
    (21,11),
    (23,12),
    (15,13),
    (24,14),
    (25,15),
    (26,16),
    (27,17),
    (22,18);

-- Insert data into dream_theme table
INSERT IGNORE INTO dream_theme ( theme_type, dream_id)
VALUES
	('Chasing',1),
	('Nature',2),
	('Family',3),
	('Exams',4),
	('Romantic',5),
	('Time',6),
	('Success',7),
    ('Dreams',7),
    ('Dreams',8),
	('Power',9),
	('Time',10),
	('Super Power',11),
	('Dreams',11),
	('Time',12),
	('Super Power',12),
	('Success',13),
	('Super Power',14),
	('Chasing',15),
	('Nature',16),
	('Success',17),
	('Time',17),
	('Nature',18);
    

 -- Insert data into interpretation table
INSERT IGNORE INTO interpretation (dream_id, interpretation_id, description)
VALUES
	(1, 1, 'This dream could indicate typical childhood trauma from kindergarten'),
    (1, 2, 'This dream could indicate feelings of being pursued or threatened by someone or something in your waking life. It may symbolize unresolved fears, anxieties, or stressors that are causing distress.'),
	(2, 1, 'This dream suggests a sense of curiosity and exploration. It could symbolize the desire for new experiences or the need to tap into your imaginative and playful side. The talking cat may represent wisdom or the need to trust your intuition.'),
	(3, 1, 'This dream reflects a longing for the past and a desire to reconnect with positive memories and experiences. It may signify a need for comfort, security, or a desire to revisit a time of innocence and joy.'),
	(4, 1, ' This dream reflects challenges, problem-solving, and a sense of pressure. It could symbolize a situation in your waking life where you feel tested or overwhelmed. It suggests the need to approach challenges with determination and resourcefulness.'),
    (4,2,'This means you will not fail your exams'),
	(5, 1, 'This dream represents romance, celebration, and social connections. It may symbolize your desire for romance, excitement, and enjoying special moments with a loved one. It could also signify a desire for more fun and excitement in your relationships.'),
	(6, 1, 'This dream indicates a thirst for discovery, knowledge, or personal growth. It suggests a willingness to explore new aspects of yourself or your surroundings. The hidden treasures symbolize untapped potentials or valuable insights that you may uncover on your journey.'),
	(7, 1, ' This dream reflects self-expression, confidence, and a desire for recognition. It suggests a need to showcase your talents or ideas. It could also signify a desire for attention or validation from others.'),
	(8, 1, 'This dream represents a sense of wonder, adventure, and exploration of the unknown. It may symbolize your aspirations, desire for personal growth, or a need to break free from limitations. Exploring distant galaxies could represent expanding your horizons and seeking new possibilities.'),
	(9, 1, 'This dream indicates your analytical and problem-solving abilities. It suggests that you have a strong sense of curiosity and a desire to uncover hidden truths. It may also reflect your interest in mysteries and your willingness to dig deep to find answers in your waking life.'),
	(10, 1, 'This dream reflects your fascination with technology and the possibilities of the future. It signifies a forward-thinking mindset and a desire to explore new advancements. It may also suggest your adaptability and openness to change in various aspects of your life.'),
	(11, 1, 'This dream symbolizes a sense of freedom, adventure, and exploration. It represents your desire for new experiences, personal growth, and the ability to rise above challenges. It may also indicate a need to broaden your horizons and embrace opportunities for growth and self-discovery.'),
	(12, 1, 'This dream signifies your fascination with history and the desire to learn from the past. It suggests an interest in different time periods and an appreciation for the lessons and experiences of those who came before you. It may also reflect your longing for a deeper connection to your roots or a specific historical era.'),
	(13, 1, 'This dream represents your competitive nature, ambition, and desire for excitement. It signifies your drive to achieve your goals and overcome challenges. It may also reflect your need for speed and a willingness to take risks in order to succeed in various areas of your life.'),
	(14, 1, ' This dream reflects your imagination, creativity, and a desire for magical experiences. It signifies a longing for a sense of wonder, adventure, and the pursuit of knowledge. It may also symbolize your own unique talents and abilities that you wish to further develop and express.'),
	(15, 1, ' This dream represents your subconscious fears, unresolved emotions, or past experiences that still haunt you. It may indicate the need to confront and overcome your fears or to explore hidden aspects of yourself. It can also serve as a reminder to release any lingering negative energies or attachments from the past.'),
	(16, 1, 'This dream signifies your desire for tranquility, peace, and relaxation. It reflects your need to take a break from the stresses of daily life and find inner calmness. It may suggest the importance'),
	(17, 1, 'This dream represents your problem-solving skills, curiosity, and a thirst for adventure. It suggests that you enjoy tackling challenging situations and exploring the unknown. It may also symbolize a desire for self-discovery and a quest for hidden truths in your waking life.'),
	(18, 1, 'This dream signifies a sense of joy, playfulness, and connection with nature. It symbolizes harmony, freedom, and a sense of being in tune with your emotions. It may also indicate a desire for exploration and a need to embrace moments of joy and spontaneity in your waking life.');

-- Insert data into supplements table
INSERT IGNORE INTO supplements (name, description)
VALUES
	('Melatonin', 'A hormone that helps regulate sleep-wake cycles.'),
    ('Valerian Root', 'A herbal supplement commonly used for promoting relaxation and improving sleep quality.'),
    ('5-HTP', 'A precursor to serotonin, often used to support mood and promote healthy sleep patterns.'),
    ('Magnesium', 'A mineral that may help improve sleep quality and reduce insomnia symptoms.'),
    ('L-Theanine', 'An amino acid found in tea leaves that is known for its calming effects and potential sleep benefits.'),
    ('Ginkgo Biloba', 'An herbal extract believed to support cognitive function and enhance mental alertness.'),
    ('Chamomile', 'A popular herb often consumed as a tea to promote relaxation and reduce anxiety.'),
    ('Passionflower', 'A plant known for its sedative properties, often used to alleviate sleep problems.'),
    ('Ashwagandha', 'An adaptogenic herb used in traditional Ayurvedic medicine to help reduce stress and improve sleep.'),
    ('Vitamin B6', 'A vitamin involved in the production of serotonin and melatonin, important for regulating sleep.'),
    ('Zinc', 'A mineral that plays a role in the regulation of sleep and the maintenance of a healthy sleep pattern.');

-- Insert data into sleep_supplements table
INSERT IGNORE INTO sleep_supplements (pattern_id, supplement_id)
VALUES
	(1,1),
	(2,5),
    (2,7),
	(3,11),
    (4,3),
    (6,6),
    (8,11);


-- select * from users;
-- select * from emotion
-- order by emotion_type asc;
-- select * from characters;
-- select * from theme;
-- select * from type;
-- select * from environment;
-- select * from sleep_pattern;
-- select dream_id, description from dream;
-- select * from dream_emotion;
-- select * from dream_theme;
-- select * from interpretation;
-- select * from supplements;
-- select * from sleep_supplements;
-- drop database dreamjournal;
