-- Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).

SELECT classes.class FROM classes
LEFT JOIN ships ON classes.class = ships.class
LEFT JOIN outcomes ON classes.class = outcomes.ship
WHERE (ships.name IS NOT NULL) OR (outcomes.ship IS NOT NULL)
GROUP BY classes.class
HAVING COUNT(COALESCE(ships.name, outcomes.ship)) = 1
