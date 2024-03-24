USE dreamjournal;

-- 1) Retrieve all users whose first name starts with "J"
Select *
From users 
Where first_name LIKE 'J%';


-- 2) Retrieve sleep pattern quality with their respective user name, surname with a quality score between 8 and 10:
Select sp.quality, u.first_name, u.last_name
From sleep_pattern sp, users u
Where sp.user_id = u.user_id AND sp.quality Between 8 And 10;


-- 3) retrieve the average sleep quality for users whose average sleep quality is above 6
Select user_id, AVG(quality) as avg_sleep_quality
From sleep_pattern
Group by user_id
Having AVG(quality) > 6;



-- 4) Retrieve the count of dreams for each user:
Select u.user_id, u.first_name, u.last_name, COUNT(d.dream_id) AS dream_count
From users u
left join sleep_pattern sp ON u.user_id = sp.user_id
left join dream d ON sp.pattern_id = d.pattern_id
group by u.user_id, u.first_name, u.last_name;



-- 5) retrieve users who have a sleep after 23.30 using IN
Select u.user_id, u.first_name, u.last_name
From users u
Where u.user_id IN (
  Select sp.user_id
  From sleep_pattern sp
  Where sp.sleep_time >= '23:30'
)
Order by u.user_id ASC;


-- 6) retrieve the users who have not used any supplement using join
Select u.*
From users u
Left Join sleep_supplements ss ON u.user_id = ss.pattern_id
Where ss.pattern_id Is NULL;



-- 7) retrieve the users who have not used any supplement using NOT EXISTS
Select u.*
From users u
Where NOT EXISTS (
  Select *
  From sleep_supplements ss
  Where ss.pattern_id = u.user_id
);


-- 8) Retrieve dreams that have not been associated with any emotions:
Select *
From dream d
Where NOT EXISTS (
  Select *
  From dream_emotion de
  Where de.dream_id = d.dream_id
);



-- 9) retrieve dreams that do not have any associated theme type
Select d.*
From dream d
Left Join dream_theme dt On d.dream_id = dt.dream_id
Where dt.theme_type is Null;


-- 10) Retrieve dreams with emotions that have not been categorized under any theme:
Select d.*
From dream d
Left Join dream_theme dt ON d.dream_id = dt.dream_id
Where d.dream_id NOT IN (
						Select dream_id 
                        From dream_emotion)
  And dt.theme_type Is Null;



-- 11) retrieve the top 5 users with the highest sleep quality
SELECT u.user_id, u.first_name, u.last_name, sp.quality
FROM users u, sleep_pattern sp
Where u.user_id = sp.user_id
ORDER BY sp.quality DESC
LIMIT 5;




