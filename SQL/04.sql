-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

SELECT DISTINCT p.model, price FROM Product p
JOIN pc c
    ON p.model = c.model
WHERE maker = 'B'

UNION ALL

SELECT DISTINCT p.model, price FROM Product p
JOIN laptop c
    ON p.model = c.model
WHERE maker = 'B'

UNION ALL

SELECT DISTINCT p.model, price FROM Product p
JOIN printer c
    ON p.model = c.model
WHERE maker = 'B'
