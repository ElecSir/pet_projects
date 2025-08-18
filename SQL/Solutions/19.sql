-- Одной из характеристик корабля является половина куба калибра его главных орудий (mw). С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.

SELECT DISTINCT classes.country,
    (SELECT AVG( pen.p )
    FROM (SELECT (c1.bore*c1.bore*c1.bore)/2 AS p
        FROM classes AS c1, ships AS s1
        WHERE c1.class = s1.class 
            AND c1.country = classes.country 
            AND c1.bore IS NOT NULL
        UNION ALL
        SELECT (c2.bore*c2.bore*c2.bore)/2
        FROM classes AS c2, outcomes
        WHERE c2.country = classes.country 
            AND c2.class = outcomes.ship 
            AND c2.bore IS NOT NULL 
            AND outcomes.ship NOT IN (SELECT ss.name
                                      FROM ships AS ss
                                     )
        ) AS pen
    WHERE pen.p IS NOT NULL
    ) AS weight
FROM classes
WHERE classes.country IS NOT NULL
