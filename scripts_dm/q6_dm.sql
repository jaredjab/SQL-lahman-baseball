--6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of 
--stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) 
--Consider only players who attempted _at least_ 20 stolen bases.

--1353 distinct players in 2016
-- "bournmi01 = ARI 13 + BAL 2 sbs = 15

WITH bases AS (SELECT DISTINCT playerid, SUM(sb::numeric) AS total_stolen, SUM(cs::numeric) AS total_caught, SUM(sb + cs::numeric) AS total_attempts
			   FROM batting
			   WHERE yearid = 2016
			   GROUP BY DISTINCT playerid
 			   ORDER BY playerid)
			   
SELECT namefirst, namelast, ROUND(((total_stolen/total_attempts) * 100),2) AS sb_percentage
FROM bases AS b INNER JOIN people AS p ON b.playerid = p.playerid
WHERE total_stolen >= 20
ORDER BY sb_percentage DESC
LIMIT 1;




