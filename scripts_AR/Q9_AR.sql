--9. Which managers have won the TSN Manager of the Year award in both the National League (NL) and the American League (AL)? Give their full name and the teams that they were managing when they won the award.

WITH nl_al_winners AS (WITH nl AS (SELECT playerid, lgid,yearid
									 FROM awardsmanagers
									 WHERE awardid ILIKE '%TSN%'
										  AND lgid ILIKE '%NL%'),

							al  AS (SELECT playerid, lgid, yearid
										FROM awardsmanagers
										WHERE awardid ILIKE '%TSN%'
										AND lgid ILIKE '%AL%')

								SELECT nl.playerid,  nl.yearid, nl.lgid
								FROM nl INNER JOIN al USING(playerid)
								UNION
								SELECT al.playerid, al.yearid, al.lgid
								FROM nl INNER JOIN al USING(playerid)
								ORDER BY playerid, yearid)

SELECT namefirst, namelast, na.yearid AS year_won, na.lgid AS league_won, teamid
FROM nl_al_winners AS na JOIN people AS p USING(playerid)
						 JOIN managers AS m USING(playerid,yearid)
						 
ORDER BY playerid, yearid;			


