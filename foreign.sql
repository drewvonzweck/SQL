ALTER TABLE Teams
ADD CONSTRAINT fk_coaches_persons FOREIGN KEY (coachID) REFERENCES Persons (personID)
;

ALTER TABLE GamePlayers
ADD CONSTRAINT fk_gameplayers_games FOREIGN KEY (gameID) REFERENCES Games (gameID)
ON DELETE CASCADE
ON UPDATE CASCADE
;

ALTER TABLE GamePlayers
ADD CONSTRAINT fk_gameplayers_players FOREIGN KEY (playerID) REFERENCES Players (playerID)
ON UPDATE CASCADE
;
