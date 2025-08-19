-- Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.

SELECT DISTINCT o1.ship FROM outcomes o1
JOIN battles b1 ON o1.battle = b1.name
WHERE result = 'damaged' 
AND EXISTS(
          SELECT ship FROM outcomes o2
          JOIN battles b2 ON o2.battle = b2.name
          WHERE o1.ship = o2.ship AND b1.date < b2.date
)
