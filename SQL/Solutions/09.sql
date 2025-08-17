-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК. Вывести: type, model, speed

SELECT DISTINCT type, l.model, speed FROM product p
JOIN laptop l
  ON p.model = l.model
WHERE speed < (
          SELECT MIN(speed) FROM pc
          )
