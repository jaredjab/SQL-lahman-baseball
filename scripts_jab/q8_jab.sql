-- Q8 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker

-- Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games). Only consider parks where there were at least 10 games played. Report the park name, team name, and average attendance. Repeat for the lowest 5 average attendance.


WITH highest AS (SELECT park,
                    team,
                    attendance / games AS highest_avg_attendance
                FROM homegames AS h
                WHERE year = 2016
                    AND games >= 10
                ORDER BY highest_avg_attendance DESC
                LIMIT 5)

,  teamnames AS (SELECT teamid, name AS team_name
                FROM teams
                WHERE yearid = 2016)
                
SELECT park_name,
    team_name,
    highest_avg_attendance
FROM highest AS h
    JOIN teamnames AS t ON h.team = t.teamid
    JOIN parks AS p USING(park)
ORDER BY highest_avg_attendance DESC;
-- Top 5 average attendance per game in 2016


WITH lowest AS (SELECT park,
                    team,
                    attendance / games AS lowest_avg_attendance
                FROM homegames AS h
                WHERE year = 2016
                    AND games >= 10
                ORDER BY lowest_avg_attendance
                LIMIT 5)

,  teamnames_2016 AS (SELECT teamid, name AS team_name
                FROM teams
                WHERE yearid = 2016)
                
SELECT park_name,
    team_name,
    lowest_avg_attendance
FROM lowest AS l
    JOIN teamnames_2016 AS t ON l.team = t.teamid
    JOIN parks AS p USING(park)
ORDER BY lowest_avg_attendance;
-- Bottom 5 average attendance per game in 2016