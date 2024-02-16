--7. From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? What is the smallest number 
-- of wins for a team that did win the world series? Doing this will probably result in an unusually small number of wins for a world 
-- series champion – determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 was it 
-- the case that a team with the most wins also won the world series? What percentage of the time?

WITH most_wins AS (SELECT yearid, MAX(w) AS most_wins_no_ws
				   FROM teams
				   WHERE yearid BETWEEN 1970 AND 2016
				   AND wswin = 'N'
				   GROUP BY yearid
				   ORDER BY most_wins_no_ws DESC
				   LIMIT 1)

SELECT yearid, most_wins_no_ws, name
FROM most_wins AS m INNER JOIN teams AS t USING (yearid)
	WHERE w = most_wins_no_ws
LIMIT 1

-- Largest number of wins for a team that did not win the world series: 2001, 116 wins, "Seattle Mariners"

WITH least_wins AS (SELECT yearid, MIN(w) AS least_wins_ws
				   FROM teams
				   WHERE yearid BETWEEN 1970 AND 2016
				   	AND wswin = 'Y'
				   GROUP BY yearid
				   ORDER BY least_wins_ws)
				   
				 
SELECT yearid, name, least_wins_ws
FROM least_wins AS m INNER JOIN teams AS t USING (yearid)
	WHERE w = least_wins_ws
		AND teamid NOT LIKE 'LAN'
ORDER BY least_wins_ws
LIMIT 1


-- Smallest number of wins for a team that did win the world series: "St. Louis Cardinals", 3 wins
-- The 1981/63 games won/LAN and still meeting the criteria was due to a strike that year

-- How often from 1970 – 2016 was it the case that a team with the most wins also won the world series? What percentage of the time?

WITH most_wins AS (SELECT yearid, MAX(w) AS most_wins_total
					FROM teams
					WHERE yearid BETWEEN 1970 AND 2016
					GROUP BY yearid
					ORDER BY yearid)
					
SELECT ROUND((COUNT(yearid)::numeric / 46 * 100),2) AS percent_of_time_no_wins
FROM most_wins AS m INNER JOIN teams AS t USING (yearid)
WHERE wswin = 'Y'
 AND most_wins_total = w
 

--26.09%


