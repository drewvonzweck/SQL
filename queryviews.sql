
-- Run Query 1st Time
SELECT w.teamID, w.teamName, (totalWins - computedWins) AS winDiff, (totalLosses- computedLosses) AS LossDiff, pcount.numPlayers
FROM winsdisagree w, lossesdisagree l,(SELECT p.teamID, count(p.teamID) AS numPlayers FROM players p GROUP BY(p.teamID)) pcount
WHERE w.teamID = l.teamID AND w.teamID = pcount.teamID 
;

--RESULT OF RUNNING THIS QUERY
--teamid |  teamname  | windiff | lossdiff | numplayers 
----------+------------+---------+----------+------------
--    203 | Peaches    |       1 |       -1 |          3
--    209 | Lone Stars |      -1 |       -2 |          2


--Delete Statement #1
DELETE FROM Games
WHERE gameID = 10005
;

--Delete Statement #2
DELETE FROM Games
WHERE gameID = 10001
;


--Run Query 2nd Time
SELECT w.teamID, w.teamName, (totalWins - computedWins) AS winDiff, (totalLosses- computedLosses) AS LossDiff, pcount.numPlayers
FROM winsdisagree w, lossesdisagree l,(SELECT p.teamID, count(p.teamID) AS numPlayers FROM players p GROUP BY(p.teamID)) pcount
WHERE w.teamID = l.teamID AND w.teamID = pcount.teamID
;

--RESULT OF RUNNING THIS QUERY AGAIN
--teamid |  teamname  | windiff | lossdiff | numplayers 
----------+------------+---------+----------+------------
--    201 | Birds      |       1 |        1 |          2
--    209 | Lone Stars |      -1 |       -2 |          2
