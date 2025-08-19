-- Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).

SELECT DISTINCT COALESCE(ships.name, outcomes.ship) AS name 
FROM classes
LEFT JOIN ships ON classes.class = ships.name
LEFT JOIN outcomes ON classes.class = outcomes.ship
WHERE (ships.name IS NOT NULL) OR (outcomes.ship IS NOT NULL)
