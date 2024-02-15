-- Q5 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker
/*
Find the average number of strikeouts per game by decade since 1920. Round the numbers you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?
*/


SELECT
    CASE WHEN yearid BETWEEN 1870 AND 1879 THEN '1870s'
        WHEN yearid BETWEEN 1880 AND 1889 THEN '1880s'
        WHEN yearid BETWEEN 1890 AND 1899 THEN '1890s'
        WHEN yearid BETWEEN 1900 AND 1909 THEN '1900s'
        WHEN yearid BETWEEN 1910 AND 1919 THEN '1910s'
        WHEN yearid BETWEEN 1920 AND 1929 THEN '1920s'
        WHEN yearid BETWEEN 1930 AND 1939 THEN '1930s'
        WHEN yearid BETWEEN 1940 AND 1949 THEN '1940s'
        WHEN yearid BETWEEN 1950 AND 1959 THEN '1950s'
        WHEN yearid BETWEEN 1960 AND 1969 THEN '1960s'
        WHEN yearid BETWEEN 1970 AND 1979 THEN '1970s'
        WHEN yearid BETWEEN 1980 AND 1989 THEN '1980s'
        WHEN yearid BETWEEN 1990 AND 1999 THEN '1990s'
        WHEN yearid BETWEEN 2000 AND 2009 THEN '2000s'
        WHEN yearid BETWEEN 2010 AND 2019 THEN '2010s'
    END AS decade,
    ROUND(SUM(so) / (SUM(g) / 2.0), 2) AS avg_so_per_game
FROM teams
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade;
-- The average strikeouts per game has tripled from the 1920's to the 2010's