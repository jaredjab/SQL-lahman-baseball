--5. Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. 
--Do the same for home runs per game. Do you see any trends?

--NEED: TEAMS, yearid, so = strikeouts by batter, soa = strikeouts by pitchers
--INCLUDE: average number of strikeouts per game by decade since 1920, round to 2 decimals
--REPORT COLUMNS: decade | avg_strikeouts

SELECT (yearid/10 || '0')::integer as decade,
			ROUND(SUM(hr)::float::numeric/((SUM(g))::float::numeric/2),2) AS hr_per_game,
			ROUND(SUM(so)::float::numeric/((SUM(g))::float::numeric/2),2) AS so_per_game,
			SUM(g) AS total_games,
			SUM(so) AS total_so,
			SUM(hr) AS total_hr
FROM teams
WHERE yearid > 1919
GROUP BY (yearid/10 || '0')::integer
ORDER BY decade;

--Trend: SOs increased more consistently than HRs through the decades.Overall from 1920 to 2010 there was an exponential increase 
--in the average HRs and SOs per game.



















