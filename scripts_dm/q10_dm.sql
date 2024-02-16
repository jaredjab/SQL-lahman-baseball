--10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years,
--and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.

--NEED: ALL PLAYERS, ALL YEARS, their home runs per year, their 2016 home run count, their career highest home run count
--INCLUDE: Players with >= 10 years in the league AND players with >= 1 home run in 2016
--REPORT: Firstname | Lastname | num_2016_hr


WITH players AS (SELECT playerid, namefirst, namelast
				 FROM people
				 WHERE (LEFT(finalgame,4)::int - LEFT(debut,4)::int)>= 10),

	 hr_2016 AS (SELECT playerid,hr AS num_2016_hr
				 FROM batting
				 WHERE yearid = 2016
					AND hr >= 1)

SELECT namefirst, namelast, num_2016_hr
FROM batting AS b 
	JOIN players AS p USING (playerid)
	JOIN hr_2016 AS h USING (playerid)
GROUP BY namefirst, namelast, num_2016_hr
HAVING MAX(hr) = num_2016_hr
ORDER BY num_2016_hr DESC;
				 
				 
				 
				 
				 