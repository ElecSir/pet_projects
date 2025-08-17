-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. Вывести: maker, средний размер экрана.

SELECT p.maker, AVG(l.screen) AS Avg_screen FROM product p
JOIN laptop l
  ON p.model = l.model
GROUP BY maker
