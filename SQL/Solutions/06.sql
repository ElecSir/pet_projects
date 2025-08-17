-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

SELECT DISTINCT maker FROM product p
JOIN pc c
    ON p.model = c.model
WHERE speed >= 450
