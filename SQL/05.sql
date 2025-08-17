-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.

SELECT DISTINCT maker FROM Product
WHERE type = 'PC' 
AND maker NOT IN(
  SELECT DISTINCT maker FROM product
  WHERE maker IS NOT NULL AND type = 'laptop'
)
