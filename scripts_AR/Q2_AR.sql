--2. Find the name and height of the shortest player in the database. How many games did he play in? What is the name of the team for which he played?

SELECT playerid, namefirst, namelast, height, g_all
FROM people JOIN appearances USING(playerid)  
WHERE playerid LIKE 'gaedeed01'

-1

