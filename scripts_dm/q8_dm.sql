--8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 
--(where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. 
-- Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.

--NEED: TEAMS, PARKS, attendance figures 2016
--INCLUDE: teams and parks which had the top 5 average attendance per game in 2016 AND parks where >= 10 games played
--What tables needed? parks(park name), homegames (teams, parks), teams (name)
--REPORT: park name | team name | avg_attendance_2016 TOP 5

--Top 5 top attendance--

WITH team_names_2016 AS (SELECT yearid, teamid, name
						 FROM teams
						 WHERE yearid = 2016)
	

SELECT park_name, t.name, SUM(attendance)/games AS avg_attendance_2016
FROM homegames AS h INNER JOIN parks AS p USING (park)
			   INNER JOIN team_names_2016 AS t ON h.team = t.teamid
WHERE year = 2016
	AND games >= 10
GROUP BY team, park, games, park_name, t.name
ORDER BY avg_attendance_2016 DESC
LIMIT 5;

------------------------------------------------
--Lowest 5 average attendance--

WITH team_names_2016 AS (SELECT yearid, teamid, name
						 FROM teams
						 WHERE yearid = 2016)
	

SELECT park_name, t.name, SUM(attendance)/games AS avg_attendance_2016
FROM homegames AS h INNER JOIN parks AS p USING (park)
			   INNER JOIN team_names_2016 AS t ON h.team = t.teamid
WHERE year = 2016
	AND games >= 10
GROUP BY team, park, games, park_name, t.name
ORDER BY avg_attendance_2016
LIMIT 5;

