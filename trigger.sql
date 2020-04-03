-- Alyssa Jordan (alj81)
-- CS 1555 Term Project
-- trigger.sql (the script to other database objects, e.g., trigger, functions, procedures, etc.)

ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
-- ASSIGN_MEDAL
-- automatically generate derived column values
-- This trigger is responsible to assign the appropriate medal based on the position 
-- when new records are inserted or updated in the SCOREBOARD.

CREATE OR REPLACE TRIGGER ASSIGN_MEDAL
    BEFORE
    INSERT or UPDATE
    ON SCOREBOARD
    FOR EACH ROW
BEGIN
    --:new.medal_id := :new.position;   
    IF :new.position = 1 THEN
        :new.medal_id := 1;
    ELSIF :new.position = 2 THEN
        :new.medal_id := 2;
    ELSIF :new.position = 3 THEN
        :new.medal_id := 3;
    ELSE
        :new.medal_id := null;
    END IF;
END;
/
COMMIT;



-- ATHLETE_DISMISSAL
-- enforce business rules and maintained consistency 
-- This trigger is responsible for deleting all the data of an athlete who was dismissed 
-- because of a violation. If the athlete is a member of a team sport, then the team is 
-- also dismissed by setting the status not eligible (n) in participating in any event. 
-- If the athlete participates in an atomic sport, then the corresponding teams are removed 
-- from the events.
CREATE or REPLACE TRIGGER ATHLETE_DISMISSAL
    BEFORE 
    DELETE
    ON PARTICIPANT
    FOR EACH ROW
DECLARE
    e_id integer;
    t_id integer;
    s_id integer;
    t_size integer;

BEGIN
    SELECT team_id into t_id FROM TEAM_MEMBER where participant_id=:old.participant_id;
    SELECT sport_id into s_id FROM TEAM where team_id=t_id;
    SELECT event_id into e_id FROM SCOREBOARD where participant_id=:old.participant_id and team_id=t_id;
    
    SELECT team_size into t_size FROM SPORT where sport_id=s_id;
    
    DELETE FROM SCOREBOARD WHERE participant_id=:old.participant_id;
    DELETE FROM TEAM_MEMBER where participant_id=:old.participant_id;
    
    IF (t_size = 1) THEN 
        DELETE FROM SCOREBOARD WHERE team_id=t_id; -- delete player and coach from scoreboard
        --DELETE FROM TEAM WHERE team_id=t_id; -- delete entire team Not working yet
    ELSE 
        UPDATE EVENT_PARTICIPATION SET status = 'n' WHERE team_id=t_id;
    END IF;

END;
/


-- ENFORCE_CAPACITY
-- enforce (semantics) integrity constraints
-- This trigger should check the maximum possible venue capacity before the event is associated 
-- with it. In case the capacity is exceeded, an exception should be thrown.
SET SERVEROUTPUT ON;
--DROP MATERIALIZED VIEW EVENTS_AT_VENUE;

CREATE OR REPLACE VIEW EVENTS_AT_VENUE
AS
    SELECT venue_id, event_time, count(*) as v_cap 
    FROM EVENT
    GROUP BY venue_id, event_time
;   

CREATE OR REPLACE TRIGGER ENFORCE_CAPACITY
    BEFORE
    INSERT
    ON EVENT
    FOR EACH ROW
DECLARE
    venue_capacity integer;
    v_capacity integer;
    cur_event integer;
BEGIN
    SELECT count(*) into cur_event FROM EVENT where venue_id=:new.venue_id and event_time=:new.event_time;
    IF(cur_event >= 1) THEN
        SELECT v_cap into v_capacity FROM EVENTS_AT_VENUE where venue_id=:new.venue_id and event_time=:new.event_time;
    ELSE
         v_capacity := 0;
    END IF;
    
    SELECT capacity into venue_capacity FROM VENUE where venue_id=:new.venue_id;
    IF (v_capacity >= venue_capacity) THEN 
        dbms_output.put_line('this venue is full on this date.');
        RAISE_APPLICATION_ERROR( -20001, 
                             'This venue is at max capacity for this event');  
    END IF;
END;
/
COMMIT;



