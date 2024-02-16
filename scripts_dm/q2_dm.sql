--2. Find the name and height of the shortest player in the database. 
--How many games did he play in? What is the name of the team for which he played?

-- Edward Carl Gaedel, 43" Height, 

SELECT DISTINCT(p.playerid), namegiven AS first_name_middle_name, namelast AS last_name, height AS height_in_inches,g_all AS total_games_played, t.name
FROM people AS p INNER JOIN appearances AS a USING (playerid)
				 INNER JOIN teams AS t USING (teamid)
ORDER BY height
LIMIT 1;
