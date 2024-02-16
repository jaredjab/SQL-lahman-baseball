-- 13. It is thought that since left-handed pitchers are more rare, causing batters to face them less often, that they are more effective. Investigate this claim and present evidence to either support or dispute this claim. First, determine just how rare left-handed pitchers are compared with right-handed pitchers. Are left-handed pitchers more likely to win the Cy Young Award? Are they more likely to make it into the hall of fame?

--left hand pitchers percent
WITH left_hand_pitch AS (SELECT playerid, throws
							FROM people
							WHERE playerid IN 
									(SELECT playerid
									 FROM pitching
									)
									  AND throws = 'L')
									  
SELECT ROUND(COUNT(DISTINCT(left_hand_pitch.playerid))::numeric/COUNT(DISTINCT(pitching.playerid))::numeric*100,2) AS percent_left_hand_pitch
FROM left_hand_pitch FULL JOIN pitching USING(playerid); 

--left and right hand cy young table (includes throwing hand and name)
WITH cy_young_winners AS (WITH left_hand_pitch AS (SELECT playerid, throws
									FROM people
									WHERE playerid IN 
											(SELECT playerid
											 FROM pitching
											)
											  AND throws = 'L'),

						right_hand_pitch AS (SELECT playerid, throws
									FROM people
									WHERE playerid IN 
											(SELECT playerid
											 FROM pitching
											)
											  AND throws = 'R')
		(SELECT playerid, namefirst, namelast, lhp.throws, awardid
		FROM left_hand_pitch AS lhp INNER JOIN awardsplayers USING(playerid)
							 INNER JOIN people USING(playerid)
		WHERE awardid ILIKE '%young%'
		ORDER BY yearid DESC)

		UNION

		(SELECT playerid, namefirst, namelast, rhp.throws, awardid
		FROM right_hand_pitch AS rhp INNER JOIN awardsplayers USING(playerid)
							  INNER JOIN people USING(playerid)
		WHERE awardid ILIKE '%young%'
		ORDER BY yearid DESC))
		
SELECT COUNT(CASE WHEN throws = 'L' THEN throws END) AS left_hand_cy_young_winners,
	   ROUND(COUNT(CASE WHEN throws = 'L' THEN throws END)::float::numeric/COUNT(throws)*100,2) AS left_hand_percent,
	   COUNT(CASE WHEN throws = 'R' THEN throws END) AS right_hand_cy_young_winners,
	   ROUND(COUNT(CASE WHEN throws = 'R' THEN throws END)::float::numeric/COUNT(throws)*100,2) AS right_hand_percent
	   
FROM cy_young_winners;


--hall of famers
WITH hall_of_famers  AS (WITH left_hand_pitch AS (SELECT playerid, throws
									FROM people
									WHERE playerid IN 
											(SELECT playerid
											 FROM pitching
											)
											  AND throws = 'L'),

						right_hand_pitch AS (SELECT playerid, throws
									FROM people
									WHERE playerid IN 
											(SELECT playerid
											 FROM pitching
											)
											  AND throws = 'R')
		(SELECT playerid, namefirst, namelast, lhp.throws
		FROM left_hand_pitch AS lhp INNER JOIN halloffame USING(playerid)
							 INNER JOIN people USING(playerid)
		ORDER BY yearid DESC)

		UNION

		(SELECT playerid, namefirst, namelast, rhp.throws
		FROM right_hand_pitch AS rhp INNER JOIN halloffame USING(playerid)
							  INNER JOIN people USING(playerid)
		ORDER BY yearid DESC))
		
SELECT COUNT(CASE WHEN throws = 'L' THEN throws END) AS left_hof,
	   ROUND(COUNT(CASE WHEN throws = 'L' THEN throws END)::float::numeric/COUNT(throws)*100,2) AS left_hand_percent,
	   COUNT(CASE WHEN throws = 'R' THEN throws END) AS right_hand_hof,
	   ROUND(COUNT(CASE WHEN throws = 'R' THEN throws END)::float::numeric/COUNT(throws)*100,2) AS right_hand_percent
	   
FROM hall_of_famers;



--Comparing ERAs 
WITH left_hand AS (SELECT DISTINCT playerid, throws, era
				FROM people INNER JOIN pitching USING (playerid)
				WHERE throws = 'L'),
				
right_hand AS (SELECT DISTINCT playerid, throws, era 
				FROM people INNER JOIN pitching USING (playerid)
				WHERE throws = 'R')
				
				
SELECT AVG(left_hand.era) AS era_left, AVG(right_hand.era) AS era_right
FROM left_hand FULL JOIN right_hand USING (playerid)


