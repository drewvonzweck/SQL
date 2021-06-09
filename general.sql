ALTER TABLE GamePlayers ADD CONSTRAINT players_play
CHECK ( minutesPlayed >= 0 );

ALTER TABLE Players ADD CONSTRAINT legal_rating  
CHECK ( rating = 'L' OR rating = 'M' OR rating = 'H' OR rating IS NULL );

ALTER TABLE Games ADD CONSTRAINT null_twice
CHECK ( homePoints IS NOT NULL OR visitorPoints IS NULL );
