-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

SELECT c.class, s.name, c.country FROM ships s
JOIN classes c
    ON s.class = c.class
WHERE c.numGuns >= 10
