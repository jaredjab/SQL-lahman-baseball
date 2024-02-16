-- 3. Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?

WITH mlb AS (SELECT playerid, namefirst, namelast
				FROM people),

	 vandy AS (SELECT playerid
				   FROM collegeplaying
				   WHERE schoolid ILIKE '%Vand%'),

	 salaries AS (SELECT playerid, salary, yearid
						FROM salaries
					ORDER BY playerid, yearid)

SELECT namefirst, namelast, SUM(salary)::text::money AS total_salary_earned
FROM mlb JOIN salaries USING (playerid)
WHERE playerid IN (
		SELECT playerid
		FROM vandy)
GROUP BY namefirst, namelast
ORDER BY total_salary_earned DESC;

--"David Price"	"$81,851,296.00"


	   