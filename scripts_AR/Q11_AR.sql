-- 11. Is there any correlation between number of wins and team salary? Use data from 2000 and later to answer this question. As you do this analysis, keep in mind that salaries across the whole league tend to increase together, so you may want to look on a year-by-year basis.

SELECT teamid, yearid, w, SUM(salary) AS total_salary, ROUND(1000000*w/SUM(salary)::numeric,2) AS wins_per_million
FROM teams INNER JOIN salaries USING(yearid,teamid)
WHERE yearid = 2016

GROUP BY teamid, yearid, w 
ORDER BY total_salary 