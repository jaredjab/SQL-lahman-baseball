-- Q2 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker

-- Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?



SELECT playerid, namefirst, namelast, height
FROM people
ORDER BY height
LIMIT 1;
-- Eddie Gaedel, 43 inches (3' 7")


SELECT playerid,
    G_all AS total_games_played,
    name AS team_name
FROM appearances AS a
    JOIN teams AS t USING (teamID)
WHERE playerid = (SELECT playerid
                 FROM people
                 ORDER BY height
                 LIMIT 1)
GROUP BY playerid, total_games_played, team_name;
-- Eddie Gaedel played in 1 game for the St. Louis Browns