USE dreamjournal;
#1
DROP ROLE IF EXISTS administrator;
CREATE ROLE administrator;
GRANT ALL PRIVILEGES ON dreamjournal.* TO administrator;

#2
DROP ROLE IF EXISTS editor;
CREATE ROLE editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON dreamjournal.emotion TO editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON dreamjournal.theme TO editor;
GRANT SELECT, INSERT, UPDATE, DELETE ON dreamjournal.type TO editor;
GRANT SELECT(interpretation_id,description), INSERT(interpretation_id,description), UPDATE(interpretation_id,description), DELETE on dreamjournal.interpretation TO editor;

#3
DROP ROLE IF EXISTS user;
CREATE ROLE user;
GRANT select on dreamjournal.characters to user;
GRANT select on dreamjournal.dream to user;
GRANT select on dreamjournal.emotion to user;
GRANT select on dreamjournal.interpretation to user;
GRANT select on dreamjournal.supplements to user;
GRANT select (pattern_id,quality,sleep_time,wake_up_time,environment_id) on dreamjournal.sleep_pattern to user;
GRANT select on dreamjournal.theme to user;
GRANT select on dreamjournal.type to user;
grant insert on dreamjournal.sleep_pattern to user;
grant insert on dreamjournal.dream to user;
grant insert on dreamjournal.emotion to user;
grant insert on dreamjournal.supplements to user;
grant insert on dreamjournal.theme to user;
grant insert on dreamjournal.type to user;

#4
DROP ROLE IF EXISTS viewer;
CREATE ROLE viewer;
grant select on dreamjournal.* to viewer;

#5
DROP ROLE IF EXISTS dream_analyst;
CREATE ROLE dream_analyst;
GRANT select on dreamjournal.* to dream_analyst;
GRANT CREATE ON dreamjournal.* TO dream_analyst;

