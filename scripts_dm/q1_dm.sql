--1. What range of years for baseball games played does the provided database cover? 

SELECT MIN(yearid) AS oldest_year, MAX(yearid) AS most_recent_year
FROM teams;
