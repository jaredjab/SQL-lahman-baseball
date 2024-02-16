-- 8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.


WITH home_attend_2016 AS (SELECT park, team, games, attendance 
						FROM homegames
						WHERE year = 2016
							  AND games >= 10) 
							  
SELECT park_name,name, home_attend_2016.attendance/games AS avg_home_attend
FROM home_attend_2016 JOIN parks USING (park)
					  JOIN teams ON home_attend_2016.team=teams.teamid
WHERE yearid = 2016
ORDER BY avg_home_attend DESC
LIMIT 5;


-- "Dodger Stadium"	"Los Angeles Dodgers"	45719
-- "Busch Stadium III"	"St. Louis Cardinals"	42524
-- "Rogers Centre"	"Toronto Blue Jays"	41877
-- "AT&T Park"	"San Francisco Giants"	41546
-- "Wrigley Field"	"Chicago Cubs"	39906



WITH home_attend_2016 AS (SELECT park, team, games, attendance 
						FROM homegames
						WHERE year = 2016
							  AND games >= 10) 
							  
SELECT park_name,name, home_attend_2016.attendance/games AS avg_home_attend
FROM home_attend_2016 JOIN parks USING (park)
					  JOIN teams ON home_attend_2016.team=teams.teamid
WHERE yearid = 2016
ORDER BY avg_home_attend
LIMIT 5;

-- "Tropicana Field"	"Tampa Bay Rays"	15878
-- "Oakland-Alameda County Coliseum"	"Oakland Athletics"	18784
-- "Progressive Field"	"Cleveland Indians"	19650
-- "Marlins Park"	"Miami Marlins"	21405
-- "U.S. Cellular Field"	"Chicago White Sox"	21559