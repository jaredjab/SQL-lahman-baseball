-- 10. Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.

--Career high in HRs in 2016
--At least 10 years in league, >= 1 hr in 2016
--Final table: namefirst, namelast, # of home runs in 2016

WITH ranking_hr_years AS (SELECT playerid
						, yearid
						, hr
						, RANK() OVER(PARTITION BY playerid ORDER BY hr DESC) AS rank  
						FROM batting
						ORDER BY playerid, yearid, rank),
						
total_years_played AS (SELECT playerid
					   		, namefirst
					   		, namelast
					   		, left(finalgame,4)::numeric - left(debut,4)::numeric AS total_years_played
					        --, DATE_PART('year', finalgame::date)- DATE_PART('year', debut::date) AS total_years_played
						FROM people)
		
		SELECT playerid, namefirst, namelast, yearid, hr, rank, total_years_played
		FROM ranking_hr_years INNER JOIN total_years_played USING (playerid)
		WHERE yearid = 2016
			  AND rank = 1
			  AND hr > 0
			  AND total_years_played >= 10
		ORDER BY hr DESC;

