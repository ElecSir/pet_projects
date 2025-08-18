-- Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

SELECT COUNT(*) AS qty FROM (
  SELECT maker, COUNT(model) AS cnt_model FROM product
  GROUP BY maker
  HAVING COUNT(model) = 1
) AS t
