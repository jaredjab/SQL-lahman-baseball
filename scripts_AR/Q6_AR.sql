-- 6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.


WITH stolen_base AS (SELECT playerid, SUM(sb) AS sb_success, SUM(sb)+SUM(cs) AS sb_attempts
					 ,ROUND(SUM(sb)::numeric/(SUM(sb)::numeric+SUM(cs)::numeric)*100,2) AS sb_success_percent
					FROM batting
					WHERE yearid = 2016
					GROUP BY playerid
					HAVING SUM(sb)+SUM(cs) >= 20)
					
SELECT namefirst, namelast, sb_success, sb_attempts, sb_success_percent
FROM people JOIN stolen_base USING(playerid)
ORDER BY sb_success_percent DESC;


--"Chris Owings" 91.30%