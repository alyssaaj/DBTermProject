-- Alyssa Jordan (alj81)
-- CS 1555 Term Project
-- init.sql (the script to initialize the tables)

-- In this file you should have all the inserts (sample data) 
-- for your schema produced by the schema.sql.
DROP SEQUENCE SEQ_USER_ROLE;
DROP SEQUENCE SEQ_OLYMPICS;
DROP SEQUENCE SEQ_SPORT;
DROP SEQUENCE SEQ_PARTICIPANT;
DROP SEQUENCE SEQ_COUNTRY;
DROP SEQUENCE SEQ_TEAM;
DROP SEQUENCE SEQ_MEDAL;
DROP SEQUENCE SEQ_VENUE;
DROP SEQUENCE SEQ_EVENT;
DROP SEQUENCE SEQ_TM_TEAM;
DROP SEQUENCE SEQ_TM_PART;

-- USER_ROLE DONE
CREATE SEQUENCE SEQ_USER_ROLE START WITH 1 INCREMENT BY 1;
INSERT INTO USER_ROLE values(SEQ_USER_ROLE.NEXTVAL,'Organizer');
INSERT INTO USER_ROLE values(SEQ_USER_ROLE.NEXTVAL,'Coach');
INSERT INTO USER_ROLE values(SEQ_USER_ROLE.NEXTVAL,'Guest');
COMMIT;

-- USER ACCOUNT
INSERT INTO USER_ACCOUNT (user_id) values(1);

-- OLUMPICS DONE
CREATE SEQUENCE SEQ_OLYMPICS START WITH 1 INCREMENT BY 1;
INSERT INTO OLYMPICS values(SEQ_OLYMPICS.NEXTVAL, 'XXV', 'Athens', '13-AUG-2004', '29-AUG-2004', 'https://www.olympic.org/athens-2004');
INSERT INTO OLYMPICS values(SEQ_OLYMPICS.NEXTVAL, 'XXVI', 'Beijing', '08-AUG-2008', '24-AUG-2008', 'https://www.olympic.org/beijing-2008');
INSERT INTO OLYMPICS values(SEQ_OLYMPICS.NEXTVAL, 'XXVII','LONDON', '27-JUL-2012', '12-AUG-2012', 'https://www.olympic.org/london-2012');
INSERT INTO OLYMPICS values(SEQ_OLYMPICS.NEXTVAL, 'XXVIII', 'RIO', '05-AUG-2016', '21-AUG-2016', 'https://www.olympic.org/rio-2016');
COMMIT;

-- SPORT DONE
CREATE SEQUENCE SEQ_SPORT START WITH 1 INCREMENT BY 1;
INSERT INTO SPORT values(SEQ_SPORT.NEXTVAL, 'Volleyball', 'a team sport where the objective is grounding a ball in the opponents court.', '01-JAN-1964', 6);
INSERT INTO SPORT values(SEQ_SPORT.NEXTVAL, 'Beach Volleyball', 'a team sport with two teams of two players on a sand court divided by a net.', '01-JAN-1915', 2);
INSERT INTO SPORT values(SEQ_SPORT.NEXTVAL, 'Duet Synchronized Swimming', 'a team sport with two swimmers performing synchronized routine.', '01-JAN-1946', 2);
INSERT INTO SPORT values(SEQ_SPORT.NEXTVAL, 'Singles Tennis', 'a racket sport where players hit the ball so the opponent cannot return.', '01-JAN-1896', 1);
INSERT INTO SPORT values(SEQ_SPORT.NEXTVAL, '100 M Hurdles', 'a race where runners negotiate ten 2fft 0in hurdles spread over a 100m straight.', '01-JAN-1972', 1);
INSERT INTO SPORT values(SEQ_SPORT.NEXTVAL, '400 M Dash', 'a 400 meter sprinting event in track and field competitions', '01-JAN-1896', 1);
COMMIT;


-- PARTICIPANT DONE
CREATE SEQUENCE SEQ_PARTICIPANT START WITH 1 INCREMENT BY 1;
-- INSERT INTO PARTICIPANT values();
-- Coaches
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Chen', 'Zhonghe', 'Chinese', 'Beijing', '30-APR-1970');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Gennady', 'Shipulin', 'Russian', 'Belgorod', '29-APR-1954');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Luis', 'Calderon', 'Cuban', 'Havana', '02-MAY-1952');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'José', 'Guimarães', 'Brazilian', 'Quintana', '31-JUL-1954');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Hugh', 'McCutcheon', 'New Zealand', 'Christchurch', '13-OCT-1969');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Masayoshi', 'Manabe', 'Japanese', 'Kyoto', '19-OCT-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yang', 'Ping', 'Chinese', 'Tianjin', '10-DEC-1960');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zoran', 'Terzic', 'Serbian', 'Belgrade', '09-AUG-1966');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Karch', 'Kiraly', 'American', 'Jackson, MI', '03-NOV-1960');

INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Brazil Men', 'Athens Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Spain Men', 'Athens Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Switzerland Men', 'Athens Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Men', 'Beijing Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Brazil Men', 'Beijing Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Brazil Men', 'Beijing Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Germany Men', 'London Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Brazil Men', 'London Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Latvia Men', 'London Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Brazil Men', 'Rio Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Italy Men', 'Rio Beach Vball');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Netherlands Men', 'Rio Beach Vball');

INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Russia Women', 'Athens Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Japan Women', 'Athens Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Athens Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Russia Women', 'Beijing Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Spain Women', 'Beijing Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Japan Women', 'Beijing Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Russia Women', 'London Duet Syn Swim'); 
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Spain Women', 'London Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'China Women', 'London Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Russia Women', 'Rio Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'China Women', 'Rio Duet Syn Swim');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Japan Women', 'Rio Duet Syn Swim');

INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Chile Mens', 'Athens Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Mens', 'Athens Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Chile Mens', 'Athens Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Spain Mens', 'Beijing Singles Team'); 
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Chile Mens', 'Beijing Singles Team'); 
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Serbia Mens', 'Beijing Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Great Britain Mens', 'London Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Switzerland Mens', 'London Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Argentina Mens', 'London Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Great Gritain Mens', 'Rio Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Argentina Mens', 'Rio Singles Team');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Japan Mens', 'Rio Singles Team');

INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Athens 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Ukraine Women', 'Athens 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Athens 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Beijing 100 M Hurdles'); 
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Australia Women', 'Beijing 100 M Hurdles'); 
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Canada Women', 'Beijing 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Australia Women', 'London 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'London 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'London 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Rio 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Rio 100 M Hurdles');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Rio 100 M Hurdles');

INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Bahamas Women','Athens 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Mexico Women','Athens 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Russia Women','Athens 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Great Britain Women','Beijing 400 M Dash'); 
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Jamaica Women','Beijing 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women','Beijing 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women','London 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Great Britain Women','London 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women','London 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Rio 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'Denmark Women', 'Rio 400 M Dash');
INSERT INTO PARTICIPANT (participant_id, fname, lname) values(SEQ_PARTICIPANT.NEXTVAL, 'USA Women', 'Rio 400 M Dash');


-- 400 M WOMEN
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Tonique', 'Williams-Darling', 'Bahamian', 'Nassau, The Bahamas', '17-JAN-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ana', 'Guevara', 'Mexican', 'Nogales, Mexico', '04-MAR-1977');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Natalya', 'Antyukh', 'Russian', 'Soviet Union', '26-JUN-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Christine', 'Ohuruogu', 'British', 'London, United Kingdom', '17-MAY-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Shericka', 'Williams', 'Jamaican', 'St. Elizabeth Parish, Jamaica', '17-SEP-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sanya', 'Richards-Ross', 'American', 'Kingston, Jamaica', '26-FEB-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'DeeDee', 'Trotter', 'American', 'Twenty Nine Palms, CA', '08-DEC-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Dalilah', 'Muhammad', 'American', 'New York, NY', '07-FEB-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sara Slott', 'Petersen', 'Danish', 'Nykobing Falster, Denmark', '09-APR-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ashley', 'Spencer', 'American', 'Canton, OH', '08-MAR-1985');

-- 100 M Hurdles
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Joanna', 'Hayes', 'American', 'Williamsport, PA', '23-DEC-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Olena', 'Krasovska', 'Ukrainian', 'Kyiv, Ukraine', '17-AUG-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Melissa', 'Morrison', 'American', 'Mooresville, NC', '09-JUL-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Dawn', 'Harper', 'American', 'East St. Louis, IL', '13-MAY-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sally', 'Pearson', 'Australian', 'Paddington, Australia', '19-SEP-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Priscilla', 'Lopes-Schliep', 'Canadian', 'Scarborough, Canada', '26-AUG-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kellie', 'Wells', 'American', 'Richmond, VA', '16-JUL-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Brianna', 'Rollins', 'American', 'Miami, FL', '18-AUG-1991');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Nia', 'Ali', 'American', 'Norristown, PA', '23-OCT-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kristi', 'Castlin', 'American', 'Atlanta, GA', '07-JUL-1988');

-- Men's Singles Tennis
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Nicolas', 'Massu', 'Chilean', 'Vina del Mar', '10-OCT-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Mardy', 'Fish', 'American', 'Edina, MN', '9-DEC-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Fernando', 'Gonzalez', 'Chilean', 'Santiago, Chile', '29-JUL-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Rafael', 'Nadal', 'Spanish', 'Manacor, Spain', '03-JUN-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Novak', 'Djokovic', 'Serbian', 'Belgrade, Serbia', '22-MAY-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Andy', 'Murray', 'British', 'Glasgow, United Kingdom', '15-MAY-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Roger', 'Federer', 'Swiss', 'Basel, Switzerland', '08-AUG-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Juan Martin', 'Del Potro', 'Argentine', 'Tandil, Argentina', '23-SEP-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kei', 'Nishikori', 'Japanese', 'Matsue, Shimane, Japan', '29-DEC-1989');

-- Women's Volleyball
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Feng', 'Kun', 'Chinese', 'Beijing', '28-DEC-1978');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yang', 'Hao', 'Chinese', 'Dalian', '21-MAR-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Liu', 'Yanan', 'Chinese', 'Dalian', '29-SEP-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Li', 'Shan', 'Chinese', 'Beijing', '21-MAY-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhou', 'Suhong', 'Chinese', 'Zhejiang', '23-APR-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhau', 'Ruirui', 'Chinese', 'Nanjing', '08-OCT-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhang', 'Yuehong', 'Chinese', 'Shenyang', '09-NOV-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Chen', 'Jing', 'Chinese', 'Sichuan', '03-SEP-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Song', 'Nina', 'Chinese', 'Anshan', '07-APR-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Wang', 'Lina', 'Chinese', 'Hei Longjiang', '05-FEB-1978');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhang', 'Na', 'Chinese', 'Anshan', '19-APR-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhang', 'Ping', 'Chinese', 'Beijing', '23-MAY-1982'); 

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Stanislav', 'Dineykin','Russian', 'Blagodarny', '10-OCT-1973');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sergei', 'Baranov', 'Russian','Horlivka', '10-AUG-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Pavel', 'Abramov','Russian', 'Moscow', '23-APR-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Aleksey', 'Kazakov','Russian', 'Naberezhnye Chelny', '18-MAY-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sergey', 'Tetyukhin','Russian', 'Ferghana, Uzbekistan', '23-SEP-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Vadim', 'Khamuttskikh','Russian', 'Asha, Chelyabinsk Oblast', '26-NOV-1969');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Aleksandr', 'Kosarev','Russian', 'Belgorod', '30-SEP-1977');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Konstantin', 'Ushakov','Russian', 'Omsk', '24-MAR-1970');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Taras', 'Khtey', 'Russian', 'Lviv Oblast', '22-MAY-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Andrey', 'Egorchev', 'Russian', 'Moscow', '08-FEB-1978');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Aleksey', 'Verbov', 'Russian', 'Moscow', '31-JAN-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Aleksey' ,'Kuleshov', 'Russian', 'Fryazino', '24-FEB-1979');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yumilka', 'Ruiz', 'Cuban', 'Camagüey', '08-MAY-1978');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Nancy', 'Carrillo', 'Cuban', 'Havana', '11-JAN-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Mayvelis', 'Martinez', 'Cuban', 'Havana', '12-JUN-1977');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Baimi','Ramirez', 'Cuban', 'Havana', '08-OCT-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yaima', 'Ortiz', 'Cuban', 'Havana', '09-NOV-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, ' Ana', 'Fernandez', 'Cuban', 'Sancti Spiritus', '03-AUG-1973');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Liana', 'Mesa', 'Cuban', 'Camagüey', '26-DEC-1977');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Rosir', 'Calderón', 'Cuban', 'Havana', '28-DEC-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Anniara', 'Muñoz', 'Cuban', 'Havana', '24-JAN-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Dulce', 'Téllezl', 'Cuban', 'Havana', '12-SEP-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Marta', 'Sánchez', 'Cuban', 'Havana', '17-MAY-1973');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Bruno', 'Rezende', 'Brazillian', 'Rio de Janeiro', '02-JUL-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Marcelo', 'Elgarten', 'Brazillian', 'Rio do Janeiro', '09-NOV-1974 ');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'André', 'Heller', 'Brazillian', 'Novo Hamburgo', '17-DEC-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Samuel', 'Fuchs', 'Brazillian', 'Curitiba', '04-MAR-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Giba', ' ', 'Brazillian', 'Londrina', '23-DEC-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Murilo', 'Endres', 'Brazillian', 'Passo Fundo', '03-MAY-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'André', 'Nascimento', 'Brazillian', 'São João de Meriti', '04-MAR-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sérgio', 'Santos', 'Brazillian', 'Nova Londrina', '15-OCT-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Anderson', 'Rodrigues', 'Brazillian', 'Belo Horizonte', '21-MAY-1974');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Gustavo', 'Endres', 'Brazillian', 'Passo Fundo', '23-AUG-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Rodrigao', ' ', 'Brazillian', 'São Paulo', '17-APR-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Dante', 'Amaral', 'Brazillian', 'Itumbiara',  '30-SEP-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ogonna', 'Nnamani', 'American', 'Bloomington, IA', '29-JUL-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Danielle', 'Scott-Arruda', 'American', 'Baton Rouge, LA', '01-OCT-1972');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Tayyiba', 'Haneef-Park', 'American', 'Laguna Hills, CA', '23-MAR-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Lindsey', 'Berg', 'American', 'Honolulu, HI', '16-JUL-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Stacy', 'Sykora', 'American', 'Fort Worth, TX', '24-JUN-1977');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Nicole', 'Davis', 'American', 'Stockton, CA', '24-APR-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Heather', 'Brown', 'American', 'Orange, CA', '29-OCT-1978');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jennifer', 'Joines', 'American', 'Santa Clara, CA', '23-NOV-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kim', 'Glass', 'American', 'Los Angeles, CA', '18-AUG-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Robyn', 'Ah Mow-Santos', 'American', 'Honolulu, HI', '15-SEP-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kin', 'Willoughby', 'American', 'Houma, LA', '07-NOV-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Logan', 'Tom', 'American', 'Napa, CA', '25-MAY-1981');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Wang', 'Yimei', 'Chinese', 'Dailan', '11-JAN-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Wei', 'Quiyue', 'Chinese', 'Tianjin', '26-SEP-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Xu', 'Yunli', 'Chinese', 'Fujian', '02-AUG-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Xue', 'Ming', 'Chinese', 'Beijing', '23-FEB-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Li', 'Juan', 'Chinese', 'Tianjin', '15-MAY-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ma', 'Yunwen', 'Chinese', 'Shanghai', '19-OCT-1986');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Fabiana', 'Claudino', 'Brazillian', 'Belo Horizonte', '24-JAN-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Dani', 'Lins', 'Brazillian', 'Recife', '05-JAN-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Paula', 'Pequeno', 'Brazillian', 'Brasillia', '22-JAN-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Adenizia', 'da Silvia', 'Brazillian', 'Osasco', '18-DEC-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Thaisa', 'Menezes', 'Brazillian', 'Rio de Janeiro', '15-MAY-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jaqueline', 'Carvalho', 'Brazillian', 'Recife', '31-DEC-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Fernanda', 'Ferreria', 'Brazillian', 'Rio do Janeiro', '10-JAN-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Tandara', 'Caixeta', 'Brazillian', 'Brasillia', '30-OCT-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Natalia', 'Pereira', 'Brazilian', 'Ponta Grossa', '04-APR-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sheilla', 'Castro', 'Brazilian', 'Belo Horizonte', '01-JUL-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Fabiana', 'Alvim', 'Brazilian', 'Rio de Janeiro', '07-APR-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Fernanda', 'Garay', 'Brazilian', 'Porto Alegre', '05-OCT-1986');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Tamari', 'Miyashiro', 'American', 'Honolulu, HI', '08-JUL-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jordan', 'Larson', 'American', 'Fremont, NE', '16-OCT-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Megan', 'Hodge', 'American', 'Saint Thomas, Virgin Islands', '15-OCT-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Christa', 'Harmotto', 'American', 'Sewickley, PA', '12-OCT-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Foluke', 'Akinradewo', 'Canadian', 'Fort Lauderdale', '05-OCT-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Courtney', 'Thompson', 'American','Kent,WA', '04-NOV-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Destinee', 'Hooker', 'American', 'Frankfurt, Germany', '07-SEP-1987');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Hitomi', 'Nakamichi', 'Japanese', 'Joyo, Kyoto', '18-SEP-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yoshi', 'Takeshita', 'Japanese', 'Kitakyushu City, Fukuoka', '18-MAY-1978');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Mai', 'Yamaguchi', 'Japanese', 'Shima, Mie', '03-MAY-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Erika', 'Araki', 'Japanese', 'Kurashiki, Okayama', '03-AUG-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kaori', 'Inoue', 'Japanese', 'Toyooka, Hyogo', '21-OCT-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Maiko', 'Kano', 'Japanese', 'Mitaka, Tokyo', '05-AUG-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yuko', 'Sano', 'Japanese', 'takatsuki, Osaka', '26-AUG-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ai', 'Otomo', 'Japanese', 'Sendai, Miyagi', '24-APR-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Risa', 'Shinnabe', 'Japanese', 'Kokubu, Kagoshima', '11-AUG-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Saori', 'Sakoda', 'Japanese', 'Kagoshima, Kagoshima', '18-OCT-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yukiko', 'Ebata', 'Japanese', 'Akita, Akita', '07-OCT-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Saori', 'Kimura', 'Japanese', 'Yashio, Saitama', '19-OCT-1986');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yuan', 'Xinyue','Chinese', 'Chongqing', '21-DEC-1996');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhu', 'Ting', 'Chinese', 'Dancheng, Zhoukou', '29-NOV-1994');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yang', 'Fangxu', 'Chinese', 'Shandong', '06-OCT-1994');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Gong', 'Xiangyu', 'Chinese', 'Lianyugang', '21-APR-1997');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Wei', 'Qiuyue', 'Chinese', 'Tianjin', '26-SEP-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Zhang','Changning', 'Chinese','Nanjing','06-NOV-1995');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Liu', 'Xiaotong', 'Chinese', 'Jilin',' 16-FEB-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Hui', 'Ruioqi', 'Chinese', 'Dalian, liaoning', '04-APR-1991');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Lin', 'Li', 'Chinese', 'Fujian', '05-AUG-1992');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ding', 'Xia', 'Chinese', 'Hebei', '13-JAN-1992');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yan' ,'Ni', 'Chinese', 'Beijing', '02-MAR-1987');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Bianka', 'Busa', 'Serbian', 'Vrbas', '25-JUL-1994');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jovana', 'Brakočević', 'Serbian', 'Zrenjanin', '05-APR-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Bojana', 'Živković', 'Serbian', 'Belgrade', '29-APR-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Tijana', 'Malesevic', 'Serbian', 'Titovo Uzice', '18-APR-1991');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Brankica', 'Mihajlovic', 'Serbian', 'Brčko', '13-APR-1991');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Maja', 'Ognjenovic', 'Serbian', 'Zrenjanin', '06-AUG-1984');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Stefana', 'Veljkovic', 'Serbian', 'Svetozarevo', '09-JAN-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jelena', 'Nikolic', 'Serbian', 'Belgrade', '13-APR-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jovana', 'Stevanovic', 'Serbian', 'Belgrade', '30-JUN-1992');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Milena', 'Rasic', 'Serbian', 'Priština', '25-OCT-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Silvija', 'Popovic', 'Serbian', 'Nikšić', '15-MAY-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Tijana', 'Boskovic', 'Serbian', 'Trebinje', '08-APR-1997');

INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Alisha', 'Glass', 'American', 'Leland, MI', '05-APR-1988');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kayla', 'Banwarth', 'American', 'Dubuque, IA', '21-JAN-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Carli', 'Lloyd', 'American', 'Fallbrook, CA', '06-AUG-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kelly', 'Murphy', 'American', 'Wilmington, IL', '20-OCT-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kimberly', 'Hill', 'American', 'Portland, OR', '30-NOV-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Foluke', 'Akinradewo', 'American', 'London', '05-OCT-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Kelsey', 'Robinson', 'American', 'Elmhurst, IL', '25-JUN-1992');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Karsta', 'Lowe', 'American', 'San Diego, CA', '02-FEB-1993');

-- Men's Beach Volleyball
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Phil', 'Dalhausser', 'American', 'Ventura, CA', '26-JAN-1980');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Todd', 'Rogers', 'American', 'Santa Barbara, CA', '30-SEP-1973');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Marcio', 'Araujo', 'Brazillian', 'Fortaleza, Ceará', '12-OCT-1973');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Fábio', 'Luiz Magalhães', 'Brazillian', 'Marataízes', '13-APR-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ricardo', 'Santos', 'Brazillian', 'Salvador', '06-JAN-1975');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Emanuel', 'Rego', 'Brazillian', 'Curitiba', '15-APR-1973');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Julius', 'Brink', 'German', 'Münster', '06-AUG-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jonas', 'Reckermann', 'German', 'Rheine', '26-MAY-1979');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Alison', 'Cerutti', 'Brazillian', 'Rio de Janeiro', '07-DEC-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Emanuel', 'Rego', 'Brazillian', 'Curitiba', '15-APR-1973');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Mārtiņš', 'Pļaviņš', 'Litheanian', 'Riga', '08-MAY-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Jānis', 'Šmēdiņš', 'Litheanian', 'Kuldīga', '31-JUL-1987');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Bruno', 'Oscar Schmidt', 'Brazillian', 'Vila Velha', '06-OCT-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Daniele', 'Lupo', 'Italian', 'Rio de Janeiro', '06-OCT-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Paolo', 'Nicolai', 'Italian', 'Ortona', '07-DEC-1985');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Alexander', 'Brouwer','Dutch', 'Leiden', '03-OCT-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Robert', 'Meeuwsen', 'Dutch', 'Nieuwegein', '21-APR-1988');

-- Duet Synchronized Swimming
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Anastasia', 'Davydova', 'Russian','Moscow', '02-FEB-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Anastasia', 'Yermakova','Russian', 'Moscow', '08-APR-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Miya', 'Tachibana', 'Japanese', 'Ōtsu', '12-DEC-1974');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Miho', 'Takeda', 'Japanese', 'Kyoto', '13-SEP-1976');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Alison', 'Bartosik', 'American', 'Flagstaff, AR', '20-APR-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Anna', 'Kozlova', 'Russian', 'Leningrad, Soviet Union', '06-MAR-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Andrea', 'Fuentes', 'Spanish', 'Valls', '07-APR-1983');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Gemma', 'Mengual', 'Spanish', 'Barcelona', '12-APR-1977');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Saho', 'Harada', 'Japanese', 'Tokyo', '05-NOV-1982');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Emiko', 'Suzuki', 'Japanese', 'Urawa', '12-NOV-1981');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Natalia', 'Ishchenko', 'Russian', 'Smolensk', '08-APR-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Svetlana', 'Romashina', 'Russian', 'Moscow', '21-SEP-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Ona', 'Caronell', 'Spanish', 'Barcelona', '05-JUL-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Huang', 'Xuechen', 'Chinese','Shanghai', '25-FEB-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Liu', 'Ou', 'Chinese', 'Zhanjiang', '13-NOV-1986');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Sun', 'Wenyan', 'Chinese', 'Changsha', '27-DEC-1989');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Yukiko', 'Inui', 'Japanese', 'Omihachiman', '04-DEC-1990');
INSERT INTO PARTICIPANT values(SEQ_PARTICIPANT.NEXTVAL, 'Risako', 'Mitsui', 'Japanese', 'Shinjuku', '23-SEP-1993');
COMMIT;

-- COUNTRY DONE 
--INSERT INTO COUNTRY values
CREATE SEQUENCE SEQ_COUNTRY START WITH 1 INCREMENT BY 1;
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'China', 'CHN');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Russia', 'RUS');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Cuba', 'CUB');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Brazil', 'BRA');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'United States', 'USA');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Japan', 'JPN');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Serbia', 'SRB');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Argentina', 'ARG');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Italy', 'ITA');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Spain', 'ESP');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Chile', 'CHI');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Great Britain', 'GBR');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Switzerland', 'SUI');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Ukraine', 'UKR');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Australia', 'AUS');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Canada', 'CAN');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Bahamas', 'BAH');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Mexico', 'MEX');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Jamaica', 'JAM');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Denmark', 'DEN');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Netherlands', 'NED');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Latvia', 'LAT');
INSERT INTO COUNTRY values(SEQ_COUNTRY.NEXTVAL, 'Germany', 'GER');
COMMIT;

-- TEAM DONE
--INSERT INTO TEAM values
CREATE SEQUENCE SEQ_TEAM START WITH 1 INCREMENT BY 1;
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'China Women Volleyball', 1, 1, 1);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Russia Women Volleyball', 2, 1, 2);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Cuba Women Volleyball', 3, 1, 3);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Brazil Women Volleyball', 4, 1, 4);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'USA Women Volleyball', 5, 1, 5);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'China Women Volleyball', 1, 1, 1);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Brazil Women Volleyball', 4, 1, 4);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'USA Women Volleyball', 5, 1, 5);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Japan Women Volleyball', 6, 1, 6);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'China Women Volleyball', 1, 1, 7);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Serbia Women Volleyball', 7, 1, 8);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'USA Women Volleyball', 5, 1, 9);

INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Brazil Men Beach Volleyball', 4, 2, 10);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Spain Men Beach Volleyball', 10, 2, 11);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Switzerland Men Beach Volleyball', 13, 2, 12);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'USA Men Beach Volleyball', 5, 2, 13);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Brazil Men Beach Volleyball', 4, 2, 14);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Brazil Men Beach Volleyball', 4, 2, 15);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Germany Men Beach Volleyball', 23, 2, 16);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Brazil Men Beach Volleyball', 4, 2, 17);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Latvia Men Beach Volleyball', 22, 2, 18);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Brazil Men Beach Volleyball', 4, 2, 19);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Italy Men Beach Volleyball', 9, 2, 20);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Netherlands Men Beach Volleyball', 21, 2, 21);

INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Russia Women Duet Synchronized Swimming', 2, 3, 22);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Japan Women Duet Synchronized Swimming', 6, 3, 23);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'USA Women Duet Synchronized Swimming', 5, 3, 24);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Russia Women Duet Synchronized Swimming', 2, 3, 25);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Spain Women Duet Synchronized Swimming', 10, 3, 26);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Japan Women Duet Synchronized Swimming', 6, 3, 27);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Russia Women Duet Synchronized Swimming', 2, 3, 28); 
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Spain Women Duet Synchronized Swimming', 10, 3, 29);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'China Women Duet Synchronized Swimming', 1, 3, 30);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Russia Women Duet Synchronized Swimming', 2, 3, 31);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'China Women Duet Synchronized Swimming', 1, 3, 32);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Japan Women Duet Synchronized Swimming', 6, 3, 33);

INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Chile Mens Singles Team', 11, 4, 34);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'USA Mens Singles Team', 5, 4, 35);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Chile Mens Singles Team', 11, 4, 36);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Spain Mens Singles Team', 10, 4, 37); 
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Chile Mens Singles Team', 11, 4, 38); 
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Serbia Mens Singles Team', 7, 4, 39);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Great Britain Mens Singles Team',12, 4, 40);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Switzerland Mens Singles Team', 13,4, 41);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Argentina Mens Singles Team', 8,4, 42);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Great Gritain Mens Singles Team',12, 4, 43);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Argentina Mens Singles Team', 8, 4, 44);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Japan Mens Singles Team', 6, 4, 45);

INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'USA Women 100 M Hurdles', 5, 5, 46);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Ukraine Women 100 M Hurdles', 14,  5, 47);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'USA Women 100 M Hurdles', 5, 5, 48);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'USA Women 100 M Hurdles', 5, 5, 49); 
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Australia Women 100 M Hurdles', 15, 5, 50); 
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Canada Women 100 M Hurdles', 16, 5, 51);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Australia Women 100 M Hurdles', 15, 5, 52);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'USA Women 100 M Hurdles', 5, 5, 53);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'USA Women 100 M Hurdles', 5, 5, 54);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'USA Women 100 M Hurdles', 5, 5, 55);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'USA Women 100 M Hurdles', 5, 5, 56);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'USA Women 100 M Hurdles', 5, 5, 57);

INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Bahamas Women 400 M Dash', 17, 6, 58);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Mexico Women 400 M Dash', 18, 6, 59);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 1, 'Russia Women 400 M Dash', 2, 6, 60);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Great Britain Women 400 M Dash', 12, 6, 61); 
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'Jamaica Women 400 M Dash', 19, 6, 62);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 2, 'USA Women 400 M Dash', 5, 6, 63);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'USA Women 400 M Dash', 5, 6, 64);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'Great Britain Women 400 M Dash', 12, 6, 65);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 3, 'USA Women 400 M Dash', 5, 6, 66);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'USA Women 400 M Dash', 5, 6, 67);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'Denmark Women 400 M Dash', 20, 6, 68);
INSERT INTO TEAM values(SEQ_TEAM.NEXTVAL, 4, 'USA Women 400 M Dash', 5, 6, 69);

COMMIT;
-- TEAM_MEMBER
CREATE SEQUENCE SEQ_TM_TEAM START WITH 61 INCREMENT BY 1;
CREATE SEQUENCE SEQ_TM_PART START WITH 70 INCREMENT BY 1;

-- 400 M WOMEN
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);

DROP SEQUENCE SEQ_TM_TEAM;
CREATE SEQUENCE SEQ_TM_TEAM START WITH 49 INCREMENT BY 1;

INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);

DROP SEQUENCE SEQ_TM_TEAM;
CREATE SEQUENCE SEQ_TM_TEAM START WITH 37 INCREMENT BY 1;

INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);

DROP SEQUENCE SEQ_TM_TEAM;
CREATE SEQUENCE SEQ_TM_TEAM START WITH 1 INCREMENT BY 1;
-- WOMENS' VB
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);

INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);

INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.NEXTVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);
INSERT INTO TEAM_MEMBER values(SEQ_TM_TEAM.CURRVAL,SEQ_TM_PART.NEXTVAL);


--DELETE FROM PARTICIPANT WHERE participant_id = 40;

-- MEDAL TABLE DONE
CREATE SEQUENCE SEQ_MEDAL START WITH 1 INCREMENT BY 1;
INSERT INTO MEDAL values(SEQ_MEDAL.NEXTVAL, 'gold', 5);
INSERT INTO MEDAL values(SEQ_MEDAL.NEXTVAL, 'silver', 3);
INSERT INTO MEDAL values(SEQ_MEDAL.NEXTVAL, 'bronze', 1);
COMMIT;


-- VENUE DONE 
--INSERT INTO VENUE values(venue_id, olympic_id, venue_name, capacity);
CREATE SEQUENCE SEQ_VENUE START WITH 1 INCREMENT BY 1;
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 1, 'Peace and Friendship Stadium', 1); -- Womens Vball
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 1, 'Faliro Coastal Zone Olymp Comp', 1); --Men's Beach
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 1, 'Athens Olympic Aquatic Centre', 1); --Swimming
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 1, 'Athens Olympic Tennis Centre', 1); --Tennis
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 1, 'Athens Olympic Stadium', 1); --Track
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 2, 'Capital Indoor Stadium', 1);  -- Womens Vball 2008
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 2, 'Beach Volleyball Ground', 1); --mens beach 2008
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 2, 'Olympic Green Tennis Centre', 1); --Men's Tennis
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 2, 'Beijing National Aquatics Cent', 1); --Swimming 2008
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 2, 'Beijing National Stadium', 1); --track 2008
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 3, 'Earls Court Exhibition Centre', 1); --Womens Vball 2012
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 3, 'Horse Guards Parade', 1); --Mens Beach 2012
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 3, 'London Aquatics Centre', 1); --swimming 2012
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 3, 'All England Club', 1); --tennis 2012
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 3, 'London Olympic Stadium', 1); --track 2012
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 4, 'Ginásio do Maracanãzinho', 1); --Womens Vball 2016
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 4, 'Copacabana Stadium', 1); --Mens Beach 2016
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 4, 'Maria Lenk Aquatics Center', 1); --swimming 2016
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 4, 'Olympic Tennis Center', 1); --tennis 2016
INSERT INTO VENUE values(SEQ_VENUE.NEXTVAL, 4, 'Estádio Olímpico Nilton Sant', 1); --track 2016
COMMIT;

-- EVENT DONE 
--INSERT INTO EVENT values(event_id, sport_id, venue_id, gender, event_time);
CREATE SEQUENCE SEQ_EVENT START WITH 1 INCREMENT BY 1;
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 1, 1, 'F', '14-AUG-2004'); -- F Vball Athens
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 1, 6, 'F', '19-AUG-2008'); -- F Vball Beijing
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 1, 11, 'F', '28-JUL-2012'); -- F Vball London
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 1, 16, 'F', '06-AUG-2016'); -- F Vball Rio
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 2, 2, 'M', '15-AUG-2004'); -- M Vball Athens
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 2, 7, 'M', '08-AUG-2008'); -- M Vball Beijing
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 2, 12, 'M', '28-JUL-2012'); -- M Vball London
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 2, 17, 'M', '06-AUG-2016'); -- M Vball Rio
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 3, 3, 'F', '23-AUG-2004'); -- Swimming Athens
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 3, 9, 'F', '18-AUG-2008'); -- Swimming Beijing
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 3, 13, 'F', '05-AUG-2012'); -- Swimming London
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 3, 18, 'F', '15-AUG-2016'); -- Swimming Rio
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 4, 4, 'M', '15-SEP-2004'); -- Tennis Athens
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 4, 8, 'M', '10-AUG-2008'); --Tennis Beijing
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 4, 14, 'M', '28-JUL-2012'); --Tennis London
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 4, 19, 'M', '06-AUG-2016'); -- Tennis Rio
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 5, 5, 'F', '18-AUG-2004'); --F Hurdles Athens
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 5, 10, 'F', '15-SEP-2008'); --F Hurdles Beijing
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 5, 16, 'F', '03-AUG-2012'); --F Hurdles London
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 5, 20, 'F', '12-AUG-2016'); --F Hurdles Rio
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 6, 5, 'F', '19-AUG-2004'); 
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 6, 10, 'F', '16-SEP-2008'); 
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 6, 16, 'F', '04-AUG-2012');
INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 6, 20, 'F', '13-AUG-2016');
COMMIT;

-- test trigger 3
--INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 1, 1, 'F', '14-AUG-2004');
--INSERT INTO EVENT values(SEQ_EVENT.NEXTVAL, 6, 14, 'F', '28-JUL-2012');
--COMMIT;

-- EVENT_PARTICIPATION
--INSERT INTO EVENT_PARTICIPATION values(event id, team id, status);
-- athens women volleyball
INSERT INTO EVENT_PARTICIPATION values(1, 1, 'e');
INSERT INTO EVENT_PARTICIPATION values(1, 2, 'e');
INSERT INTO EVENT_PARTICIPATION values(1, 3, 'e');

DROP SEQUENCE SEQ_EVENT_PART;
CREATE SEQUENCE SEQ_EVENT_PART START WITH 21 INCREMENT BY 1;
DROP SEQUENCE SEQ_EVENT_PART2;
CREATE SEQUENCE SEQ_EVENT_PART2 START WITH 61 INCREMENT BY 1;

-- 400 m dash
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.NEXTVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');

INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.NEXTVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');

INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.NEXTVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');

INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.NEXTVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');
INSERT INTO EVENT_PARTICIPATION values(SEQ_EVENT_PART.CURRVAL, SEQ_EVENT_PART2.NEXTVAL, 'e');

-- SCOREBOARD
--INSERT INTO SCOREBOARD values();

-- 400 m athens
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1, 21, 61, 70, 1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1, 21, 62, 71, 1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1, 21, 63, 72, 1);

DROP SEQUENCE SEQ_P;
CREATE SEQUENCE SEQ_P START WITH 99 INCREMENT BY 1;
DROP SEQUENCE SEQ_P2;
CREATE SEQUENCE SEQ_P2 START WITH 1 INCREMENT BY 1;
-- CHN women vball athens
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.NEXTVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,1);

INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.NEXTVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,2);

INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.NEXTVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);
INSERT INTO SCOREBOARD(olympic_id, event_id, team_id, participant_id, position) values(1,1,SEQ_P2.CURRVAL,SEQ_P.NEXTVAL,3);

-- test trigger 2
--DELETE FROM PARTICIPANT WHERE participant_id=70;
--DELETE FROM PARTICIPANT WHERE participant_id=99;

