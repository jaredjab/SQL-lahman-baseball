-- Q4 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker
/*
Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.
*/


WITH positions AS (SELECT playerid,
                       CASE WHEN pos = 'OF' THEN 'Outfield'
                            WHEN pos IN ('SS', '1B', '2B', '3B') THEN 'Infield'
                            WHEN pos IN ('P', 'C') THEN 'Battery'
                       END AS position
                   FROM fielding)
SELECT position,
    SUM(po) AS total_putouts
FROM fielding AS f
    JOIN positions AS p USING (playerid)
WHERE yearid = '2016'
GROUP BY position
ORDER BY total_putouts DESC;
-- Number of putouts in 2016 --
     -- Infield:  689,431
     -- Battery:  317,472
     -- Outfield: 285,322