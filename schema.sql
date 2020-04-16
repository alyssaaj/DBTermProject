-- Alyssa Jordan (alj81)
-- CS 1555 Term Project
-- schema.sql (the script to create the tables)

-- Here, you should include all the create statements and the constraints 
-- (e.g., primary keys, foreign keys, check constraints).

DROP TABLE USER_ACCOUNT CASCADE CONSTRAINTS;
DROP TABLE USER_ROLE CASCADE CONSTRAINTS;
DROP TABLE OLYMPICS CASCADE CONSTRAINTS;
DROP TABLE SPORT CASCADE CONSTRAINTS;
DROP TABLE PARTICIPANT CASCADE CONSTRAINTS;
DROP TABLE COUNTRY CASCADE CONSTRAINTS;
DROP TABLE TEAM CASCADE CONSTRAINTS;
DROP TABLE TEAM_MEMBER CASCADE CONSTRAINTS;
DROP TABLE MEDAL CASCADE CONSTRAINTS;
DROP TABLE SCOREBOARD CASCADE CONSTRAINTS;
DROP TABLE VENUE CASCADE CONSTRAINTS;
DROP TABLE EVENT CASCADE CONSTRAINTS;
DROP TABLE EVENT_PARTICIPATION CASCADE CONSTRAINTS;

CREATE TABLE USER_ROLE(
    role_id integer not null,
    role_name varchar2(20) not null,
    CONSTRAINT USER_ROLE_PK PRIMARY KEY (role_id),
    CONSTRAINT USER_ROLE_CHECK CHECK(role_name in ('Organizer', 'Coach', 'Guest'))
);

CREATE TABLE USER_ACCOUNT(
    user_id integer not null,
    username varchar2(20) not null,
    passkey varchar2(20) not null,
    role_id integer not null,
    last_login date not null,
    CONSTRAINT USER_ACCOUNT_PK PRIMARY KEY (user_id),
    CONSTRAINT USER_ACCOUNT_FK1 FOREIGN KEY (role_id) REFERENCES USER_ROLE(role_id),
    CONSTRAINT USER_ACCOUNT_UN1 UNIQUE (username)
);

CREATE TABLE OLYMPICS(
    olympic_id integer not null,
    olympic_num varchar2(30) not null,
    host_city varchar2(30) not null,
    opening_date date not null,
    closing_date date not null,
    official_website varchar2(50),
    CONSTRAINT OLYMPICS_PK PRIMARY KEY (olympic_id),
    CONSTRAINT OLYMPICS_UN1 UNIQUE (olympic_num)
);

CREATE TABLE SPORT(
    sport_id integer not null,
    sport_name varchar2(30) not null,
    description varchar2(80),
    dob date,
    team_size integer not null,
    CONSTRAINT SPORT_PK PRIMARY KEY (sport_id)
);

CREATE TABLE PARTICIPANT(
    participant_id integer not null,
    fname varchar2(30) not null,
    lname varchar2(30) not null,
    nationality varchar2(20) not null,
    birth_place varchar2(40) not null,
    dob date not null,
    CONSTRAINT PARTICIPANT_PK PRIMARY KEY (participant_id)
);

CREATE TABLE COUNTRY(
    country_id integer not null,
    country varchar2(20) not null,
    country_code varchar2(3),
    CONSTRAINT COUNTRY_PK PRIMARY KEY (country_id),
    CONSTRAINT COUNTRY_CHECK CHECK(country in ('China', 'Russia', 'Cuba', 'Brazil', 'United States', 'Japan', 'Serbia', 'Argentina', 'Italy', 'Spain', 'Chile', 'Great Britain', 'Switzerland', 'Ukraine', 'Australia', 'Canada', 'Bahamas', 'Mexico', 'Jamaica', 'Denmark', 'Netherlands', 'Latvia', 'Germany')),
    CONSTRAINT COUNTRY_UN1 UNIQUE (country),
    CONSTRAINT COUNTRY_UN2 UNIQUE (country_code)
);

CREATE TABLE TEAM(
    team_id integer not null,
    olympic_id integer not null,
    team_name varchar2(50) not null,
    country_id integer not null,
    sport_id integer not null,
    coach_id integer not null,
    CONSTRAINT TEAM_PK PRIMARY KEY (team_id),
    CONSTRAINT TEAM_FK1 FOREIGN KEY (olympic_id) REFERENCES OLYMPICS(olympic_id),
    CONSTRAINT TEAM_FK2 FOREIGN KEY (country_id) REFERENCES COUNTRY(country_id),
    CONSTRAINT TEAM_FK3 FOREIGN KEY (sport_id) REFERENCES SPORT(sport_id),
    CONSTRAINT TEAM_FK4 FOREIGN KEY (coach_id) REFERENCES PARTICIPANT(participant_id)
);

CREATE TABLE TEAM_MEMBER(
    team_id integer not null,
    participant_id integer,
    CONSTRAINT TEAM_MEMBER_PK PRIMARY KEY (team_id, participant_id),
    CONSTRAINT TEAM_MEMBER_FK1 FOREIGN KEY (participant_id) REFERENCES PARTICIPANT(participant_id),
    CONSTRAINT TEAM_MEMBER_FK2 FOREIGN KEY (team_id) REFERENCES TEAM(team_id)
);

CREATE TABLE MEDAL(
    medal_id integer not null,
    medal_title varchar2(6) not null,
    points integer DEFAULT 0 not null,
    CONSTRAINT MEDAL_PK PRIMARY KEY (medal_id),
    CONSTRAINT MEDAL_CHECK CHECK (medal_title IN ('gold', 'silver', 'bronze'))
);

CREATE TABLE VENUE(
    venue_id integer not null,
    olympic_id integer not null,
    venue_name varchar2(30) not null,
    capacity integer not null,
    CONSTRAINT VENUE_PK PRIMARY KEY (venue_id),
    CONSTRAINT VENUE_FK1 FOREIGN KEY (olympic_id) REFERENCES OLYMPICS(olympic_id)
);

CREATE TABLE EVENT(
    event_id integer not null,
    sport_id integer not null,
    venue_id integer not null,
    gender char not null,
    event_time date not null,
    CONSTRAINT EVENT_PK PRIMARY KEY (event_id),
    CONSTRAINT EVENT_FK1 FOREIGN KEY (sport_id) REFERENCES SPORT(sport_id),
    CONSTRAINT EVENT_FK2 FOREIGN KEY (venue_id) REFERENCES VENUE(venue_id),
    CONSTRAINT EVENT_CHECK CHECK (gender in ('M','F'))
);

CREATE TABLE EVENT_PARTICIPATION(
    event_id integer not null,
    team_id integer not null,
    status char not null,
    CONSTRAINT EVENT_PARTICIPATION_PK PRIMARY KEY (event_id, team_id),
    CONSTRAINT EVENT_PARTICIPATION_FK1 FOREIGN KEY (team_id) REFERENCES TEAM(team_id),
    CONSTRAINT EVENT_PARTICIPATION_FK2 FOREIGN KEY (event_id) REFERENCES EVENT(event_id),
    CONSTRAINT EVENT_PARTICIPATION_CHECK CHECK (status in ('e', 'n'))
);

CREATE TABLE SCOREBOARD(
    olympic_id integer not null,
    event_id integer not null,
    team_id integer not null,
    participant_id integer not null,
    position integer not null,
    medal_id integer,
    CONSTRAINT SCOREBOARD_PK PRIMARY KEY (olympic_id, event_id, participant_id),
    CONSTRAINT SCOREBOARD_FK1 FOREIGN KEY (medal_id) REFERENCES MEDAL(medal_id),
    CONSTRAINT SCOREBOARD_FK2 FOREIGN KEY (event_id) REFERENCES EVENT(event_id),
    CONSTRAINT SCOREBOARD_FK3 FOREIGN KEY (team_id) REFERENCES TEAM(team_id),
    CONSTRAINT SCOREBOARD_FK4 FOREIGN KEY (participant_id) REFERENCES PARTICIPANT(participant_id),
    CONSTRAINT SCOREBOARD_FK5 FOREIGN KEY (olympic_id) REFERENCES OLYMPICS(olympic_id)
);

COMMIT;