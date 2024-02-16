--4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine the number of putouts made by each of these three groups in 2016.

SELECT 
	CASE WHEN pos = 'SS' OR pos = '1B' OR pos = '2B' OR pos = '3B' THEN 'Infield'
		 WHEN pos = 'OF' THEN 'Outfield'
		 WHEN pos = 'P' OR pos = 'C' THEN 'Battery'
		 END AS in_out_bat
		, SUM(po) AS total_po
FROM fielding
WHERE yearid = 2016
GROUP BY in_out_bat
ORDER BY total_po DESC

-- "Infield"	58934
-- "Battery"	41424
-- "Outfield"	29560