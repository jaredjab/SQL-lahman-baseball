-- Q3 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker
/*
Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
*/


WITH vandyplayers AS (
    SELECT DISTINCT playerid 
    FROM collegeplaying
    WHERE schoolid = 'vandy')

SELECT namefirst,
    namelast,
    SUM(salary)::text::money AS total_mlb_salary
FROM vandyplayers AS vp
    JOIN people AS pp USING (playerid)
    JOIN salaries AS sa USING (playerid)
GROUP BY namefirst, namelast
ORDER BY total_mlb_salary DESC;
-- David Price: $81,851,296.00
