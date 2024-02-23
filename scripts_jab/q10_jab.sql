-- Q10 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker

-- Find all players who hit their career highest number of home runs in 2016. Consider only players who have played in the league for at least 10 years, and who hit at least one home run in 2016. Report the players' first and last names and the number of home runs they hit in 2016.


WITH hr_2016 AS (SELECT playerid,
                        hr AS num_2016_hr
                    FROM batting
                    WHERE yearid = 2016
                        AND hr >= 1)
SELECT namefirst,
    namelast,
    num_2016_hr
FROM batting AS b
    JOIN people AS p USING (playerid)
    JOIN hr_2016 AS h USING (playerid)
WHERE (LEFT(finalgame, 4)::int - LEFT(debut, 4)::int) >= 10
GROUP BY namefirst, namelast, num_2016_hr
HAVING MAX(hr) = num_2016_hr
ORDER BY num_2016_hr DESC;
-- 10+ year players that have hit a home run with their career high homeruns in 2016