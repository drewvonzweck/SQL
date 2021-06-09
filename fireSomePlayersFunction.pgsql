CREATE OR REPLACE FUNCTION fireSomePlayersFunction (maxFired INTEGER) RETURNS INTEGER
AS $$

DECLARE riskID INTEGER;
DECLARE salary NUMERIC(7,2);
DECLARE count INTEGER;
DECLARE c CURSOR FOR
SELECT DISTINCT pl.playerID, p.salary
FROM players pl, persons p, gameplayers gp
WHERE   pl.playerID = p.personID
        AND pl.playerID = gp.playerID
        AND pl.rating = 'L'
        AND pl.teamid is not null
        AND (SELECT SUM(minutesplayed) FROM gameplayers g2  WHERE g2.playerID=gp.playerID) > 60
ORDER BY (p.salary) DESC
;

BEGIN
	OPEN c;
	count :=0;
	WHILE (maxFired !=0)
	LOOP
	FETCH c INTO riskID, salary;
	EXIT WHEN NOT FOUND;
	RAISE NOTICE 'Iterating through risk players, looking at player %' ,riskID;
	UPDATE Players
	SET teamID = NULL
	WHERE playerID = riskID;
	maxFired := maxFired-1;
	count := count +1;
	END LOOP;

	RETURN count;
END;
$$ LANGUAGE plpgsql;

