-- Q7 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker

-- From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?


WITH wsloserwins AS (SELECT yearid, teamid,
                        SUM(w) AS total_wins
                    FROM teams
                    WHERE wswin = 'N'
                        AND yearid BETWEEN 1970 AND 2016
                    GROUP BY CUBE (yearid, teamid))
SELECT *
FROM wsloserwins
WHERE yearid IS NOT NULL
    AND teamid IS NOT NULL
ORDER BY total_wins DESC
LIMIT 1;
-- Most wins of a world series loser: SEA in 2001 w/ 116


WITH wswinnerwins AS (SELECT yearid, teamid,
                        SUM(w) AS total_wins
                    FROM teams
                    WHERE wswin = 'Y'
                        AND yearid BETWEEN 1970 AND 2016
                    GROUP BY CUBE (yearid, teamid))
SELECT *
FROM wswinnerwins
WHERE yearid IS NOT NULL
    AND teamid IS NOT NULL
    AND yearid != 1981 -- The 1981 Major League Baseball strike resulted in regular season games being cancelled.
ORDER BY total_wins
LIMIT 1;
-- Least wins of a world series winner excluding 1981: SLN in 2006 w/ 83


WITH mostwinsteams AS (SELECT yearid, 
                         MAX(wswin) AS wswin -- Returns 'Y' for any duplicate years containing a 'Y', 'N' otherwise
                      FROM (SELECT yearid, teamid, w AS num_wins, wswin,
                                MAX(w) OVER(PARTITION BY yearid) AS max_wins_for_year
                            FROM teams
                            WHERE yearid BETWEEN 1970 AND 2016)
                      WHERE num_wins = max_wins_for_year
                      GROUP BY yearid)
SELECT ROUND(
    (COUNT(CASE WHEN wswin = 'Y' THEN wswin END)::numeric / COUNT(wswin) )* 100, 2) -- num ws wins (12)
    AS percent_of_teams_with_the_most_wins_that_won_the_world_series
FROM mostwinsteams;
-- 26.09% of teams won the world series from 1970 to 2016 if they had the most wins