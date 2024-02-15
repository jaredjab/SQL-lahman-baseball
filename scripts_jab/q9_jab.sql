-- Q9 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker
/*
Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.
*/


WITH windata AS (SELECT yearid,
                    playerid,
                    namegiven,
                    namelast,
                    teamid,
                    a.lgid,
                    COUNT(CASE WHEN a.lgid = 'AL' THEN 'AL' END) OVER(PARTITION BY playerid) AS al_wins,
                    COUNT(CASE WHEN a.lgid = 'NL' THEN 'NL' END) OVER(PARTITION BY playerid) AS nl_wins
                FROM managers AS m
                    JOIN people AS p USING(playerid)
                    JOIN awardsmanagers AS a USING(playerid, yearid)
                WHERE awardid LIKE 'TSN%'
                    AND a.lgid != 'ML'
                ORDER BY yearid)
                
,  teamnames AS (SELECT yearid, teamid, name FROM teams)
                
SELECT namegiven, namelast, name AS team, w.lgid
FROM windata AS w
    JOIN teamnames AS t USING(yearid, teamid)
WHERE al_wins > 0
    AND nl_wins > 0
GROUP BY namegiven, namelast, team, w.lgid;
--TSN Manager of the Year winners in both leagues:

    -- David Allen Johnson
        -- AL with the Baltimore Orioles
        -- NL with the Washington Nationals
        
    -- James Richard Leyland
        -- AL with the Detroit Tigers
        -- NL with the Pittsburgh Pirates