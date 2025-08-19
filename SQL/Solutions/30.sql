-- Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.

SELECT DISTINCT outcomes.ship, displacement, numGuns FROM outcomes
LEFT JOIN ships ON outcomes.ship = ships.name
LEFT JOIN classes ON ships.class = classes.class
WHERE battle = 'Guadalcanal'

UNION

SELECT DISTINCT outcomes.ship, displacement, numGuns FROM outcomes
JOIN classes ON outcomes.ship = classes.class
WHERE battle = 'Guadalcanal'
