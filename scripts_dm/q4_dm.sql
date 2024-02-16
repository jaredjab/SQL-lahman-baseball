--4. Using the fielding table, group players into three groups based on their position: label players with position OF as "Outfield", 
--those with position "SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C" as "Battery". 
--Determine the number of putouts made by each of these three groups in 2016.

SELECT SUM(po) AS total_po,
	CASE WHEN pos ILIKE '%of%' THEN 'Outfield'
		 WHEN pos ILIKE '%SS%' OR pos ILIKE '%1B%' OR pos ILIKE '%2B%' or pos ILIKE '%3B%' THEN 'Infield' 
	 	 WHEN pos ILIKE '%P%' OR pos ILIKE '%C%' THEN 'Battery' END AS field_position
FROM fielding
WHERE yearid = 2016
GROUP BY 
	CASE WHEN pos ILIKE '%of%' THEN 'Outfield'
		 WHEN pos ILIKE '%SS%' OR pos ILIKE '%1B%' OR pos ILIKE '%2B%' or pos ILIKE '%3B%' THEN 'Infield' 
		 WHEN pos ILIKE '%P%' OR pos ILIKE '%C%' THEN 'Battery' END;

