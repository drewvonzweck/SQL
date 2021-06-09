--First test for fk_coaches_persons
INSERT INTO Teams 
VALUES (4000, 'Testers', 99, 'Nowhere', 'Blue', 3, 1);


--Second test for fk_gameplayers_games
INSERT INTO GamePlayers
VALUES (99999, 1 , 12);


--Third test for fk_gameplayers_players
INSERT INTO GamePlayers
VALUES (10001, 99 , 12);



--First test for players_play PASS
UPDATE GamePlayers SET minutesplayed = 20  WHERE playerID = 1;

--Second test for players_play FAIL
UPDATE GamePlayers SET minutesplayed = -2  WHERE playerID = 2;



--First test for legal_rating PASS
UPDATE Players SET rating = 'L'  WHERE playerID = 1;

--Second test for legal_rating FAIL
UPDATE Players SET rating = 'Q'  WHERE playerID = 2;



--First test for null_twice PASS
UPDATE Games SET homePoints = NULL, visitorPoints = NULL  WHERE GameID = 10001;

--Second test for null_twice FAIL
UPDATE Games SET homePoints = NULL, visitorPoints = 5  WHERE GameID = 10004;
