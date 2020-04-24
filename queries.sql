-- Alyssa Jordan (alj81)
-- CS 1555 Term Project
-- queries.sql (the script to run the SQL queries from JAVA)


-- 1. createUser
INSERT INTO USER_ACCOUNT (user_id, username, passkey, role_id, last_login) VALUES (SEQ_USER_ACCOUNT.NEXTVAL, 'test_user', 'test_pass', 1, sysdate);

-- 2. dropUser
DELETE FROM USER_ACCOUNT WHERE username='c2';

-- 3. createEvent
INSERT INTO EVENT (event_id, sport_id, venue_id, event_time, gender) VALUES (SEQ_EVENT.NEXTVAL, 1, 1, '16-AUG-2008', 'M');

-- 4. addEventOutcome
INSERT INTO SCOREBOARD (olympic_id, event_id, team_id, participant_id, position) VALUES ((SELECT olympic_id FROM OLYMPICS WHERE host_city = 'Athens' and EXTRACT(YEAR FROM opening_date) = '2004'), 1, 61, 70, 7);

-- 5. createTeam
INSERT INTO TEAM (team_id, olympic_id, team_name, country_id, sport_id, coach_id) VALUES (SEQ_TEAM.NEXTVAL, (SELECT olympic_id FROM OLYMPICS WHERE host_city = 'Athens' and EXTRACT(YEAR FROM opening_date) = '2004'), 'test_team', 17, 1, 1);

-- 6. registerTeam
INSERT INTO EVENT_PARTICIPATION (team_id, event_id, status) VALUES (61, 24, 'e');

-- 7. addParticipant
INSERT INTO PARTICIPANT (participant_id, fname, lname, nationality, birth_place, dob) VALUES (SEQ_PARTICIPANT.NEXTVAL, 'test_fname', 'test_lname', 'test_nat', 'test_bp', '01-JAN-1990');

-- 8. addTeamMember
INSERT INTO TEAM_MEMBER (team_id, participant_id) VALUES (1, 70);

-- 9. dropTeamMember
DELETE FROM PARTICIPANT WHERE participant_id=100;

-- 10. login

-- 11. displaySport

-- 12. displayEvent

-- 13. countryRanking

-- 14. topkAthletes

-- 15. connectedAthletes

-- 16. logout

-- 17. exit