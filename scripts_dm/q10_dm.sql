--10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years,
--and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.

--NEED: ALL PLAYERS, ALL YEARS, their home runs per year, their 2016 home run count, their career highest home run count
--INCLUDE: Players with >= 10 years in the league AND players with >= 1 home run in 2016
--REPORT: Firstname | Lastname | num_2016_hr


WITH players AS ( (SELECT playerid, namefirst, namelast, LEFT(debut,4)::numeric AS debut_year, LEFT(finalgame,4)::numeric AS final_year
						FROM people)

SELECT namefirst, namelast, final_year - debut_year AS years_in_league, yearid, hr
FROM players_decade INNER JOIN batting USING (playerid);





SELECT playerid, SUM(hr)
FROM batting
WHERE playerid = 'zwilldu01'
GROUP BY playerid

ORDER BY playerid DESC

-- 'zwilldu01', 30 hrs







--Mark Trumbo, 47