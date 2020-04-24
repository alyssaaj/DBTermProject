-- Alyssa Jordan (alj81)
-- CS 1555 Term Project
-- queries.sql (the script to run the SQL queries from JAVA)


-- 1. createUser
INSERT INTO USER_ACCOUNT (user_id, username, passkey, role_id, last_login) VALUES (SEQ_USER_ACCOUNT.NEXTVAL, 'test_user', 'test_pass', 1, sysdate);

-- 2. dropUser
DELETE FROM USER_ACCOUNT WHERE username='test_delete';

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

SET SERVEROUTPUT ON;
-- 10. login
DECLARE 
    CURSOR cLogin IS SELECT * FROM user_account WHERE username='c1' AND passkey='pass';
    rowLogin cLogin%ROWTYPE;
BEGIN
    OPEN cLogin;
    LOOP 
        FETCH cLogin into rowLogin;
        DBMS_OUTPUT.PUT_LINE(rowLogin.user_id || ' ' || rowLogin.username || ' ' || rowLogin.passkey || ' ' || rowLogin.role_id || ' ' || rowLogin.last_login);
        EXIT WHEN cLogin%NOTFOUND;
    END LOOP;
    
    CLOSE cLogin;
END;

-- 11. displaySport
--DECLARE 
--    CURSOR cDS IS SELECT sport_name, sport_id, EXTRACT(YEAR FROM dob) as ydob FROM SPORT WHERE sport_name='Volleyball';
--    rDS cDS%ROWTYPE;
--BEGIN
--    OPEN cDS;
--    LOOP 
--        FETCH cDS into rDS;
--        DBMS_OUTPUT.PUT_LINE(rDS.sport_name);
--        DBMS_OUTPUT.PUT_LINE(rDS.ydob);
--        DECLARE
--            CURSOR cDS2 IS SELECT event_id, gender FROM EVENT WHERE sport_id=rDS.sport_id;
--            rDS2 cDS2%ROWTYPE;
--            BEGIN
--                OPEN cDS2;
--                LOOP 
--                    FETCH cDS2 into rDS2;
--                    DBMS_OUTPUT.PUT_LINE(rDS2.event_id);
--                    DBMS_OUTPUT.PUT_LINE(rDS2.gender);
--                    DECLARE
--                        CURSOR cDS3 IS SELECT p.fname, p.lname, m.medal_title, c.country FROM SCOREBOARD s Join TEAM t on s.team_id=t.team_id JOIN COUNTRY c on t.country_id=c.country_id JOIN PARTICIPANT p on s.participant_id=p.participant_id JOIN MEDAL m on s.medal_id = m.medal_id WHERE s.event_id=rDS2.event_id ORDER BY s.olympic_id asc, s.medal_id asc;
--                        rDS3 cDS3%ROWTYPE;
--                        BEGIN
--                            OPEN cDS3;
--                            LOOP
--                                FETCH cDS3 into rDS3;
--                                DBMS_OUTPUT.PUT_LINE(rDS3.fname || ' ' || rDS3.lname || ' ' || rDS3.country);
--                                EXIT WHEN cDS3%NOTFOUND;
--                            END LOOP;
--                        CLOSE cDS3;
--                    END;
--                    EXIT WHEN cDS2%NOTFOUND;
--                END LOOP;
--            CLOSE cDS2;
--        END;
--        EXIT WHEN CDS%NOTFOUND;
--    END LOOP;
--CLOSE cDS;
--END;
        


-- 12. displayEvent

-- 13. countryRanking

-- 14. topkAthletes


-- 16. logout
-- N/A: No sql query 

-- 17. exit
-- N/A: No sql query