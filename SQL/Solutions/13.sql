-- Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

SELECT AVG(price) AS avg_price
FROM (
  SELECT pc.price FROM product p
  JOIN pc
    ON p.model = pc.model
  WHERE p.maker = 'A'

UNION ALL

  SELECT l.price FROM product p
  JOIN laptop l
    ON l.model = p.model
  WHERE p.maker = 'A'
) AS t
