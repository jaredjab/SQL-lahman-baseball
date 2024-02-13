-- Q3 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker
/*
Find all players in the database who played at Vanderbilt University. Create a list showing each player’s first and last names as well as the total salary they earned in the major leagues. Sort this list in descending order by the total salary earned. Which Vanderbilt player earned the most money in the majors?
*/


SELECT schoolid FROM schools
WHERE schoolname ILIKE '%vanderbilt%'; -- Finds Vanderbilt schoolid


SELECT namefirst,
    namelast,
    schoolid,
    SUM(salary)::text::money AS total_mlb_salary
FROM collegeplaying AS cp
    JOIN schools AS sc USING (schoolid)
    JOIN people AS pp USING (playerid)
    JOIN salaries AS sa USING (playerid)
WHERE schoolid = 'vandy'
GROUP BY namefirst, namelast, schoolid
ORDER BY total_mlb_salary DESC;
-- David Price: $245,553,888.00