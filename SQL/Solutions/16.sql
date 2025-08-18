-- Для каждого типа продукции и каждого производителя из таблицы Product c точностью до двух десятичных знаков найти процентное отношение числа моделей данного типа данного производителя к общему числу моделей этого производителя.
Вывод: maker, type, процентное отношение числа моделей данного типа к общему числу моделей производителя

WITH CombinedTypes AS (
                  SELECT DISTINCT p1.maker, p2.type FROM product p1
                  CROSS JOIN (SELECT DISTINCT type FROM product) AS p2
),
TotalCount AS (
            SELECT maker, COUNT(model) AS total_count FROM product
            GROUP BY maker
),
ModelCount AS (
            SELECT maker, type, COUNT(model) AS model_count FROM product
            GROUP BY maker, type
)

SELECT 
  ct.maker, 
  ct.type,  
  CASE
    WHEN mc.model_count IS NULL THEN .00
    ELSE ROUND(100 * mc.model_count / tc.total_count, 2)
  END AS prc
FROM CombinedTypes ct
JOIN TotalCount tc ON ct.maker = tc.maker
LEFT JOIN ModelCount mc ON ct.maker = mc.maker AND ct.type = mc.type
