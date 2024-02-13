-- Q1 -- Lahman Baseball Project -- The Hackstreet Boys -- Jared Baker
/*
What range of years for baseball games played does the provided database cover?
*/


SELECT MIN(yearid) AS earliest_year,
    MAX(yearid) AS latest_year
FROM teams
UNION
SELECT MIN(yearid) AS earliest_year,
    MAX(yearid) AS latest_year
FROM appearances
UNION
SELECT MIN(year) AS earliest_year,
    MAX(year) AS latest_year
FROM homegames
UNION
SELECT MIN(yearid) AS earliest_year,
    MAX(yearid) AS latest_year
FROM pitching;
-- The database contains 1871 - 2016 baseball data (Provided documentation incorrectly states 1871 - 2022)