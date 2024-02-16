--3. Find all players in the database who played at Vanderbilt University. 
--Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. 
--Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?

WITH vandyplayers AS (SELECT DISTINCT playerid
					  FROM collegeplaying
					  WHERE schoolid ILIKE '%vandy%')

SELECT namefirst, namelast, SUM(salary)::text::money AS total_salary
FROM vandyplayers AS c INNER JOIN people AS p USING (playerid)
					   INNER JOIN salaries AS s USING (playerid)					
GROUP BY namefirst, namelast
ORDER BY total_salary DESC
LIMIT 1;
