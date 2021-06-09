CREATE VIEW WinsDisagree AS
SELECT t.teamID, t.name AS teamName, t.totalwins, computed.computedWins
FROM Teams t, (SELECT w.winner, COUNT(winner) AS computedWins
FROM(
     	SELECT hometeam AS winner
        FROM games g
        WHERE g.homepoints > g.visitorpoints

        UNION ALL

        SELECT visitorteam AS winner
        FROM games g
        WHERE g.visitorpoints >g.homepoints
) w
GROUP BY(w.winner)
) computed
WHERE t.teamID = computed.winner AND t.totalwins <> computed.computedWins
;



CREATE VIEW LossesDisagree AS
SELECT t.teamID, t.name AS teamName, t.totallosses, computed.computedLosses
FROM Teams t, (SELECT l.loser, COUNT(loser) AS computedLosses
FROM(
     	SELECT hometeam AS loser
        FROM games g
        WHERE g.homepoints < g.visitorpoints

        UNION ALL

        SELECT visitorteam AS loser
        FROM games g
        WHERE g.visitorpoints < g.homepoints
) l
GROUP BY(l.loser)
) computed
WHERE t.teamID = computed.loser AND t.totallosses <> computed.computedLosses
;


